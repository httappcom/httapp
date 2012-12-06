trigger PatientTrigger on Patient__c (before insert, before update) {
	if (Trigger.isBefore) {
    	if (Trigger.isInsert) {
      		PatientRank.startRanking(Trigger.new);
    	}
  	}
  	for (Patient__c patient : Trigger.new) {
  	    patient.Name  = patient.Patient_Last_Name__c;
  	    String space = (patient.Name == null || patient.Name == '') ? '' : ' ';
  	    if (patient.Patient_Last_Name__c == null) {
  	    	patient.Name = patient.Patient_First_Name__c +space + patient.Name;
  	    }
  	}
}