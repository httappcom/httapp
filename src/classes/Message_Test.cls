/*
 * test class to test the message class
*/

@isTest
private class Message_Test {

  static testMethod void testMessage() {
    Profile pro = [select Id from Profile where Name = 'Standard User'];
    User testUser;
    List<Message.MsgResult> results;
    
    List<User> testUsers = new List<User>();
    
    for (Integer i = 0; i < 3; i++) {
       testUser = new User(FirstName = 'Test',
         LastName = 'User' + String.valueOf(i),
         UserName = 'test' + String.valueOf(Math.random()) + '@htt.com',
         Email = 'test@test.com',
         ProfileId = pro.Id,
         LanguageLocaleKey = 'en_US',
         LocaleSidKey = 'en_US',
         TimeZoneSidKey = 'America/Los_Angeles',
         EmailEncodingKey = 'ISO-8859-1',
         Alias = 'test');
    
      testUsers.add(testUser);
    }
    
    insert testUsers;
    
    for (Integer i = 0; i < 2; i++) {
      System.assert(
        Message.createMessage(
          new Message__c(
            Body_Rich_Text__c = 'Test body' + i,
            Priority__c = 'Medium'
          ),
          testUsers
        )
      );
    }
    
    results = Message.getUserMessages(testUsers[0]);
    System.assert(results[0].msgs[0].Body_Rich_Text__c.contains('Test body'));
      
        
    
     
      
  
  }
}