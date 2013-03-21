public with sharing class QuoteUtility {
    
    public Patient__c patient { get; set; }
    public Treatment_Quote__c treatmentQuote { get; set; }
    
    public static Treatment_Quote__c queryQuoteForQuoteDoc(Id pQuoteId) { 
      if(pQuoteId == null) {          
        return null;
      } else {           
        return [Select id,
                        Total_Price__c,
                        Treatment__r.Name,
                        Treatment__r.Procedure__c, 
                        Treatment__r.Patient__r.Name,
                        Treatment__r.Assigned_To__r.Name,                        
                        Arrival_Date__c,
                        Departure_Date__c,
                        Number_of_Hospital_Nights__c,
                        Hotel_Nights_Included__c,
                        Hotel_Nights_Needed__c,
                        Ground_Transportation_Included__c,
                        Procedure__r.Facility__r.Name,
                        Procedure__r.Doctor__r.Name,
                        Procedure__r.Price__c
                    from Treatment_Quote__c 
                    where id = :pQuoteId];               
      }  
   }


  private static String getQuoteDocumentFilename(Treatment__c t) 
  {
    return 'Nuehealth Medical Treatment Quote for ' + t.Patient__r.Name;
return '';
  }  
  
  private static String getQuoteDocumentBinary(Treatment__c t) 
  {
    PageReference quoteDocument = Page.Quote;
    quoteDocument.getParameters().put('id', t.Treatment_Quotes__r[0].id);
    quoteDocument.setRedirect(true);
    return EncodingUtil.base64Encode(quoteDocument.getContentAsPDF());
  }
  
  private static Treatment__c queryTreatmentForEchosignDoc(Treatment__c t) 
  {
        if(t == null) 
        {          
            return null;
        }
       else 
        {   
           t = [SELECT  id,
                        Patient__r.Name,
                        Patient__r.Email__c,
                        (SELECT id, echosignDocKey__c, Doc_Signed_Timestamp__c FROM Treatment_Quotes__r ORDER BY CreatedDate DESC LIMIT 1)
            from Treatment__c where id = :t.id];
            return t;
        } 
  }
  
	public static void sendQuoteToEchosign(Treatment__c treatment) {
system.debug('Sending Quote to echosign');
    
//    	treatment = queryTreatmentForEchosignDoc(treatment);
    	String echoSignSetting = 'Nuehealth';
    	String apiKey = echoSignAPI__c.getValues(echoSignSetting).API_Key__c;   
        
    	//Set up SenderInfo object
    	dtoApiEchosign.SenderInfo quoteSenderInfo = new dtoApiEchosign.SenderInfo();
    	User u = [Select Id, EchoSign_Acct_Email__c from User where Id = :UserInfo.getUserId()];
    	quoteSenderInfo.email = u.EchoSign_Acct_Email__c == null ? echoSignAPI__c.getValues(echoSignSetting).Email__c : u.EchoSign_Acct_Email__c ;
    	//Set up DocumentCreationInfo object
    	dtoApiEchosign.DocumentCreationInfo quoteDocCrInfo = new dtoApiEchosign.DocumentCreationInfo();
    	quoteDocCrInfo.name = getQuoteDocumentFilename(treatment);
    	//Set up RecipientInfo object - part of DocumentCreationInfo object
    	dto14ApiEchosign.RecipientInfo quoteDocRecInfo = new dto14ApiEchosign.RecipientInfo();
    	quoteDocRecInfo.email = treatment.Patient__r.Email__c;
    	Logger.info('quoteDocRecInfo.email = ' + quoteDocRecInfo.email);
    	quoteDocRecInfo.role = 'SIGNER';
    	dto14ApiEchosign.ArrayOfRecipientInfo quoteDocRecipients = new dto14ApiEchosign.ArrayOfRecipientInfo();
    	quoteDocRecipients.RecipientInfo = new List<dto14ApiEchosign.RecipientInfo>();
      	quoteDocRecipients.RecipientInfo.add(quoteDocRecInfo);
    	quoteDocCrInfo.recipients = quoteDocRecipients;
    	dtoApiEchosign.FileInfo quoteDocFileInfo = new dtoApiEchosign.FileInfo();
    	quoteDocFileInfo.fileName = quoteDocCrInfo.name;
    	quoteDocFileInfo.file = getQuoteDocumentBinary(treatment);
    	quoteDocFileInfo.mimeType = 'application/pdf';
    	dtoApiEchosign.ArrayOfFileInfo quoteDocFileInfoArray = new dtoApiEchosign.ArrayOfFileInfo();
    	quoteDocFileInfoArray.FileInfo = new List<dtoApiEchosign.FileInfo>();
    	quoteDocFileInfoArray.FileInfo.add(quoteDocFileInfo);
    	quoteDocCrInfo.fileInfos = quoteDocFileInfoArray;
    	quoteDocCrInfo.signatureType = 'ESIGN';
    	quoteDocCrInfo.signatureFlow = 'SENDER_SIGNATURE_NOT_REQUIRED';
    	quoteDocCrInfo.message = 'Please review your attached Nuehealth medical treatment quote.';
    	IF (treatment.Treatment_Quotes__r[0].Expiration_Date__c != null) {
    		Date today = Date.today();
	    	quoteDocCrInfo.daysUntilSigningDeadline = today.daysBetween(treatment.Treatment_Quotes__r[0].Expiration_Date__c);
    	}
    	apiEchosign.EchoSignDocumentService15HttpPort echoSignDoc = new apiEchosign.EchoSignDocumentService15HttpPort();
    	try {
        	dtoApiEchosign.ArrayOfDocumentKey echosignResults = echoSignDoc.sendDocument(apiKey, quoteSenderInfo, quoteDocCrInfo);
        	if (echosignResults.DocumentKey[0].documentKey != null) {
  system.debug('got echosign doc key='+echosignResults.DocumentKey[0].documentKey);
            	Logger.info('Document key returned: ' + echosignResults.DocumentKey[0].documentKey);
            	treatment.Treatment_Quotes__r[0].echosignDocKey__c = echosignResults.DocumentKey[0].documentKey;
            	update treatment.Treatment_Quotes__r[0];
            	treatment.Quote_Status__c = PickListDefines.QuoteStatus.AwaitingSignature;
   system.debug('Updating quote status to awaiting signature, key='+echosignResults.DocumentKey[0].documentKey);
//            	update treatment; //Assume treatment updated by function caller
        	}
    	} catch(CalloutException ce) {
       		Logger.info(ce.getStackTraceString());
       		ServerLogUtility.updateServerLog('EchoSign', ce.getmessage());
       		throw new NueException('Unable to send to EchoSign - Please try later or contact an administrator.');
    	} catch(Exception e) {
       		Logger.info(e.getStackTraceString());
       		throw e;
    	}
  	}
  
	public static Treatment__c pollEchoSignDocInfo(Treatment__c treatment, Treatment_Quote__c quote) {
		system.debug('pollEchoSignDocInfo');
    if ( (quote.echosignDocKey__c != null) && (quote.Doc_Signed_Timestamp__c == null) )
    {
        String echoSignSetting = 'Nuehealth';
      String apiKey = echoSignAPI__c.getValues(echoSignSetting).API_Key__c;
        apiEchosign.EchoSignDocumentService15HttpPort echoSignDoc = new apiEchosign.EchoSignDocumentService15HttpPort();
        dto15ApiEchosign.DocumentInfo echoSignDocInfo = new dto15ApiEchosign.DocumentInfo();
        try 
        {           
          echoSignDocInfo = echoSignDoc.getDocumentInfo(apiKey, quote.echosignDocKey__c);   
        }
        catch(CalloutException ce)
        {
           Logger.info(ce.getStackTraceString());
           ServerLogUtility.updateServerLog('EchoSign', ce.getmessage());
        }   
        catch(Exception e)
        {
           Logger.info(e.getStackTraceString());
           ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
           throw e;
        }
        if (echoSignDocInfo.status == 'SIGNED')
        {
            treatment.Quote_Status__c = PickListDefines.QuoteStatus.Signed;
            update treatment;
            for ( dto15ApiEchosign.DocumentHistoryEvent docEvent : echoSignDocInfo.events.DocumentHistoryEvent)
            {
              if (docEvent.type_x == 'APPROVED') 
              { 
                    quote.Doc_Signed_Timestamp__c = docEvent.date_x;
                    update quote;
              }
            } 
        }
        else if (echoSignDocInfo.status == 'ABORTED')
        {
            treatment.Quote_Status__c = PickListDefines.QuoteStatus.Rejected;
            update treatment;
        }
        else if (echosignDocInfo.status == 'EXPIRED')
        {
            treatment.Quote_Status__c = PickListDefines.QuoteStatus.Expired;
            update treatment;
        }
    }
    
    return null;
  }

	public static void debugDocQuery() {
  //R8PA8YX525RXTX
        String echoSignSetting = 'Nuehealth';
      	String apiKey = echoSignAPI__c.getValues(echoSignSetting).API_Key__c;
        apiEchosign.EchoSignDocumentService15HttpPort echoSignDoc = new apiEchosign.EchoSignDocumentService15HttpPort();
        dto15ApiEchosign.DocumentInfo echoSignDocInfo = new dto15ApiEchosign.DocumentInfo();
        try 
        {           
          echoSignDocInfo = echoSignDoc.getDocumentInfo(apiKey, 'R8PA8YX525RXTX');
          Logger.info('Echosign debugDocQuery worked.');
        }
        catch(CalloutException ce)
        {
           Logger.info(ce.getStackTraceString());
           ServerLogUtility.updateServerLog('EchoSign', ce.getmessage());
           throw new NueException('Echosign communication failure.');
        }   
        catch(Exception e)
        {
           Logger.info(e.getStackTraceString());
           ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
           throw e;
        }
	}
}