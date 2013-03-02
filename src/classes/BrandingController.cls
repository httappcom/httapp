public with sharing class BrandingController {
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
  public String PRM_Config_field;  
  public void setPRM_Config_field(String s)
  {
    PRM_Config_field = s;
  }
  public Id getPRM_Config_field()
  {
    return PRM_Config_field;
  }
  public String resource_URL;
  public void setResource_URL(String s)
  {
    resource_URL = s;
  }   

  public String getimage_url()
  {
    string linkurl = '';
    if (PRM_Config_field != null)
    {
        string oid = userinfo.getOrganizationId();
        linkurl += 'https://' + BrandingUtil.Instance;
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
}