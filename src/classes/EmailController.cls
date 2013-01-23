public with sharing class EmailController {
  public EmailController()
  {  	
  }
  public PageReference sendManualEmail(EmailTemplate template, Patient__c recipient)
  {
  	Logger.info('Email Template: ' + template);
  	Logger.info('Recipient: ' + recipient);
    return null;
  } 
}