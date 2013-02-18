public with sharing class surveyPDF_Controller {
    public Id MedicalProfileId { get; private set; }
    
    public surveyPDF_Controller() {
        if (apexpages.currentpage().getparameters().get('surveyid')!=null) {
            MedicalProfileId = apexpages.currentpage().getparameters().get('surveyid');
        }
    }  
}