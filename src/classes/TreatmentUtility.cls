public with sharing class TreatmentUtility {

  private static Set<id> patientIds;
  private static Map<Id, Patient__c> patientMap;
  
  public static void beforeInsert (List<Treatment__c> pTreatments) {
    TreatmentUtility.patientIds = new Set<id>();
    
    for (Treatment__c treat : pTreatments) {
      TreatmentUtility.patientIds.add(treat.Patient__c);
    }
        
    if (TreatmentUtility.patientIds.size() > 0) {
      TreatmentUtility.patientMap =
        TreatmentUtility.populatePatientMap(patientIds);
        
      for (Treatment__c treat : pTreatments) {
        if (treat.Patient_Email__c == null &&
            TreatmentUtility.patientMap.containsKey(treat.Patient__c)) {
          treat.Patient_Email__c =
            TreatmentUtility.patientMap.get(treat.Patient__c).Email__c;
        }
      }
    }
  }
    
  public static void beforeUpdate(List<Treatment__c> pTreatments,
    Map<Id, Treatment__c> oldTreatmentMap) {
    
    TreatmentUtility.patientIds = new Set<id>();
    
    for (Treatment__c treat : pTreatments) {
      if (treat.Patient_Email__c !=
          oldTreatmentMap.get(treat.Id).Patient_Email__c) {
        TreatmentUtility.patientIds.add(treat.Patient__c);
      }
    }
    
    if (TreatmentUtility.patientIds.size() > 0) {
      for (Treatment__c treat : pTreatments) {
        if (TreatmentUtility.patientMap.containsKey(treat.Patient__c)) {
          treat.Patient_Email__c =
            TreatmentUtility.patientMap.get(treat.Patient__c).Email__c;
        }
      }
    }
  }
    
  private static Map<Id, Patient__c> populatePatientMap(Set<Id> pPatientIds) {
    if (pPatientIds != null && pPatientIds.size() > 0) {
      return new Map<Id, Patient__c>([select Time_Zone__c,
                                             Street__c,
                                             State__c,
                                             Salutation__c,
                                             Preferred_Language__c,
                                             Postal_Code__c,
                                             Phone__c,
                                             Patient_Stage__c,
                                             Mobile__c,
                                             Gender__c,
                                             Email__c,
                                             Date_of_Birth__c,
                                             Country__c,
                                             City__c,
                                             Alternate_Email__c,
                                             Advocate_Phone__c,
                                             Advocate_Name__c,
                                             Advocate_Email__c,
                                             SystemModstamp,
                                             OwnerId,
                                             Name,
                                             LastModifiedDate,
                                             LastModifiedById,
                                             LastActivityDate,
                                             IsDeleted,
                                             Id,
                                             CreatedDate,
                                             CreatedById
                                      from Patient__c
                                      where Id IN :pPatientIds]);
    } else {
      return null;
    }
  }
    public static Treatment__c queryTreatmentAll(Id pTreatmentId) { 
      if(pTreatmentId == null) {          
        return null;
      } else {           
        return [Select id, 
                        Name,
                        CreatedBy.Name,
                        CreatedDate,                                                             
                        LastModifiedBy.Name,
                        Additional_Amount__c,
                        Amount__c,
                        Best_Time_to_Contact__c, 
                        Case_Manager_s_Feel__c,
                        Close_Date__c,
                        Decision_Timeframe__c,
                        Deposit_Required__c,
                        Financial_Reconciliation__c, 
                        Financing_Reguired__c,
                        Hospital_Destination__c,
                        Inquiry_Quality__c,
                        Inquiry_Source__c, 
                        On_Site_Recovery_Period__c,
                        Patient__r.Original_Number_Rank__c,
                        Patient__c,
                        Patient_Email__c,
                        Payment_Type__c, 
                        Phase__c,
                        Post_Op_Follow_Up_Program__c,
                        Preferred_Destination__c,
                        Preferred_Form_of_Contact__c, 
                        Preferred_Travel_Date_From__c,
                        Preferred_Travel_Date_To__c,
                        Primary_Provider__c,
                        Procedure__c, 
                        Procedure_Category__c,
                        Procedure_Date__c,
                        Procedure_Treatment_Type__c,
                        Response_SLA__c, 
                        Stage__c,
                        Sub_Stage__c,
                        Treatment_Date__c,
                        Patient_Not_Committed_Reason__c
                    from Treatment__c 
                    where id = :pTreatmentId];               
      }  
   }
}