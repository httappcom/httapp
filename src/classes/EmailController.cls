public with sharing class EmailController {
	Id eTemplate = null;
	public static PRM_Config__c PRMConfig = new PRM_Config__c();
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
  	List<Site> patientPortal = [Select MasterLabel, Subdomain From Site Where MasterLabel = 'Patient Portal' ];
    String patientPortalSubdomain = patientPortal.size()>0?patientPortal[0].Subdomain:'';  	
  	return patientPortalSubdomain + '.' + Instance + '.force.com';
  }
  public String document_Name;
  public void setDocument_Name(String s)
  {
  	document_Name = s;
  }
  public Id getDocument_Name()
  {
  	return document_Name;
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
    if ( (document_Name == null) && (PRM_Config_field != null) )
    {
    	document_Name = getPRM_field_value();
    }
    Logger.info('document_Name: '+document_Name);    
    Document[] documents = [Select Id From Document Where DeveloperName = : document_Name];
    if (documents.size()>0) {
	    Id document_Id = documents[0].Id;
    	string oid = userinfo.getOrganizationId();
    	linkurl += 'https://' + Instance;
    	linkurl += '.salesforce.com/servlet/servlet.ImageServer?id=' + document_Id;
    	linkurl += '&oid=' + oid;
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
    Patient__c patient = [Select Id, Key_Contact__c from Patient__c Where Id = :patientId];
    mail.setTargetObjectId(patient.Key_Contact__c);
    mail.setWhatId(treatmentId);
    mail.setTemplateId(this.eTemplate);
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
    }
  	return options;
  }
}