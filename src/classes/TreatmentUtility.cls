public with sharing class TreatmentUtility {

  private static Set<id> patientIds;
  private static Map<Id, Patient__c> patientMap;
  private static Map<Id, String> savedTaskSpecifiers = null;


  public static void beforeInsert (List<Treatment__c> treatments) {
    for (Treatment__c treatment : treatments ) {
        treatment.Patient_Email__c = treatment.Patient_Email_Formula__c;
    }
  }

    public static void afterInsert (List<Treatment__c> treatments) {
    	updateCareTeamMembers( treatments, true );
        List<Topic__c> topicInserts = new List<Topic__c>();
        for ( Treatment__c treatment : treatments ) {
            topicInserts.add(new Topic__c(Name = 'Treatment', Treatment__c = treatment.Id ));
            if ( treatment.Travel__c != null ) {
                topicInserts.add(new Topic__c(Name = 'Travel', Treatment__c = treatment.Id ));
            }
        }
        insert topicInserts;
    }
    
  public static void beforeUpdate(List<Treatment__c> treatments,
    Map<Id, Treatment__c> oldTreatmentMap) {
    for (Treatment__c treatment : treatments ) {
    	if (treatment.Task_Specifiers__c != null) {
    		if (savedTaskSpecifiers==null) savedTaskSpecifiers = new Map<Id, String>();
 system.debug('beforeUpdate task specifiers='+treatment.Task_Specifiers__c);
    		savedTaskSpecifiers.put(treatment.id, treatment.Task_Specifiers__c);
   			treatment.Task_Specifiers__c = null;
    	}
        treatment.Patient_Email__c = treatment.Patient_Email_Formula__c;
        if (treatment.Stage__c == PickListDefines.Stage.TreatmentApproval && 
          	(treatment.Approval_State__c == null || treatment.Approval_State__c == '' || 
          	 treatment.Approval_State__c == PickListDefines.ApprovalState.NotRequired)) {
           	treatment.Approval_State__c = PickListDefines.ApprovalState.AwaitingApproval;
        }
        Treatment__c origTreatment = oldTreatmentMap.get(treatment.id);
        if (origTreatment.Approval_State__c != PickListDefines.ApprovalState.Approved &&
        	treatment.Approval_State__c == PickListDefines.ApprovalState.Approved) {
        		treatment.Approval_Date__c = Date.today();
        }
        if (treatment.Approval_State__c != PickListDefines.ApprovalState.Approved) {
        	treatment.Approval_Date__c = null;
        }
    }
  }

    public static void afterUpdate(Map<ID,Treatment__c> oldMap, List<Treatment__c> newTreatments ) {
        patientIds = new Set<Id>();
		List<ID> treatmentIds = new List<ID>();
		for (Treatment__c treatment: newTreatments) {
			treatmentIds.add(treatment.id);
		}
		
		TaskSpecifierUtility.loadTaskSpecifierCache();
	    TaskSpecifierUtility.loadMetaData();
        loadExpandedTreatmentCache( treatmentIds );
        MessagingUtil.loadCareTeamMemberMap( treatmentIds );
        List<Communication__c> communications = new List<Communication__c>();
        List<Task> tasks = new List<Task>();
        for ( Treatment__c treatment : newTreatments ) {
        	if (savedTaskSpecifiers != null) {
	        	String taskSpecifiers = savedTaskSpecifiers.get(treatment.id);
system.debug('afterUpdate; saved specifiers='+taskSpecifiers);
    	    	if (taskSpecifiers != null) {
	    	    	List<Task> taskList = TaskSpecifierUtility.parseSpecifiers(treatment, taskSpecifiers);
					if (taskList.size()>0) tasks.addAll(taskList);
        		}
        	}
        	Treatment__c expandedTreatment = getExpandedTreatment( treatment.id );
        	Treatment__c origTreatment = oldMap.get(treatment.id);
            if ( treatment.Patient__c != null ){
                patientIds.add(treatment.Patient__c);
            }
            if (treatment.Payment_Type__c == PickListDefines.PaymentType.Insurance &&
            	expandedTreatment!=null) {
            	if (!origTreatment.Surgical_Report_Attached__c && treatment.Surgical_Report_Attached__c) {
            		Communication__c comm = MessagingUtil.createPrivateMessage( treatment.id, 
            			treatment.OwnerId, expandedTreatment.Insurance_Network_Contact__c, 
            			'The surgical report for '+expandedTreatment.Patient__r.Name+' has been attached.' );
            		if (comm != null) communications.add(comm);
            	}
            }
            
		}
        patientMap = populatePatientMap(patientIds);
    	updateCareTeamMembers( newTreatments, false );
    	
    	if (communications.size()>0) {
    		insert communications;
    	}
    	if (tasks.size()>0) {
    		insert tasks;
    	}
    }

	private static void updateCareTeamMembers( List<Treatment__c> treatments, Boolean isInsert ) {
        patientIds = new Set<Id>();
        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null ){
                patientIds.add(treatment.Patient__c);
            }
        }
        patientMap = populatePatientMap(patientIds);
        List<Care_Team_Member__c> careTeamMemberInserts = new List<Care_Team_Member__c>();

		Set<ID> treatmentIds = new Set<ID>();
        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null ){
            	treatmentIds.add(treatment.id);
            }
        }

        for ( Treatment__c treatment : treatments ){
            if ( treatment.Patient__c != null && patientMap.containsKey(treatment.Patient__c) ) {
                Patient__c thisPatient = patientMap.get(treatment.Patient__c);

				careTeamMemberInserts.add(new Care_Team_Member__c( Treatment__c = treatment.Id, Role__c = PickListDefines.CareTeamMemberRoles.PCC, User__c = treatment.OwnerId));
                if ( treatment.Onsite_Coordinator__c != null ) {
					careTeamMemberInserts.add(new Care_Team_Member__c( Treatment__c = treatment.Id, Role__c = PickListDefines.CareTeamMemberRoles.PCC, User__c = treatment.Onsite_Coordinator__c));
                }
                if ( treatment.Payment_Type__c == PickListDefines.PaymentType.Insurance &&
                	 treatment.Insurance_Network_Contact__c != null ) {
					careTeamMemberInserts.add(new Care_Team_Member__c( Treatment__c = treatment.Id, Role__c = PickListDefines.CareTeamMemberRoles.InsuranceAgent, User__c = treatment.Insurance_Network_Contact__c));
                }
                if (isInsert) {
                	User medicalInformationOfficer = DefaultUsersUtil.getMedicalInformationOfficer();
	                if ( medicalInformationOfficer != null) {
						careTeamMemberInserts.add(new Care_Team_Member__c( Treatment__c = treatment.Id, Role__c = PickListDefines.CareTeamMemberRoles.MedicalInformationOfficer, User__c = medicalInformationOfficer.Id));
        	        }
					User travelConcierge = DefaultUsersUtil.getTravelConcierge();
            	    if ( travelConcierge != null ) {
						careTeamMemberInserts.add(new Care_Team_Member__c( Treatment__c = treatment.Id, Role__c = PickListDefines.CareTeamMemberRoles.TravelConcierge, User__c = travelConcierge.id));
                	}
                }
            }
            
        }
        CareTeamUtil.addMembersToCareTeam(careTeamMemberInserts);
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
                        Quote_Status__c,
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
                        Quote_Status__c,
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
   
	public static Map<ID, ID> contactToUserMap = null;
	public static void loadContactToUserMap(Set<ID> contacts) {
		User[] users = [select id, ContactId from User where ContactId in :contacts];
		contactToUserMap = new Map<ID, ID>();
		for (User user : users) {
			contactToUserMap.put(user.ContactId, user.id);
		}
	}

	private static Map<ID, Treatment__c> expandedTreatmentCache = null;
	private static void loadExpandedTreatmentCache( List<ID> treatmentIds ) {
		if (expandedTreatmentCache==null) {
			if (treatmentIds.size()>0) {
				String qry = 'select id, Patient__r.Name ';
				for (String fld : TaskSpecifierUtility.validTreatmentAssignedToFields) {
					qry += ','+fld;
				}
				for (String fld : TaskSpecifierUtility.validDueDateFields) {
					qry += ','+fld;
				}
				qry += ' from treatment__c where id in (\''+String.join(treatmentIds, '\',\'') + '\')';
system.debug('qry='+qry);
				
				expandedTreatmentCache = new Map<ID, Treatment__c>((Treatment__c[])Database.query(qry));
			}
		}
	}

	private static Treatment__c getExpandedTreatment( ID treatmentId ) {
		return expandedTreatmentCache.get( treatmentId );
	}
	
	
}