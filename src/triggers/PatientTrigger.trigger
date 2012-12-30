trigger PatientTrigger on Patient__c (before insert, before update, before delete) {
	
	if (trigger.isBefore && trigger.isInsert) {
   		PatientRank.startRanking(Trigger.new);
  	}
  	
  	if (trigger.isBefore && (trigger.isInsert || trigger.isUpdate)) {
  		for (Patient__c patient : Trigger.new) {
	  	    patient.Name  = patient.Patient_Last_Name__c;
	  	    String space = (patient.Name == null || patient.Name == '') ? '' : ' ';
	  	    if (patient.Patient_First_Name__c != null) {
	  	    	patient.Name = patient.Patient_First_Name__c +space + patient.Name;
	  	    }
  		}	
  	}
  	
  	if (trigger.isBefore && trigger.isDelete){
  		patientUtil.deleteAll(trigger.oldmap); 
  	} 
}