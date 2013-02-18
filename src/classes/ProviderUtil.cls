public with sharing class ProviderUtil {
    
    public static void createProviderPortalUser (string medicalProfessionalID) 
    {
    	
        Medical_Professional__c medicalProfessional = [select Id,
										                                        Name, 
										                                        First_Name__c, 
										                                        Last_Name__c, 
										                                        Email__c 
										                                    from Medical_Professional__c 
										                                    where id = :medicalProfessionalID];
        
        Account a = new Account();
        a.name = medicalProfessional.Name;
        insert a;
        
        Contact c = new Contact();
        c.firstname = medicalProfessional.First_Name__c;
        c.lastname = medicalProfessional.Last_Name__c;
        c.email = medicalProfessional.Email__c;
        c.accountid = a.id;
        
        insert c;
        
        medicalProfessional.Key_Contact__c = c.id;
        update medicalProfessional;        
        futureCreatePortalUser(medicalProfessionalID); 
    }
 
    @future
    public static void futureCreatePortalUser(string medicalProfessionalID) 
    { 
      Medical_Professional__c medicalProfessional = [select Id,
                                                            Name, 
                                                            First_Name__c, 
                                                            Last_Name__c, 
                                                            Email__c,
                                                            Key_Contact__c 
                                                        from Medical_Professional__c 
                                                        where id = :medicalProfessionalID];
        
        
        User u = new User();
        string username = medicalProfessional.First_Name__c.substring(0,1);
        username+=medicalProfessional.Last_Name__c;
        username+= '00'; 
        username.replace(' ','_');
        
        u.firstname = medicalProfessional.First_Name__c;
        u.lastname = medicalProfessional.Last_Name__c;
        u.Alias = username.substring(0,5)+username.substring(username.length()-2,username.length());
        u.Username = username+='@doctor.htt.com';
        u.Email = medicalProfessional.email__c;
        u.CommunityNickname = username; 
        u.TimeZoneSidKey = 'America/Tijuana';
        u.LocaleSidKey = 'en_US';
        u.EmailEncodingKey ='UTF-8';
        u.LanguageLocaleKey ='en_US';
        u.ContactId = medicalProfessional.key_contact__c;
        u.ProfileId = [select id from Profile where name = 'providerPortal'].id;
        Database.SaveResult result = Database.Insert(u);    
        if (result.isSuccess()) {
            //send email to patient
/*          
            messaging.Singleemailmessage msg = new messaging.singleEmailMessage();
            msg.setToAddresses(new list<string>{patient.email__c});
            msg.setSubject('Welcome to your Health Travel Guides Portal Account');
            msg.setSenderDisplayName('Health Travel Guides');
            string plainbody;
            plainbody='Hello '+patient.patient_first_name__c+',\n\n';
            plainbody+='Welcome to the Health Travel Guides Portal Account.';
            plainbody+=' You will receive your login information shortly.';
            plainbody+='\n\nYou may login at the following page:\n\n';
            plainbody+='Login page: http:\\\\htt.force.com\n\n';
            plainbody+=' After your first login, you will be required to change your password.\n\n';
            msg.setPlainTextBody(plainbody);
            msg.setHtmlBody(plainbody.replace('\n','<br/>'));            
            messaging.sendemail(new list<Messaging.email>{msg});
*/
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(medicalProfessional.Key_Contact__c);
//        mail.setWhatId(treatment.Id);
        mail.setTemplateId([Select Id, DeveloperName, Name from EmailTemplate where Id = '00Xd0000000X9lb' ].Id);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  
                                        
            system.resetPassword(u.id, true);               
        }                           
        else {
            //notify an admin of failure
        }
    }        

}