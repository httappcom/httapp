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


	public static Care_Team_Member__c careTeamMember_Compiler(Id treatmentId, Id userId, String role){
		Care_Team_Member__c cmt = new Care_Team_Member__c();
		cmt.Treatment__c = treatmentId;
		cmt.Role__c = role;
		cmt.User__c = userId;
		return cmt;	
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

	public static void afterInsert (List<Treatment__c> treatments){
		patientIds = new Set<Id>();
		List<Care_Team_Member__c> careTeamMemberInserts = new List<Care_Team_Member__c>();
		List<Topic__c> topicInserts = new List<Topic__c>();

		for ( Treatment__c treatment : treatments ){
			if ( treatment.Patient__c != null ){
				patientIds.add(treatment.Patient__c);
			}
		}
		patientMap = populatePatientMap(patientIds);
		orgDefaultUsers = populateOrgDefaultUsers();

		for ( Treatment__c treatment : treatments ){
			if ( treatment.Patient__c != null && patientMap.containsKey(treatment.Patient__c) ){
				Patient__c thisPatient = patientMap.get(treatment.Patient__c);

				careTeamMemberInserts.add( careTeamMember_Compiler(treatment.Id, treatment.OwnerId, 'PCC')) ;
				if ( thisPatient.Portal_User__c != null ){
					careTeamMemberInserts.add(careTeamMember_Compiler(treatment.Id, thisPatient.Portal_User__c, 'Patient'));
				}
				if ( treatment.Onsite_Coordinator__c != null ){
					careTeamMemberInserts.add(careTeamMember_Compiler(treatment.Id, treatment.Onsite_Coordinator__c, 'Onsite Coordinator'));
				}
				if ( orgDefaultUsers != null && orgDefaultUsers.containsKey(medicalInformationOfficer) ){
					careTeamMemberInserts.add(careTeamMember_Compiler(treatment.Id, orgDefaultUsers.get(medicalInformationOfficer).Id, 'Medical Information Officer'));
				}
				if ( orgDefaultUsers != null &&  orgDefaultUsers.containsKey(travelConcierge) ){
					careTeamMemberInserts.add(careTeamMember_Compiler(treatment.Id, orgDefaultUsers.get(travelConcierge).Id, 'Travel Concierge'));
				}

				Topic__c t = new Topic__c();
				t.Name = treatment.Name;
				t.Treatment__c = treatment.Id;
				t.Patient__c = thisPatient.Id;
				topicInserts.add(t);

				if ( treatment.Travel__c != null ){
					Topic__c travel = new Topic__c();
					travel.Name = 'Travel';
					travel.Treatment__c = treatment.Id;
					travel.Patient__c = thisPatient.Id;
					topicInserts.add(travel);
				}

			}
			
		}
		insert topicInserts;
		insert careTeamMemberInserts;
	}
    
  public static void beforeUpdate(List<Treatment__c> treatments,
    Map<Id, Treatment__c> oldTreatmentMap) {
    for (Treatment__c treatment : treatments ) {
        treatment.Patient_Email__c = treatment.Patient_Email_Formula__c;
    }
  }

	public static void afterUpdate(List<Treatment__c> newTreatments, List<Treatment__c> oldTreatments ){
		List<Care_Team_Member__c> careTeamMemberInserts = new List<Care_Team_Member__c>();
		for ( Integer i=0; i<newTreatments.size(); i++ ){
			if ( newTreatments[i].OwnerId != oldTreatments[i].OwnerId ){
				careTeamMemberInserts.add( careTeamMember_Compiler(newTreatments[i].Id,newTreatments[i].OwnerId,'PCC') );
			}
		}
		if ( careTeamMemberInserts.size() > 0 ){
			insert careTeamMemberInserts;
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
                                             Portal_User__c,
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
   
   public static list<Satisfaction_Survey_Question__c> querySatisfactionSurveyQuestions(string headerid){
        return  [select id, 
                        name, 
                        answer__c, 
                        boolean_answer__c, 
                        comment__c, 
                        full_question_text__c, 
                        order__c, 
                        satisfaction_survey__c 
                from Satisfaction_Survey_Question__c 
                where Satisfaction_Survey__c = :headerid 
                order by order__c];
   }  
}