trigger TreatmentTrigger on Treatment__c (before insert, before update, after insert, after update) {

	if (trigger.isBefore && trigger.isInsert) {
		TreatmentUtility.beforeInsert(Trigger.new);
	}

	if ( trigger.isAfter && trigger.isInsert ){
		TreatmentUtility.afterInsert(trigger.new);
	}
    
	if (trigger.isBefore && trigger.isupdate){
		TreatmentUtility.beforeUpdate(Trigger.new, Trigger.oldMap);
	}
  
	if (trigger.isAfter && trigger.isUpdate) {
		patientUtil.verifyPortalAccessAtInteractionPhase(trigger.new, trigger.old);
	}
}