public with sharing class EmailController {
	Id eTemplate = null;
	public static PRM_Config__c PRMConfig = new PRM_Config__c();
	public static Map<Id, String> templateMap = new Map<Id, String>();
  public PRM_Config__c getPRMConfig()
  {
  	cachePRMConfig();
  	return PRMConfig;
  }	

	public Id patientId;
	
	 public void setPatientId(Id i)
		{
	    patientId = i;
	  }
  public Id getPatientId()  	
	  {
	    return patientId;
	  }

  public Id treatmentId; 
   public void setTreatmentId(Id i)
    {
      treatmentId = i;
    }
  public Id getTreatmentId()    
    {
      return treatmentId;
    }
  public Treatment__c treatment;
  public void setTreatment(Id i)
  {
  	treatment = [Select Id, Destination_Facility__c From Treatment__c Where Id = :i ];
  }
  public Treatment__c getTreatment()
  {
  	return treatment;
  }
   public Id treatmentSummaryId; 
   public void setTreatmentSummaryId(Id i)
    {
      treatmentId = i;
      setTreatmentSummary(i);
    }
  public Id getTreatmentSummaryId()    
    {
      return treatmentId;
    }  
  public Treatment__c treatmentSummary;
  public void setTreatmentSummary(Id i)
  {
    treatmentSummary = [Select Patient__r.Name,
                               Procedure_Date__c,                                
                               Destination_Facility__r.Name,
                               (Select  Total_Price__c,
                                        Procedure__r.Name,
                                        Procedure__r.Details__c,
                                        Procedure__r.Doctor__r.Name,
                                        Procedure__r.Facility__r.Name 
                                from Treatment_Quotes__r Order By CreatedDate DESC LIMIT 1)
                         From Treatment__c Where Id = :i ];                        
  }
  public Treatment__c getTreatmentSummary()
  {
    return treatmentSummary;
  }  
  
	public static String Instance {
	    public get {
	        if (Instance == null) {
	            //
	            // Possible Scenarios:
	            //
	            // (1) ion--test1--nexus.cs0.visual.force.com  --- 5 parts, Instance is 2nd part
	            // (2) na12.salesforce.com      --- 3 parts, Instance is 1st part
	            // (3) ion.my.salesforce.com    --- 4 parts, Instance is not determinable
	
	            // Split up the hostname using the period as a delimiter
	            List<String> parts = System.URL.getSalesforceBaseUrl().getHost().replace('-api','').split('\\.');
	            if (parts.size() == 3) Instance = parts[0];
	            else if (parts.size() == 5) Instance = parts[1];
	            else Instance = null;
	        } return Instance;
	    } private set;
	}  
  public String medProfileLinkURL;
  public String getmedProfileLinkURL()
  { 
  	return surveyGizmoUtil.generateMedicalProfileLink(patientId);
  }
  public String patientPortalURL;
  public String getPatientPortalURL()
  { 
  	return 'https://' + getPatientPortalDomain();
  }
  public static String getPatientPortalDomain() {
  	List<Site> patientPortal = [Select Subdomain From Site Where MasterLabel = 'Patient Portal' ];
    String patientPortalSubdomain = patientPortal.size()>0?patientPortal[0].Subdomain:'';  	
  	return patientPortalSubdomain + '.' + Instance + '.force.com';
  }
  public String satisfactionSurveyURL;
  public String getSatisfactionSurveyURL()
  { 
    return surveyGizmoUtil.generateSatisfactionSurveyLink(treatmentId);
  }
  public String resource_URL;
  public void setResource_URL(String s)
  {
  	resource_URL = s;
  }
  public Id getResource_URL()
  {
  	return resource_URL;
  }
  public String PRM_Config_field;
  public void setPRM_Config_field(String s)
  {
    PRM_Config_field = s;
  }
  public Id getPRM_Config_field()
  {
    return PRM_Config_field;
  }  
  public String getimage_url()
  {
    string linkurl = '';
    if (PRM_Config_field != null)
    {
	    	string oid = userinfo.getOrganizationId();
	    	linkurl += 'https://' + Instance;
	    	linkurl += '.salesforce.com/servlet/servlet.ImageServer?id=' + getPRM_field_value();
	    	linkurl += '&oid=' + oid;
    }
    else if (resource_URL != null)
    {
    	linkurl += BrandingUtil.patientPortalLink();
    	linkurl += resource_URL;
    }
    return linkurl;
  }  
  private void cachePRMConfig()
  {
  	
  	PRM_Config__c emptyConfig = new PRM_Config__c();
  	if (PRMConfig == emptyConfig) //Cache the PRMConfig object for subsequent calls
  	{
  		Logger.info('Setting up PRMConfig');
	  	Map<String, Schema.SObjectField> fldObjMap = schema.SObjectType.PRM_Config__c.fields.getMap();
	    List<Schema.SObjectField> fldObjMapValues = fldObjMap.values();
	    String queryString = 'SELECT ';
	    for(Schema.SObjectField s : fldObjMapValues)
	    {
	       String fieldName = s.getDescribe().getName();     
	       queryString += fieldName + ',';
	    }
	    // Trim last comma
	    queryString = queryString.subString(0, queryString.length() - 1);    
	    queryString += ' FROM PRM_Config__c LIMIT 1';
	    PRMConfig = Database.query(queryString);
      
      if (treatmentId!=null)
  	  {
  	  	setTreatment(treatmentId);
  	  	if (treatment.Destination_Facility__c != null)
	      {
	        Medical_Facility__c medicalFacility = new Medical_Facility__c();
	        Set<String> PRM_Config_field_names = new Set<String>();
	        for(Schema.SObjectField f : fldObjMapValues)
		      {
		         String fieldName = f.getDescribe().getName();
		         if (f.getDescribe().isCustom() == true) { PRM_Config_field_names.add(fieldName); }
		      }
	        Logger.info('PRM_Config_field_names size: ' + PRM_Config_field_names.size());
	        Set<String> MedFacility_field_names = new Set<String>();
	        fldObjMap = schema.SObjectType.Medical_Facility__c.fields.getMap();
	        fldObjMapValues = fldObjMap.values();
	        for(Schema.SObjectField s : fldObjMapValues)
	        {
	           String fieldName = s.getDescribe().getName();     
	           MedFacility_field_names.add(fieldName);
	        }
	        MedFacility_field_names.retainAll(PRM_Config_field_names);
	        queryString = 'SELECT ';
	        for (String s : MedFacility_field_names)
	        {
	        	queryString += s + ',';
	        }
	        
	        queryString = queryString.subString(0, queryString.length() - 1); 
	        queryString += ' FROM Medical_Facility__c WHERE Id = \'' + treatment.Destination_Facility__c + '\'';
	        Logger.info('queryString: ' + queryString);
	        Medical_Facility__c[] facilities = Database.query(queryString);
	        if (facilities.size()>0) {
		        medicalFacility = facilities[0];
	        }
	        for (String field : MedFacility_field_names)
	        {
	        	if (medicalFacility.get(field) != null)
	        	{
	            PRMConfig.put(field, medicalFacility.get(field));
	        	}
	        }
	      }
  	  }
  	}
  }
  public String getPRM_field_value()
  {
  	cachePRMConfig();
  	String fieldValue = (String)PRMConfig.get(PRM_Config_field);
    return fieldValue;
  }

  public PageReference sendManualEmail()
  {  	
    Logger.info('Email Template: ' + eTemplate);
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    Logger.info('patientId: ' + patientId);
    Patient__c patient = [Select Id, Key_Contact__c, Name from Patient__c Where Id = :patientId];
    mail.setTargetObjectId(patient.Key_Contact__c);
    mail.setWhatId(treatmentId);
    mail.setTemplateId(this.eTemplate);
    mail.setSaveAsActivity(false);
    if (templateMap.get(this.eTemplate) == 'Quote')
    {
    	//attach quote
    	PageReference quotePDF = Page.Quote;
    	List<Treatment_Quote__c> treatmentQuotes = [Select Id from Treatment_Quote__c where Treatment__c = :treatmentId Order by CreatedDate Desc];
    	quotePDF.getParameters().put('id', (String)treatmentQuotes[0].Id);
    	quotePDF.setRedirect(true);
    	Blob attachmentBody = quotePDF.getContent();
    	Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
    	String fileName = 'Quote for ' + patient.Name + '.pdf'; 
    	attachment.setFileName(fileName);
    	attachment.setBody(attachmentBody);
    	mail.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});
    }
    if (templateMap.get(this.eTemplate) == 'Itinerary')
    {
      //attach itinerary
      PageReference itineraryPDF = Page.travelItineraryPDF;
      List<Treatment_Quote__c> treatmentQuotes = [Select Id from Treatment_Quote__c where Treatment__c = :treatmentId Order by CreatedDate Desc];
      itineraryPDF.getParameters().put('id', (String)treatmentQuotes[0].Id);
      itineraryPDF.setRedirect(true);
      Blob attachmentBody = itineraryPDF.getContent();
      Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
      String fileName = 'Itinerary for ' + patient.Name + '.pdf'; 
      attachment.setFileName(fileName);
      attachment.setBody(attachmentBody);
      mail.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});      
    }    
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    return null;
  } 
  public List<EmailTemplate> getTemplates ()
  {
  	List<EmailTemplate> templates = new List<EmailTemplate>();
  	List<PRM_Config__c> PRMConfigs = [Select Id from PRM_Config__c Limit 1];
    for ( PRM_Email_Template__c prmt : [Select Id, Name, Email_Type__c from PRM_Email_Template__c 
                                        where PRM_Config__c = :PRMConfigs[0].Id order by Name])
  	{
  		List<EmailTemplate> et = new List<EmailTemplate>();
  		et = [Select Id, DeveloperName, Name from EmailTemplate where DeveloperName = :prmt.Name];
      templates.add(et[0]);
    } 
    return templates;  
  }
  public Id geteTemplate()
  {
  	return eTemplate;
  }
  public void seteTemplate(Id emailTemplate)
  {
  	this.eTemplate = emailTemplate;
  }
  public List<selectOption> geteTemplates ()
  {
  	List<SelectOption> options = new List<SelectOption>();
  	List<PRM_Config__c> PRMConfigs = [Select Id from PRM_Config__c Limit 1];
    for ( PRM_Email_Template__c prmt : [Select Id, Name, Email_Type__c from PRM_Email_Template__c 
                                        where PRM_Config__c = :PRMConfigs[0].Id order by Name])
    {
      List<EmailTemplate> et = new List<EmailTemplate>();
      et = [Select Id, DeveloperName, Name from EmailTemplate where DeveloperName = :prmt.Name];
      String optionText = et[0].Name + ' (' + prmt.Email_Type__c + ')';
      options.add(new SelectOption(et[0].Id, optionText));
      templateMap.put(et[0].Id, prmt.Email_Type__c); // cache this so we know the email type when sending the email out
    }
  	return options;
  }
}