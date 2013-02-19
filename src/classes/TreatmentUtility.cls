public with sharing class TreatmentUtility {

  private static Set<id> patientIds;
  private static Map<Id, Patient__c> patientMap;
    public static Map<String,User> orgDefaultUsers;

    static String travelConcierge = 'Travel Concierge';
    static String medicalInformationOfficer = 'Medical Information Officer';


  public static void beforeInsert (List<Treatment__c> treatments) {
    for (Treatment__c treatment : treatments ) {
        treatment.Patient_Email__c = treatment.Patient_Email_Formula__c;
    }
  }


    public static Map<String,User> populateOrgDefaultUsers(){
        Map<String,User> results = new Map<String,User>();
        for ( User u : [Select Email, Id, IsActive, Name, Username, Medical_Information_Officer__c, Travel_Concierge__c from User where IsActive = true and ( Travel_Concierge__c = true or Medical_Information_Officer__c = true )]){
            if ( u.Travel_Concierge__c ){
                results.put(travelConcierge,u);
            } else
            if ( u.Medical_Information_Officer__c ){
                results.put(medicalInformationOfficer,u);
            }
        }
        return results;
    }

    public static void afterInsert (List<Treatment__c> treatments) {
        patientIds = new Set<Id>();
        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null ){
                patientIds.add(treatment.Patient__c);
            }
        }
        patientMap = populatePatientMap(patientIds);
    	updateCareTeamMembers( treatments, true );
        List<Topic__c> topicInserts = new List<Topic__c>();
        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null && patientMap.containsKey(treatment.Patient__c) ) {
                Patient__c thisPatient = patientMap.get(treatment.Patient__c);
                topicInserts.add(new Topic__c(Name = 'Treatment', Treatment__c = treatment.Id, Patient__c = thisPatient.Id));
                if ( treatment.Travel__c != null ) {
                    topicInserts.add(new Topic__c(Name = 'Travel', Treatment__c = treatment.Id, Patient__c = thisPatient.Id));
                }

            }
            
        }
        insert topicInserts;
    }
    
  public static void beforeUpdate(List<Treatment__c> treatments,
    Map<Id, Treatment__c> oldTreatmentMap) {
    for (Treatment__c treatment : treatments ) {
        treatment.Patient_Email__c = treatment.Patient_Email_Formula__c;
    }
  }

    public static void afterUpdate(List<Treatment__c> newTreatments ) {
 system.debug('afterUpdate');
        patientIds = new Set<Id>();
        for ( Treatment__c treatment : newTreatments ){
            if ( treatment.Patient__c != null ){
                patientIds.add(treatment.Patient__c);
            }
        }
 system.debug('patientIds='+patientIds);
        patientMap = populatePatientMap(patientIds);
    	updateCareTeamMembers( newTreatments, false );
    }

	private static void updateCareTeamMembers( List<Treatment__c> treatments, Boolean isInsert ) {
system.debug('updateCareTeamMembers');
        List<Care_Team_Member__c> careTeamMemberInserts = new List<Care_Team_Member__c>();

		Set<ID> treatmentIds = new Set<ID>();
        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null ){
            	treatmentIds.add(treatment.id);
            }
        }
        if (isInsert) {
	        orgDefaultUsers = populateOrgDefaultUsers();
        }

  system.debug('treatmentIds X='+treatmentIds);
		loadCareTeamMemberMap( treatmentIds );

        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null && patientMap.containsKey(treatment.Patient__c) ) {
                Patient__c thisPatient = patientMap.get(treatment.Patient__c);

				checkCareTeamMembership( careTeamMemberInserts, treatment.id, 'PCC', treatment.OwnerId );
                if ( treatment.Onsite_Coordinator__c != null ) {
					checkCareTeamMembership( careTeamMemberInserts, treatment.id, 'Onsite Coordinator', treatment.Onsite_Coordinator__c );
                }
                if (isInsert) {
	                if ( orgDefaultUsers != null && orgDefaultUsers.containsKey(medicalInformationOfficer) ) {
						checkCareTeamMembership( careTeamMemberInserts, treatment.id, 'Medical Information Officer', orgDefaultUsers.get(medicalInformationOfficer).Id );
        	        }
            	    if ( orgDefaultUsers != null &&  orgDefaultUsers.containsKey(travelConcierge) ) {
					checkCareTeamMembership( careTeamMemberInserts, treatment.id, 'Travel Concierge', orgDefaultUsers.get(travelConcierge).id );
                	}
                }
            }
            
        }
        if (careTeamMemberInserts.size()>0) {
	        insert careTeamMemberInserts;
        }
	}
    
  private static Map<Id, Patient__c> populatePatientMap(Set<Id> pPatientIds) {
    if (pPatientIds != null && pPatientIds.size() > 0) {
      return new Map<Id, Patient__c>([select Time_Zone__c,
      										 Key_Contact__c,
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
                                             Name,
                                             Id
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
                        Best_Time_to_Contact__c, 
                        Case_Manager_s_Feel__c,
                        Close_Date__c,
                        Decision_Timeframe__c,
                        Deposit_Required__c,
                        Financial_Reconciliation__c, 
                        Financing_Required__c,
                        Inquiry_Quality__c,
                        Inquiry_Source__c, 
                        On_Site_Recovery_Period__c,
                        Patient__r.Original_Number_Rank__c,
                        Patient__c,
                        Patient_Email__c,
                        Payment_Type__c, 
                        Phase__c,
                        Destination_Facility__c,
                        Preferred_Form_of_Contact__c, 
                        Preferred_Travel_Date_From__c,
                        Preferred_Travel_Date_To__c,
                        Procedure__c, 
                        Procedure_Category__c,
                        Procedure_Date__c,
                        Response_SLA__c, 
                        Stage__c,
                        Sub_Stage__c,
                        Patient_Not_Committed_Reason__c
                    from Treatment__c 
                    where id = :pTreatmentId];               
      }  
   }
    public static Treatment__c queryTreatmentForQuote(Id pTreatmentId) { 
      if(pTreatmentId == null) {          
        return null;
      } else {           
        return [Select id, 
                        Name,
                        /* CreatedBy.Name,
                        CreatedDate,                                                             
                        LastModifiedBy.Name,
                        Additional_Amount__c, */
                        /* Best_Time_to_Contact__c, 
                        Case_Manager_s_Feel__c,
                        Close_Date__c,
                        Decision_Timeframe__c,
                        Deposit_Required__c,
                        Financial_Reconciliation__c, 
                        Financing_Reguired__c, */
                        /* Inquiry_Quality__c,
                        Inquiry_Source__c, 
                        On_Site_Recovery_Period__c,
                        Patient__r.Original_Number_Rank__c,
                        Patient__c,
                        Patient_Email__c,
                        Payment_Type__c, 
                        Phase__c,
                        Destination_Facility__c,
                        Preferred_Form_of_Contact__c, 
                        Preferred_Travel_Date_From__c,
                        Preferred_Travel_Date_To__c,*/
                        Procedure__c, 
                        /* Procedure_Category__c,
                        Procedure_Date__c,
                        Response_SLA__c, 
                        Stage__c,
                        Sub_Stage__c,
                        Patient_Not_Committed_Reason__c */
                        Patient__r.Name,
                        Patient__r.Owner.Name,
                        (Select id,
                                Arrival_Date__c,
                                Departure_Date__c,
                                Number_of_Hospital_Nights__c,
                                Hotel_Nights_Included__c,
                                Hotel_Nights_Needed__c,
                                Ground_Transportation_Included__c
                            from Treatment_Quotes__r
                        )
                    from Treatment__c 
                    where id = :pTreatmentId];               
      }  
   } 
   
   	private static Map<String, Id> careTeamMemberMap = null;
   	private static void loadCareTeamMemberMap( Set<ID> treatmentIds ) {
   		Care_Team_Member__c[] members = [SELECT Role__c, User__c, Treatment__c FROM Care_Team_Member__c where treatment__c in :treatmentIds];
   		careTeamMemberMap = new Map<String, Id>();
   		for (Care_Team_Member__c member : members) {
   			String key = member.Treatment__c + '+' + member.Role__c + '+' + member.User__c;
   			careTeamMemberMap.put( key, member.id );
   		}
   	}
   	private static Boolean careTeamMemberExists( ID treatmentId, String role, Id userId) {
		String key = treatmentId + '+' + role + '+' + userId;
   		return careTeamMemberMap.get(key) != null;
   	}
   	
   	private static void checkCareTeamMembership( List<Care_Team_Member__c> members, ID treatmentId, String role, ID userId ) {
   		if (!careTeamMemberExists( treatmentId, role, userId)) {
            members.add( new Care_Team_Member__c( Treatment__c = treatmentId, Role__c = role, User__c = userId));
   		}
   	}

	public static Map<ID, ID> contactToUserMap = null;
	public static void loadContactToUserMap(Set<ID> contacts) {
system.debug('contacts='+contacts);
		User[] users = [select id, ContactId from User where ContactId in :contacts];
system.debug('users='+users);
		contactToUserMap = new Map<ID, ID>();
		for (User user : users) {
			contactToUserMap.put(user.ContactId, user.id);
		}
	}


}