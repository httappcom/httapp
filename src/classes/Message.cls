/*
 * this class will support the message object and help display, retrieve,
 * and save data to the message data model.
 * author mfullmore
*/

public class Message {
  

  public static List<Message.MsgResult> getUserMessages(User pUser) {
    if (pUser == null) {
      return null;
    } else {
      return Message.getMessagesById(pUser.Id);
    }
  }
  
  private static List<Message.MsgResult> getMessagesById(Id pUserId) {
    List<Message_User__c> msgUsers;
    Set<Id> msgHeaderIds = new Set<Id>();
    List<Message_Header__c> msgHeaders;
    Message.MsgResult result;
    List<Message.MsgResult> results = new List<Message.MsgResult>();

    if (pUserId == null) {
      
      return null; 
    } else {
      msgUsers = [select Id,
                         Message_Header__c
                  from Message_User__c
                  where User__c = :pUserId];
                  
      for (Message_User__c msgUser : msgUsers) {
        msgHeaderIds.add(msgUser.Message_Header__c);
      }
                  
      msgHeaders = [select Id,
                           Name,
                           (select Id,
                                   Body_Rich_Text__c,
                                   Truncated_Body__c,
                                   Priority__c,
                                   IsRead__c
                            from Messages__r),
                           (select Id,
                                   User__c,
                                   User__r.Name
                            from Message_Users__r)
                    from Message_Header__c
                    where Id in :msgHeaderIds];
      
      for (Message_Header__c msgHeader : msgHeaders) {
        
        result = new Message.MsgResult(msgHeader,
          msgHeader.Messages__r,
          msgHeader.Message_Users__r);
          
          results.add(result);
      }
    }
    return results;
  }
  
  public static Boolean createMessage(Message__c pMsg, List<User> pUsers) {
    Message_Header__c msgHeader;
    Message_User__c tmpMsgUser;
    List<Message_User__c> msgUsers = new List<Message_User__c>();
    
    if (pMsg == null || pUsers == null) {
      return false;
    }
    
    msgHeader = new Message_Header__c();
    insert msgHeader;
    
    for (User u : pUsers) {
      tmpMsgUser = new Message_User__c(
        Message_Header__c = msgHeader.Id,
        User__c = u.Id
      );
      
      msgUsers.add(tmpMsgUser);
    }
    
    if (msgUsers.size() > 0) {
      insert msgUsers;
    } else {
      return false;
    }
    
    pMsg.Message_Header__c = msgHeader.Id;
    insert pMsg;
    
    return true;
    
  }
  
  public static Boolean addToMessage(Message_Header__c pMsgHeader,
      Message__c pMessage) {
  
    if (pMsgHeader == null || pMessage == null) {
      return false;
    }
    
    pMessage.Message_Header__c = pMsgHeader.Id;
    insert pMessage;
    return true;
  }
  
  public static Boolean addToMessage(Id pMsgHeaderId,
      Message__c pMessage) {
  
    if (pMsgHeaderId == null || pMessage == null) {
      return false;
    }
    
    pMessage.Message_Header__c = pMsgHeaderId;
    insert pMessage;
    return true;
  }
  

  public class MsgResult {
    public Message_Header__c msgHeader { get; private set; }
    public List<Message__c> msgs { get; private set; }
    public List<Message_User__c> users { get; private set; }

    public MsgResult(Message_Header__c pMessageHeader,
      List<Message__c> pMessages,
      List<Message_User__c> pUsers) {
    
      this.msgHeader = pMessageHeader;
      this.msgs = pMessages;
      this.users = pUsers;
    }
  }
}