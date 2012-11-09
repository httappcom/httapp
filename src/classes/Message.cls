/*
 * this class will support the message object and help display, retrieve,
 * and save data to the message data model.
 * author mfullmore
*/

public class Message {
  

  public static List<Message.MsgResult> getUserMessages(User pUser) {
    Message_Header__c msgHeader;
    List<Message.MsgResult> results;

    if (pUser == null) {
      
      return null; 
    } else {
      msgHeader = [select Id,
                          Name,
                          Users__c,
                          (select Id,
                                  Body_Rich_Text__c,
                                  Truncated_Body__c,
                                  Priority__c,
                                  IsRead__c
                          from Messages__r)
                   from Message_Header__c];
                   //where Users__c like '%' : pUser.Id];

        
    }
    return results;
  }

  public class MsgResult {
    public Message_Header__c msgHeader { get; private set; }
    public List<Message__c> msgs { get; private set; }
    public List<User> users { get; private set; }

    public MsgResult(Message_Header__c pMessageHeader,
      List<Message__c> pMessages,
      List<User> pUsers) {
    
      this.msgHeader = pMessageHeader;
      this.msgs = pMessages;
      this.users = pUsers;
    }
  }
}

