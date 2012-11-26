public  without sharing class patientPortalController {

	public Patient__c patient {get;set;}
	public string currentPage {get;set;}
	public boolean showDetailBox {get;set;}
	public string showDetailID {get;set;}

	public string tempstring {get;set;} // placeholder string to be deleted once portal built out more
	public Attachment tempfile {get;set;} // placeholder file to be deleted once portal built out more
	
	public patientPortalController () {
		User u = [select id, contactid from User where id = :userinfo.getUserId()];
		string patientid = [select id 
							from Patient__c 
							where key_contact__c = :u.contactid
							limit 1].id;
		patient = patientUtil.queryPatientAll(patientid);
		
		currentPage='Home';
		showDetailBox = false;
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
		if (showDetailBox == false) {
			showDetailBox = true;
		}
		else {
			showDetailBox = false;
		}
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
		p.Portal_User__c = u.id;
		
		insert p;
		
		system.runAs(u) {
			patientPortalController pcont = new patientPortalController();
			pcont.goToHome();
			pcont.goToMedicalRecords();
			pcont.goToYourTravel();
			pcont.goToHaveAQuestion();
			pcont.goToYourTreatment();
		}
	}
}