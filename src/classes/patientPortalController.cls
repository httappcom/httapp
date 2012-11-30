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
		patient = patientUtil.queryPatientAll(patientid);
		detailMap = new map<id,sobject>();
		buildRecentActivity();
		buildRelatedLists();
		currentPage='Home';
		return null;
	}
	
	public pagereference buildRecentActivity() {
		recentActivities = new list<recentActivity>();
		for (Treatment__c t : patient.treatments__r) {
			recentActivity r = new recentActivity();
			r.lastModified = t.LastModifiedDate;
			r.subject = 'Treatment';
			r.reference = t.name;
			r.status = '';
			r.dateCreated = string.valueof(t.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = t.id;
			detailMap.put(t.id,t);
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
			detailMap.put(t.id,t);
		}
		
		for (Travel__c t : patient.travels__r) {
			recentActivity r = new recentActivity();
			r.lastModified = t.LastModifiedDate;
			r.subject = 'Travel';
			r.reference = t.name;
			r.status = '';
			r.dateCreated = string.valueof(t.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = t.id;
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
			detailMap.put(p.id,p);
		}
		
		for (Medical_Profile__c mp : patient.Medical_Profiles__r) {
			recentActivity r = new recentActivity();
			r.lastModified = mp.LastModifiedDate;
			r.subject = 'Medical Profile';
			r.reference = mp.name;
			r.status = '';
			r.dateCreated = string.valueof(mp.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = mp.id;
			detailMap.put(mp.id,mp);
		}
		
		for (Incident__c i : patient.Incidents__r) {
			recentActivity r = new recentActivity();
			r.lastModified = i.LastModifiedDate;
			r.subject = 'Incident'+patient.incidents__r.size();
			r.reference = i.name;
			r.status = '';
			r.dateCreated = string.valueof(i.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = i.id;
			detailMap.put(i.id,i);
		}
		
		for (Treatment_Quote__c tq : patient.Treatment_Quotes__r) {
			recentActivity r = new recentActivity();
			r.lastModified = tq.LastModifiedDate;
			r.subject = 'Treatment Quote';
			r.reference = tq.name;
			r.status = '';
			r.dateCreated = string.valueof(tq.CreatedDate);
			sortInsertRecentActivity(r);
			r.index = tq.id;
			detailMap.put(tq.id,tq);
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
		travelList = patient.travels__r;
		treatmentList = patient.treatments__r;
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
		
		Treatment__c treatmentTest = new treatment__c();
		treatmentTest.Patient__c = p.id;
		insert treatmentTest;
		
		Task taskTest = new Task();
		taskTest.Subject = 'test';
		taskTest.Status = 'None';
		taskTest.WhatId = p.id;
		insert taskTest;
		
		Travel__c testTravel = new Travel__c();
		testTravel.Patient__c = p.id;
		testTravel.Treatment__c = treatmentTest.id;
		insert testTravel;
		
		Payment__c paymentTest = new Payment__c();
		paymentTest.Patient__c = p.id;
		paymentTest.Treatment__c = treatmentTest.id;
		insert paymentTest;
		
		Medical_Profile__c MRTest = new Medical_Profile__c();
		MRTest.Patient__c = p.id;
		MRTest.Treatment__c = treatmentTest.id;
		insert MRTest;
		
		Incident__c incidentTest = new Incident__c();
		incidentTest.Patient__c = p.id;
		incidentTest.Treatment__c = treatmentTest.id;
		insert incidentTest;
				
		Treatment_Quote__c quoteTest = new Treatment_Quote__c();
		quoteTest.Patient__c = p.id;
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
}