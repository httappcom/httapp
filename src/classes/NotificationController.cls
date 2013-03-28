public with sharing class NotificationController {
  public Treatment__c treatment {get; set; }
  public String treatmentId;
  public void setTreatmentId(String i){ treatmentId = i; }
  public String getTreatmentId() { return treatmentId; }
  public String treatmentURL {
  	get {
  		if (treatment != null) { return '/Patient?id=' + treatment.Patient__c + '&tid=' + treatment.Id; }
  		else return '';
  	}
  	set;
  }
  public void NotificationController()
  {
  	treatment = new Treatment__c();
  }
  public void loadTreatmentInfo()
  {
  	Logger.info('TreatmentId: ' + treatmentId);
  	if (treatmentId != null)
  	{
  	   List<Treatment__c> treatments = [Select Name, Id, Patient__r.Name, Patient__c from Treatment__c Where Id = : treatmentId];
  	   if (treatments.size() > 0) { treatment = treatments[0]; }
  	}
  } 
}