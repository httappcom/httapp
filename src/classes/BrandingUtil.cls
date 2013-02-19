public with sharing class BrandingUtil {
	
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