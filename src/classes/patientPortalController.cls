public  without sharing class patientPortalController {

	public Patient__c patient {get;set;}
	public string currentPage {get;set;}
	public boolean showDetailBox {get;set;}
	public string showDetailID {get;set;}
	public string patientid {get;set;}
	public map<id,sObject> detailMap {get;set;}
	public sObject showDetailRecord{get;set;}
	public string showDetailRecordType{get;set;}

	public Treatment__c detailTreatment {get;set;}
	public Task detailTask {get;set;}
	public Travel__c detailTravel {get;set;}
	public Payment__c detailPayment {get;set;}
	public Medical_Profile__c detailMedicalRecord {get;set;}
	public Incident__c detailIncident {get;set;}
	public Treatment_Quote__c detailTreatmentQuote {get;set;}

	public string tempstring {get;set;} // placeholder string to be deleted once portal built out more
	public Attachment tempfile {get;set;} // placeholder file to be deleted once portal built out more
	
	public list<recentActivity> recentActivities {get;set;}
	public list<Medical_Profile__c> medicalRecords {get;set;}
	public list<Travel__c> travelList {get;set;}
	public list<Treatment__c> treatmentList {get;set;}
	
	public class recentActivity {
		public string subject {get;set;}
		public string reference {get;set;}
		public string status {get;set;}
		public string dateCreated {get;set;}
		public datetime lastModified {get;set;}
		public string index {get;set;}
		public string relatedTreatment {get;set;}
		 
		public recentActivity () {}
	}
	
	public patientPortalController () {
		User u = [select id, contactid from User where id = :userinfo.getUserId()];
		
		list<Patient__c> plist = [select id 
							from Patient__c 
							where key_contact__c = :u.contactid
							limit 1]; 
		
		if (apexPages.currentPage().getparameters().get('devPatID') != null) {
			patientid = apexPages.currentPage().getparameters().get('devPatID');
			load();
		}
		else if (plist != null && plist.size() > 0) {
			patientid = plist[0].id;
			load();
		}
		else currentPage ='Portal User Error'; 
		showDetailBox = false;
	}
	
	public pagereference load() {
		patient = queryPatientRelatedDesc(patientid);
		detailMap = new map<id,sobject>();
		buildRecentActivity();
		buildRelatedLists();
		currentPage='Home';
		return null;
	}
	
	public pagereference buildRecentActivity() {
		recentActivities = new list<recentActivity>();
		for (Medical_Profile__c mp : patient.Medical_Profiles__r) {
			recentActivity r = new recentActivity();
			r.lastModified = mp.LastModifiedDate;
			r.subject = 'Medical Profile';
			r.reference = mp.name;
			r.status = '';
			r.dateCreated = string.valueof(mp.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = mp.id;
			r.relatedTreatment ='';
			detailMap.put(mp.id,mp);
		}
		
		for (Task t : patient.tasks) {
			recentActivity r = new recentActivity();
			r.lastModified = t.LastModifiedDate;
			r.subject = 'Task';
			r.reference = t.subject;
			r.status = '';
			r.dateCreated = string.valueof(t.CreatedDate);			
			sortInsertRecentActivity(r);
			r.index = t.id;
			r.relatedTreatment ='';
			detailMap.put(t.id,t);
		}
		
		for (Payment__c p : patient.payments__r) {
			recentActivity r = new recentActivity();
			r.lastModified = p.LastModifiedDate;
			r.subject = 'Payment';
			r.reference = p.name;
			r.status = '';
			r.dateCreated = string.valueof(p.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = p.id;
			r.relatedTreatment ='';
			detailMap.put(p.id,p);
		}
		
		set<id> treatmentIds = new set<id>();
		for (Treatment__c t : patient.treatments__r) {
			recentActivity r = new recentActivity();
			r.lastModified = t.LastModifiedDate;
			r.subject = 'Treatment';
			r.reference = t.name;
			r.status = '';
			r.dateCreated = string.valueof(t.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = t.id;
			r.relatedTreatment ='';
			detailMap.put(t.id,t);
			treatmentIds.add(t.id);
		}
		
		map<id,Treatment__c> treatmentMap = new map<id,Treatment__c>();
		for (id i : treatmentIds) {
			treatmentMap.put(i,patientUtil.getTreatmentChildren(i));
		}
		
		for (string s : treatmentMap.keySet()) {
			Travel__c t = (Travel__c)treatmentMap.get(s).travel__r;
			recentActivity r = new recentActivity();
			r.lastModified = t.LastModifiedDate;
			r.subject = 'Travel';
			r.reference = t.name;
			r.status = '';
			r.dateCreated = string.valueof(t.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = t.id;
			r.relatedTreatment = t.name;
			detailMap.put(t.id,t);
			
			for (Incident__c i : treatmentMap.get(s).Incidents__r) {
				r = new recentActivity();
				r.lastModified = i.LastModifiedDate;
				r.subject = 'Incident';
				r.reference = i.name;
				r.status = '';
				r.dateCreated = string.valueof(i.CreatedDate);
				sortInsertRecentActivity(r);
				r.index = i.id;
				r.relatedTreatment = i.name;
				detailMap.put(i.id,i);
			}
			
			for (Treatment_Quote__c tq : treatmentMap.get(s).Treatment_Quotes__r) {
				r = new recentActivity();
				r.lastModified = tq.LastModifiedDate;
				r.subject = 'Treatment Quote';
				r.reference = tq.name;
				r.status = '';
				r.dateCreated = string.valueof(tq.CreatedDate);
				sortInsertRecentActivity(r);
				r.index = tq.id;
				r.relatedTreatment = tq.name;
				detailMap.put(tq.id,tq);
			}
		}
		return null;
	}
	
	public pagereference sortInsertRecentActivity (recentActivity r) {
		if (recentActivities.size() > 0) {
			recentActivities.add(r);
			for (integer i = recentActivities.size()-1; i >=0 ; i--) { //reverse
				if (r.lastModified > recentActivities[i].lastModified) {
					for (integer j = recentActivities.size()-1; j> i+1; j--) {
						recentActivities[j] = recentActivities[j-1];
					}
					break;
				}
				else break; //if not more recent than last element in list, leave at end
			}
		}
		else recentActivities.add(r);
		
		if (recentActivities.size() > 10) {
			recentActivities.remove(10); //10th index is 11th item
		}
		return null;
	}
	
	public pagereference buildRelatedLists () {
		medicalRecords = patient.medical_profiles__r;
		treatmentList = patient.treatments__r;
/*TO BE REPLACED WITH ITINERARY?*/
		travelList = new list<Travel__c>();
		return null;
	}
	
	public pagereference goToHome(){ 
		currentPage='Home';
		return null;
	}
	
	public pagereference goToMedicalRecords(){
		currentPage = 'Medical Records';
		return null;
	}
	
	public pagereference goToYourTravel () {
		currentPage = 'Your Travel';
		return null;
	}
	
	public pagereference goToHaveAQuestion() {
		currentPage = 'Have a Question?';
		return null;
	}
	
	public pagereference goToYourTreatment (){
		currentPage = 'Your Treatment'; 
		return null;
	}

	public pagereference showDetails(){
		if (showDetailBox==false) {
			if (apexpages.currentpage().getparameters().get('showDetailID')!= null){
				showDetailID = apexpages.currentpage().getparameters().get('showDetailID');
			}
			showDetailRecord = detailMap.get(showDetailId);

			if (showDetailRecord instanceof Treatment__c){
				showDetailRecordType = 'Treatment';
				detailTreatment = (Treatment__c)showDetailRecord;
			}	
			else if (showDetailRecord instanceof Task){
				showDetailRecordType = 'Task';
				detailTask = (Task)showDetailRecord;
			}
			else if (showDetailRecord instanceof Travel__c){
				showDetailRecordType = 'Travel';
				detailTravel = (Travel__c)showDetailRecord;
			}
			else if (showDetailRecord instanceof Payment__c){
				showDetailRecordType = 'Payment';
				detailPayment = (Payment__c)showDetailRecord;
			}
			else if (showDetailRecord instanceof Medical_Profile__c){
				showDetailRecordType = 'Medical Record';
				detailMedicalRecord = (Medical_Profile__c)showDetailRecord;
			}
			else if (showDetailRecord instanceof Incident__c){
				showDetailRecordType = 'Incident';
				detailIncident = (Incident__c)showDetailRecord;
			}
			else if (showDetailRecord instanceof Treatment_Quote__c){
				showDetailRecordType = 'Treatment Quote';
				detailTreatmentQuote = (Treatment_Quote__c)showDetailRecord;
			}
			else showDetailRecordType = 'Undefined';
			
			showDetailBox = true;
		}
		else showDetailBox = false;
		return null;
	}
	
	@isTest (seealldata=true)
	public static void patientPortalTest (){
		User u = new User(
			lastname='test',
			alias='test',
			email='test@test.com',
			username='patientportal@test.com',
			CommunityNickname ='tester',
			timeZoneSidKey='America/Los_Angeles',
			localeSidKey='en_US',
			emailencodingkey='UTF-8',
			profileid=[select id from Profile limit 1].id,
			languagelocalekey='en_US'
			);
		insert u;
		
		Patient__c p = new Patient__c(name='testp');
		insert p;
		
		Travel__c testTravel = new Travel__c();
		testTravel.Patient__c = p.id;
		insert testTravel;

		Treatment__c treatmentTest = new treatment__c();
		treatmentTest.Travel__c = testTravel.Id;
		insert treatmentTest;
		
		Task taskTest = new Task();
		taskTest.Subject = 'test';
		taskTest.Status = 'None';
		taskTest.WhatId = p.id;
		insert taskTest;
		
		
		Payment__c paymentTest = new Payment__c();
		paymentTest.Patient__c = p.id;
		paymentTest.Treatment__c = treatmentTest.id;
		insert paymentTest;
		
		Medical_Profile__c MRTest = new Medical_Profile__c();
		MRTest.Patient__c = p.id;
		MRTest.Treatment__c = treatmentTest.id;
		insert MRTest;
		
		Incident__c incidentTest = new Incident__c();
		incidentTest.Treatment__c = treatmentTest.id;
		insert incidentTest;
				
		Treatment_Quote__c quoteTest = new Treatment_Quote__c();
		quoteTest.Treatment__c = treatmentTest.id;
		insert quoteTest;
				
		system.runAs(u) {
			Pagereference pg = Page.patientPortal;
			pg.getParameters().put('devPatID',p.id);
			test.setCurrentPage(pg);
			patientPortalController pcont = new patientPortalController();
			pcont.goToHome();
			pcont.goToMedicalRecords();
			pcont.goToYourTravel();
			pcont.goToHaveAQuestion();
			pcont.goToYourTreatment();
			pcont.showDetails();
		}
	}
	
	public Patient__c queryPatientRelatedDesc(string patientId) {
		return [Select id, 
                       Name,
                       CreatedBy.Name,
                       CreatedDate,
                       LastModifiedBy.Name,
                       LastModifiedDate,
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
                       Mobile__c,
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
                       (select id, 
                               Name,
                               CreatedBy.Name,
                               CreatedDate,                                                             
                               LastModifiedBy.Name,
                               LastModifiedDate,
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
                               Patient_Not_Committed_Reason__c,
                               Patient__r.Name,
                               Probability__c,
                               Request_Summary__c,
                               Next_Follow_Up__c,
                               Primary_Campaign__c,
                               Related_Campaign__c,
                               Treatment_Summary__c                                 
                       from Treatments__r
                       order by lastModifiedDate desc),
                       (select id,
                               Owner.Name,
                               CallDurationInSeconds,
                               CallObject,
                               CallDisposition,
                               CallType,
                               Description,
                               CreatedBy.Name,
                               CreatedDate,
                               ActivityDate,
                               LastModifiedBy.Name,
                               LastModifiedDate,
                               Who.Name,
                               Priority,
                               What.Name,
                               Status,
                               Subject
                       from Tasks
                       order by lastModifiedDate desc), 
                     /*(select id,
                               Name,
                              CreatedBy.Name,
                              CreatedDate,
                              LastModifiedBy.Name,
                              LastModifiedDate,
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
                      from Messages__r
                      order by lastModifiedDate desc), */ //todo fix the message relationship                                                                    
                      (select Id,
                              Name,
                              Benefit_Percentage__c,
                              Claim_Address__c,
                              Co_pay__c,
                              CreatedBy.Name,
                              CreatedDate, 
                              Deductible__c,
                              IsDeleted,
                              Dependent_Coverage__c,
                              Effective_Date__c, 
                              Fax_Number_Medical_Reviews__c,
                              Group__c,
                              Insurance_Contact__c,
                              LastModifiedBy.Name, 
                              LastModifiedDate,
                              Name_of_Insurance__c,
                              Patient__c,
                              Payment_Type__c,
                              Policy_ID__c, 
                              SystemModstamp,
                              Treatment__c,
                              Verification_Date__c,
                              Verification_Phone_Number__c 
                      from Payments__r
                      order by lastModifiedDate desc),
                      (select Id,
                              Name,
                              CreatedBy.Name,
                              CreatedDate,
                              IsDeleted,
                              LastModifiedBy.Name, 
                              LastModifiedDate,
                              Patient__c,
                              SystemModstamp,
                              Treatment__c         
                      from Medical_Profiles__r
                      order by lastModifiedDate desc)
                from Patient__c 
                where id = :patientId];
	}
	
	public Treatment__c queryTreatmentRelatedDesc(string treatmentId) {
		return null;
	}
}