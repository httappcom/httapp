/*
 * utility class to support common patient logic
*/

public class PatientUtil {

  public static Patient__c queryPatientAll(Id pPatientId) {
      if(pPatientId == null) {          
        return null;
      } else {
        return [Select id, 
                       Name,
                       Owner.Name,
                       Advocate_Email__c,
                       Advocate_Name__c,
                       Advocate_Phone__c,
                       Alternate_Email__c,
                       City__c,
                       Country__c,
                       Date_of_Birth__c,
                       Email__c,
                       Gender__c,
                       Ins_Verification_Date__c,
                       Ins_Clinic_Num__c,
                       Ins_Name__c,
                       Ins_Claim_Address__c,
                       Ins_Verify_Phone__c,
                       Medical_Reviews_Fax__c,
                       Ins_Contact__c,
                       Ins_Policy__c,
                       Ins_Group__c,
                       Ins_Effective_Date__c,
                       Ins_Dependent_Coverage__c,
                       Ins_Deductible__c,
                       Ins_Co_Pay__c,
                       Ins_Benefit_Percentage__c,
                       Ins_Out_of_Pocket__c,
                       Ins_Out_of_Pocket_Met__c,
                       Ins_Pre_Existing_Clause_Applies__c,
                       Ins_Lifetime_Max__c,
                       Ins_Pre_Cert_Required__c,
                       Ins_Pre_Auth_Phone__c,
                       Ins_Authorization_Num__c,
                       Ins_Comments__c,
                       Mobile__c,
                       Insurance_Network__c,
                       Patient_Stage__c,
                       Phone__c,
                       Postal_Code__c,
                       Preferred_Language__c,
                       Salutation__c,
                       State__c,
                       Street__c,
                       Time_Zone__c,
                       Last_Communication__c,
                       Nationality__c,
                       Age__c,
                       Patient_First_Name__c,
                       Patient_Last_Name__c,
                       Key_Contact__c,
                       Medical_Profile_Type__c,
                       Medical_Profile_Type__r.Name,
                       Email_Receipt_Allowed__c,
                       (select id, 
                               Name,
                               Destination_Facility__c,
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
                               Referral_Source__c, 
                               On_Site_Recovery_Period__c,
                               Patient__r.Original_Number_Rank__c,
                               Patient__c,
                               Patient__r.Email__c,
                               Payment_Type__c, 
                               Phase__c,
                               Preferred_Form_of_Contact__c, 
                               Preferred_Travel_Date_From__c,
                               Preferred_Travel_Date_To__c,
                               Onsite_Coordinator__c,
                               Onsite_Coordinator__r.Email,
                               Procedure__c, 
                               Procedure_Category__c,
                               Procedure_Date__c,
                               Response_SLA__c, 
                               Stage__c,
                               Sub_Stage__c,
                               Quote_Status__c,
                               Patient_Not_Committed_Reason__c,
                               Patient__r.Name,
                               Request_Summary__c,
                               Next_Follow_Up__c,
                               Primary_Campaign__c,
                               Related_Campaign__c,
                               Treatment_Summary__c,
                               Active_Status__c,
                              Travel__r.Id,
                              Travel__r.Name,
                              Travel__r.Airfare_Coordination_Needed__c,
                              //Companion__c,
                              Travel__r.Extra_Local_Concier__c,
                              Travel__r.Ground_Transportation_Needed__c,
                              Travel__r.Hotel__c,
                              Travel__r.Hotel_Checkin__c,
                              Travel__r.Hotel_Checkout__c,
                              Travel__r.Hotel_Coordination_Needed__c,
                              Travel__r.Number_of_Hospital_Nights__c,
                              Travel__r.Passport_Status__c,
                              Travel__r.Pre_Op_Instructions__c,
                              Travel__r.Procedure_Date__c,
                              Travel__r.Special_Passport_Visa__c,
                              Travel__r.Travel_End__c,
                              Travel__r.Travel_Start__c,
                              Travel__r.Visa_Status__c,
                              Travel__r.Wheel_Chair_Bound__c,
                              Travel__r.Additions_Comments__c,
                              Travel__r.Companion__c,
                              Travel__r.Event_Diagnosis__c,
                              Travel__r.Hotel_Nights_Included__c,
                              Travel__r.Hotel_Nights_Needed__c,
                              Travel__r.Insurance_Approval__c,
                              Travel__r.Special_Hotel_Needs__c,
                              Travel__r.Total_Added_Cost__c,
                              Travel__r.Treatment_as_Quoted__c ,
                              Travel__r.Arrival_Airline__c,
                              Travel__r.Arrival_Airport_Code__c,
                              Travel__r.Arrival_Flight_No__c,
                              Travel__r.Departure_Airline__c,
                              Travel__r.Departure_Airport_Code__c,
                              Travel__r.Departure_Flight_No__c,                              
                              Travel__r.Notes__c                                

                       from Treatments__r order by CreatedDate desc),
                       (select id,
                               Owner.Name,
                               CallDurationInSeconds,
                               CallObject,
                               CallDisposition,
                               CallType,
                               Description,
                               ActivityDate,
                               Who.Name,
                               Priority,
                               What.Name,
                               Status,
                               Subject
                       from Tasks order by CreatedDate desc),
                     /*(select id,
                               Name,
                              Owner.Name,
                              Body_Rich_Text__c,
                              Body__c,
                              Truncated_Body__c,
                              From_Name__c,
                              From__c,
                              Has_Attachments__c,
                              Priority__c,
                              IsRead__c,
                              Reply_Rich_Text__c,
                              Reply__c,
                              Sent__c,
                              Status__c,
                              To_Name__c,
                              To__c
                      from Messages__r), */ //todo fix the message relationship                                                                    
/*                      (select Id,
                              Name,
                              Benefit_Percentage__c,
                              Claim_Address__c,
                              Co_pay__c,
                              Deductible__c,
                              IsDeleted,
                              Dependent_Coverage__c,
                              Effective_Date__c, 
                              Fax_Number_Medical_Reviews__c,
                              Group__c,
                              Insurance_Contact__c,
                              Name_of_Insurance__c,
                              Patient__c,
                              Payment_Type__c,
                              Policy_ID__c, 
                              Treatment__c,
                              Verification_Date__c,
                              Verification_Phone_Number__c 
                      from Payments__r),*/
                      (select Id,
                              Name,
                              Patient__c,
                              Survey_Id__c
                      from Survey_Headers__r),
                      (SELECT Id, ContentType, Description, Name, ParentId, CreatedDate FROM Attachments order by name)
                from Patient__c 
                where id = :pPatientId];
      }
   }

	public static List<Insurance_Network_User__c> getInsuranceNetworkContacts( ID insuranceNetworkId ) {
		if (insuranceNetworkId==null) return null;
		Insurance_Network__c[] networks = [SELECT Id, 
			(SELECT Id,Name,Insurance_Contact__c, Insurance_Contact__r.Name FROM Insurance_Network_Users__r order by Name) 
				FROM Insurance_Network__c where id = :insuranceNetworkId];
		return networks.size()==0?null:networks[0].Insurance_Network_Users__r;
	}
	
  public static List<Treatment__c> getTreatmentsWithChildren(Id patientId) { 
      if(patientId == null) {          
        return null;
      } else {
        return [Select id,
                               Name,
                         	   Surgical_Report_Attached__c,
                               Approval_State__c,
                               Approval_Date__c,
                               Insurance_Network_Contact__c,
                               Destination_Facility__c,
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
                               Referral_Source__c, 
                               On_Site_Recovery_Period__c,
                               Patient__r.Original_Number_Rank__c,
                               Patient__c,
                               Onsite_Coordinator__c,
                               Onsite_Coordinator__r.Email,
                               Payment_Type__c, 
                               Phase__c,
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
                               Patient_Not_Committed_Reason__c,
                               Patient__r.Name,
                               Patient__r.Email__c,
                               Request_Summary__c,
                               Next_Follow_Up__c,
                               Primary_Campaign__c,
                               Related_Campaign__c,
                               Treatment_Summary__c,
                               Active_Status__c,
                               Medical_Profile_Required__c,
                               Medical_Profile_Received__c,
                               Medical_Records_Required__c,
                               Medical_Records_Received__c,
                               Engagement_Type__c,
                               Responses__c,
                               SubStage_Visibility__c,
                              Travel__r.Id,
                              Travel__r.Name,
                              Travel__r.Airfare_Coordination_Needed__c,
                              //Companion__c,
                              Travel__r.Extra_Local_Concier__c,
                              Travel__r.Ground_Transportation_Needed__c,
                              Travel__r.Hotel__c,
                              Travel__r.Hotel_Checkin__c,
                              Travel__r.Hotel_Checkout__c,
                              Travel__r.Hotel_Coordination_Needed__c,
                              Travel__r.Number_of_Hospital_Nights__c,
                              Travel__r.Passport_Status__c,
                              Travel__r.Pre_Op_Instructions__c,
                              Travel__r.Procedure_Date__c,
                              Travel__r.Special_Passport_Visa__c,
                              Travel__r.Travel_End__c,
                              Travel__r.Travel_Start__c,
                              Travel__r.Visa_Status__c,
                              Travel__r.Wheel_Chair_Bound__c,
                              Travel__r.Additions_Comments__c,
                              Travel__r.Companion__c,
                              Travel__r.Event_Diagnosis__c,
                              Travel__r.Hotel_Nights_Included__c,
                              Travel__r.Hotel_Nights_Needed__c,
                              Travel__r.Insurance_Approval__c,
                              Travel__r.Special_Hotel_Needs__c,
                              Travel__r.Total_Added_Cost__c,
                              Travel__r.Treatment_as_Quoted__c ,
                              Travel__r.Arrival_Airline__c,
                              Travel__r.Arrival_Airport_Code__c,
                              Travel__r.Arrival_Flight_No__c,
                              Travel__r.Departure_Airline__c,
                              Travel__r.Departure_Airport_Code__c,
                              Travel__r.Departure_Flight_No__c,                              
                              Travel__r.Notes__c,
                      (SELECT Id,
                              Name,
                              IsDeleted, 
                              Description__c, 
                              Discount_Amount__c, 
                              Expiration_Date__c,
                              Sub_Total__c, 
                              Total_Price__c,
                              echosignDocKey__c,
                              Doc_Signed_Timestamp__c,
                              Treatment__c,
                              Treatment__r.Onsite_Coordinator__c,
                              Treatment__r.Onsite_Coordinator__r.Email,
                              Ground_Transportation_Included__c,
                              Hotel_Nights_Included__c,
                              Hotel_Nights_Needed__c,
                              Number_of_Hospital_Nights__c,
                              Arrival_Date__c,
                              Departure_Date__c,
//                              Syncing__c,
                              Procedure__r.Price__c,
                              Procedure__r.Comments__c,
                              Procedure__r.Details__c,
                              Procedure__r.Doctor__c,
                              Procedure__r.Doctor__r.Key_Contact__c,
                              Procedure__r.Facility__c,
                              Procedure__r.Hospital_Nights_Required__c,
                              Procedure__r.Hotel_Nights_Included__c,
                              Procedure__r.Procedure_Category__c,
                              Procedure__r.Recovery_Nights_Required__c,
                              Procedure__r.Transportation_Included__c 
                        From Treatment_Quotes__r)
                from Treatment__c 
                where  Patient__c = :patientId order by CreatedDate desc];
      }
   }
   
  public static List<Patient__c> queryPatientListAll() {
        return [Select id, 
                       Name,
                       Owner.Name,
                       Advocate_Email__c,
                       Advocate_Name__c,
                       Advocate_Phone__c,
                       Alternate_Email__c,
                       City__c,
                       Country__c,
                       Date_of_Birth__c,
                       Email__c,
                       Gender__c,
                       Ins_Verification_Date__c,
                       Ins_Clinic_Num__c,
                       Ins_Name__c,
                       Ins_Claim_Address__c,
                       Ins_Verify_Phone__c,
                       Medical_Reviews_Fax__c,
                       Ins_Contact__c,
                       Ins_Policy__c,
                       Ins_Group__c,
                       Ins_Effective_Date__c,
                       Ins_Dependent_Coverage__c,
                       Ins_Deductible__c,
                       Ins_Co_Pay__c,
                       Ins_Benefit_Percentage__c,
                       Ins_Out_of_Pocket__c,
                       Ins_Out_of_Pocket_Met__c,
                       Ins_Pre_Existing_Clause_Applies__c,
                       Ins_Lifetime_Max__c,
                       Ins_Pre_Cert_Required__c,
                       Ins_Pre_Auth_Phone__c,
                       Ins_Authorization_Num__c,
                       Ins_Comments__c,
                       Mobile__c,
                       Patient_Stage__c,
                       Insurance_Network__c,
                       Phone__c,
                       Postal_Code__c,
                       Preferred_Language__c,
                       Salutation__c,
                       State__c,
                       Street__c,
                       Time_Zone__c,
                       Last_Communication__c,
                       Nationality__c,
                       Patient_First_Name__c,
                       Patient_Last_Name__c,
                       Key_Contact__c,
                       Medical_Profile_Type__c,
                       Medical_Profile_Type__r.Name,
                       Email_Receipt_Allowed__c,
                       (select id, 
                               Name,
                               Destination_Facility__c,
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
                               Referral_Source__c, 
                               On_Site_Recovery_Period__c,
                               Patient__r.Original_Number_Rank__c,
                               Patient__c,
                               Patient__r.Email__c,
                               Onsite_Coordinator__c,
                               Onsite_Coordinator__r.Email,
                               Payment_Type__c, 
                               Phase__c,
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
                               Patient_Not_Committed_Reason__c,
                               Patient__r.Name,
                               Request_Summary__c,                               
                               Next_Follow_Up__c,
                               Primary_Campaign__c,
                               Related_Campaign__c,
                               Treatment_Summary__c 
                       from Treatments__r),
                       (select id,
                               Owner.Name,
                               CallDurationInSeconds,
                               CallObject,
                               CallDisposition,
                               CallType,
                               Description,
                               ActivityDate,
                               Who.Name,
                               Priority,
                               What.Name,
                               Status,
                               Subject
                       from Tasks order by CreatedDate desc),
                     /*(select id,
                               Name,
                              Owner.Name,
                              Body_Rich_Text__c,
                              Body__c,
                              Truncated_Body__c,
                              From_Name__c,
                              From__c,
                              Has_Attachments__c,
                              Priority__c,
                              IsRead__c,
                              Reply_Rich_Text__c,
                              Reply__c,
                              Sent__c,
                              Status__c,
                              To_Name__c,
                              To__c
                      from Messages__r), */ //todo fix the message relationship                                                                    
/*                      (select Id,
                              Name,
                              Benefit_Percentage__c,
                              Claim_Address__c,
                              Co_pay__c,
                              Deductible__c,
                              IsDeleted,
                              Dependent_Coverage__c,
                              Effective_Date__c, 
                              Fax_Number_Medical_Reviews__c,
                              Group__c,
                              Insurance_Contact__c,
                              Name_of_Insurance__c,
                              Patient__c,
                              Payment_Type__c,
                              Policy_ID__c, 
                              Treatment__c,
                              Verification_Date__c,
                              Verification_Phone_Number__c ,
                              Treatment__r.Name,
                              Patient__r.Name                                                           
                      from Payments__r),*/
                      (select Id,
                              Name,
                              IsDeleted,
                              Patient__c,
                              Survey_Id__c       
                      from Survey_Headers__r)
                from Patient__c];
    }
    
    public static void verifyPortalAccessAtInteractionPhase(
                                                    list<Treatment__c> newlist, 
                                                    list<Treatment__c> oldlist) {
        set<id> patientIds = new set<id>();
        for (integer i=0;i<newlist.size();i++){
            patientIds.add(newlist[i].patient__c);
        }
        
        map<id,id> patientKeyContactMap = new map<id,id>();
        for (Patient__c p : [select id, 
                            key_contact__c 
                            from Patient__c 
                            where id 
                            IN :patientIds]) {
            patientKeyContactMap.put(p.id,p.key_contact__c);
        }
        
        
        for(integer i=0; i<newlist.size(); i++) {
            if (newlist[i].Phase__c == PickListDefines.Phase.Interaction 
                    && patientKeyContactMap.get(newlist[i].Patient__c) == null) {
                createPatientPortalUser(newlist[i].patient__c);
            } else if (newlist[i].Phase__c == PickListDefines.Phase.Interaction && oldlist[i].Phase__c != PickListDefines.Phase.Interaction) {
            	String keyContact = patientKeyContactMap.get(newlist[i].Patient__c);
            	createPortalUserIfNeeded( newlist[i].Patient__c, keyContact );
            }
        }
    }
    
    /**
     * mWicherski@mkpartners.com
     * createPatientPortalUser
     * Creates an account and contact for the patient and calls a future method
     * to create the portal user.
     * @param string patientID
     */
    public static void createPatientPortalUser (string patientID) {
        
        // query patient for data
        Patient__c patient = [select    id,
                                        Name, 
                                        Patient_First_Name__c, 
                                        Patient_Last_Name__c, 
                                        email__c, 
                                        Date_of_Birth__c,
                                        key_contact__c 
                                    from Patient__c 
                                    where id = :patientID];
        
        Account a = new Account();
        a.name = patient.Name;
        insert a;
        
        Contact c = new Contact();
        c.firstname = patient.patient_first_name__c;
        c.lastname = patient.patient_last_name__c;
        c.email = patient.email__c;
        c.birthdate = patient.date_of_birth__c;
        c.accountid = a.id;
        
        insert c;
        
        patient.Key_Contact__c = c.id;
        update patient;
        
        futureCreatePortalUser(patient.id);
    }
    
    public static void createPortalUserIfNeeded( ID patientId, String keyContact ) {
    	if (keyContact == null) return;
    	User[] users = [select id from User where ContactId = :keyContact];
    	if (users.size()==0) {
   system.debug('User missing - creating portal user...');
    		futureCreatePortalUser(patientId);
    	}
    }
    /**
     * mWicherski@mkpartners.com
     * futureCreatePortalUser
     * facilitates actual portal user creation.
     * @param string patientID
     */   
    @future
    public static void futureCreatePortalUser(string patientid) { 
        
        // query patient for data
        Patient__c patient = [select    id, 
                                        Patient_First_Name__c, 
                                        Patient_Last_Name__c, 
                                        email__c, 
                                        Date_of_Birth__c,
                                        key_contact__c,
                                        key_contact__r.accountid 
                                    from Patient__c 
                                    where id = :patientID];
        
        
        User u = new User();
        string username = patient.Patient_First_Name__c.substring(0,1);
        username+=patient.patient_last_name__c;
        username+= (patient.date_of_birth__c != null)?string.valueof(patient.Date_of_Birth__c.year()).substring(2,3):'00'; 
        username.replace(' ','_');
        
        u.firstname = patient.patient_First_name__c;
        u.lastname = patient.patient_last_name__c;
        u.Alias = username.substring(0,5)+username.substring(username.length()-2,username.length());
        u.Username = username+='@patient.nuehealth.com';
        u.Email = patient.email__c;
        u.CommunityNickname = username; 
        u.TimeZoneSidKey = 'America/Tijuana';
        u.LocaleSidKey = 'en_US';
        u.EmailEncodingKey ='UTF-8';
        u.LanguageLocaleKey ='en_US';
        
        // create portal user
        String userId;
        //userId = Site.createPortalUser(   u, 
        //                              patient.key_contact__r.accountid,
        //                              null);              
        //u.AccountId = patient.Key_Contact__r.accountid;
        u.ContactId = patient.key_contact__c;
        u.ProfileId = [select id from Profile where name = 'patientPortal'].id;
        Database.SaveResult result = Database.Insert(u);    
        if (result.isSuccess()) {
            //send email to patient
/*          
            messaging.Singleemailmessage msg = new messaging.singleEmailMessage();
            msg.setToAddresses(new list<string>{patient.email__c});
            msg.setSubject('Welcome to your Health Travel Guides Portal Account');
            msg.setSenderDisplayName('Health Travel Guides');
            string plainbody;
            plainbody='Hello '+patient.patient_first_name__c+',\n\n';
            plainbody+='Welcome to the Health Travel Guides Portal Account.';
            plainbody+=' You will receive your login information shortly.';
            plainbody+='\n\nYou may login at the following page:\n\n';
            plainbody+='Login page: http:\\\\htt.force.com\n\n';
            plainbody+=' After your first login, you will be required to change your password.\n\n';
            msg.setPlainTextBody(plainbody);
            msg.setHtmlBody(plainbody.replace('\n','<br/>'));            
            messaging.sendemail(new list<Messaging.email>{msg});
*/

				    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
				    Treatment__c treatment = [Select Id, Patient__r.Id, Destination_Facility__c, CreatedDate From Treatment__c 
				                              Where Patient__r.Id = :patient.Id Order By CreatedDate Desc];
				    mail.setTargetObjectId(patient.Key_Contact__c);
				    mail.setWhatId(treatment.Id);
				    EmailTemplate et = [Select Id, DeveloperName, Name from EmailTemplate where DeveloperName = 'Welcome_to_Patient_Portal' ]; 
				    mail.setTemplateId(et.Id);
	system.debug('Sending email: mail='+mail);
	try {
				    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	system.debug('Send email Succeeded.');
	} catch (Exception ex) {
		system.debug('******************************* SendEmail Exception **************************************');
		system.debug(ex.getStackTraceString());
		throw ex;
	}  
                                        
            system.resetPassword(u.id, true);               
        }                           
        else {
            //notify an admin of failure
        }
    }
    
    /**
     * mWicherski@mkpartners.com
     * currentUserSamePatient
     * Verifies that the currently logged in user matches the patient for files being requested
     * @param string patientID
     * @return boolean ; true if match
     */
    public static boolean currentUserSamePatient(string patientID) {
        User currentUser = [select id, contactid from User where id = :userinfo.getUserId()];
        return 
            (currentUser.ContactId == [select id, key_contact__c from Patient__c where id = :patientID].key_contact__c)?true:false;
    }
    
    public static void deleteAll(map<id,Patient__c> oldmap) {
        list<Treatment__c> treatments = [select id from Treatment__c where patient__c IN :oldmap.keySet()];
        delete treatments;
    }
}