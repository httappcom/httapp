public with sharing class surveyPDF_Controller {

	public string type {get;set;}
	public Medical_Profile_Header__c medicalProfile {get;set;}
    public list<Medical_Profile_Question__c> medicalProfileQuestions {get;set;} 
    public Satisfaction_Survey__c satisfactionSurvey {get;set;}
    public list<Satisfaction_Survey_Question__c> satisfactionSurveyQuestions {get;set;}
    public string patientName {get;set;}
    public boolean error {get;set;}
    
    public surveyPDF_Controller(){
    	error = false;
    	if (apexpages.currentpage().getparameters().get('type')!=null) {
    		type = apexpages.currentpage().getparameters().get('type');
    	}
    	
    	if (type == 'm' && apexpages.currentpage().getparameters().get('id') != null) {
    		medicalProfile = [select id, name, patient__c, profile_id__c, patient__r.name from Medical_Profile_Header__c where id = :apexpages.currentpage().getparameters().get('id')];
    		medicalProfileQuestions = patientUtil.queryMedicalProfileQuestions(medicalProfile.id);
    	}
    	else if (type=='s' && apexpages.currentpage().getparameters().get('id') != null) {
    		satisfactionSurvey = [select id, name, survey_id__c, treatment__c, treatment__r.patient__r.name from Satisfaction_Survey__c where id = :apexpages.currentpage().getparameters().get('id')];
    		satisfactionSurveyQuestions = treatmentUtility.querySatisfactionSurveyQuestions(satisfactionSurvey.id);
    	}
    	else{
    		error = true;
    		apexpages.addmessage(new ApexPages.Message(ApexPages.Severity.error, 'Could not find a survey of this type with specified id.'));
    	}
    }  
}