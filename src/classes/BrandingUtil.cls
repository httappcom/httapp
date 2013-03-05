public with sharing class BrandingUtil {
  public PRM_Config__c PRMConfig;
  public Treatment__c treatment;
  
  public BrandingUtil(Id treatmentID) {
 	this.treatment = [Select Id, Destination_Facility__c From Treatment__c Where Id = :treatmentID ];
 	this.PRMConfig = new PRM_Config__c();
 	cachePRMConfig();
 }
 private void cachePRMConfig()
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
      this.PRMConfig = Database.query(queryString);
      
      if (treatment!=null)
      {

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
              this.PRMConfig.put(field, medicalFacility.get(field));
            }
          }
        }
      }
    
  }
  public String getPRM_field_value(String PRM_Config_field)
  {
    String fieldValue = (String)this.PRMConfig.get(PRM_Config_field);
    return fieldValue;
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
  private String build_image_url(String document_Id)
  {
    String linkurl = '';   
    string oid = userinfo.getOrganizationId();
    linkurl += 'https://' + Instance;
    linkurl += '.salesforce.com/servlet/servlet.ImageServer?id=' + document_Id;
    linkurl += '&oid=' + oid;
    return linkurl;  	
  }  
  private static String queryPatientPortalURL()
  {
      List<Site> patientPortal = [Select Subdomain From Site Where MasterLabel = 'Patient Portal' ];
      String patientPortalSubdomain = patientPortal.size()>0?patientPortal[0].Subdomain:'';   
      String patientPortalLink = 'https://';
      patientPortalLink += patientPortalSubdomain + '.';
      patientPortalLink += Instance + '.force.com';
      return patientPortalLink;  	
  }
  public static String patientPortalLink()
  {
  	PortalLinks__c pl = PortalLinks__c.getInstance('Default');
  	if (pl == null)
  	{      
  		PortalLinks__c portalLinksSetting = new PortalLinks__c(Name='Default', Patient_Portal__c=queryPatientPortalURL());
  		insert portalLinksSetting;
  	}
  	else if (pl.Patient_Portal__c == null)
  	{
  		pl.Patient_Portal__c = queryPatientPortalURL();
  		update pl;
  	}
  	return pl.Patient_Portal__c;
  }
  public String getimage_document_id_by_name(String document_Name)
  {
  	String document_Id = (String)[Select Id From Document Where DeveloperName = : document_Name].Id;
  	return document_Id;
  }
  public String getimage_document_id_by_PRM_Config(String prm_Config_field)
  {
    String queryString = 'SELECT ';
    queryString += String.escapeSingleQuotes(prm_Config_field);
    queryString += ' FROM PRM_Config__c LIMIT 1';
    PRM_Config__c PRMConfig = Database.query(queryString);
    String fieldValue = (String)PRMConfig.get(PRM_Config_field);
    return getimage_document_id_by_name(fieldValue);  	
  }  
  public String getimage_url_by_name(String document_Name)
  { 
    String document_Id = getimage_document_id_by_name(document_Name);
	  return(build_image_url(document_Id));
  }
  public String getimage_url_by_PRM_Config(String prm_Config_field)
  {
    String document_Id = getimage_document_id_by_PRM_Config(prm_Config_field);
    return(build_image_url(document_Id));
  }  
}