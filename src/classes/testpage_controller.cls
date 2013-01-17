public with sharing class testpage_controller {

	public Contact c {get;set;}

	public testpage_controller () {
		
	}
	
	public pagereference onload () {

		string encryptedPID = apexpages.currentpage().getparameters().get('pid');
		system.debug(encryptedPID);
		string patientID = surveyGizmoAPI_Methods.decryptPatientId(encryptedPID);
		system.debug(patientID);
		surveyGizmoAPI_Methods.retrieveMedicalProfile(patientID);		

		return null;
	}
}