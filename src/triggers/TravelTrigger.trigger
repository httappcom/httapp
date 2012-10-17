trigger TravelTrigger on Travel__c (after insert, after update, before insert, 
before update) {
	
	if (trigger.isBefore && trigger.isInsert) {
		travelUtility.beforeInsert(trigger.new);
	}
	
	if (trigger.isBefore && trigger.isUpdate) {
		travelUtility.beforeUpdate(trigger.new, trigger.oldmap);
	}
	
	if (trigger.isAfter && trigger.isInsert){
		travelUtility.afterInsert(trigger.new);
	}
	
	if (trigger.isAfter && trigger.isUpdate) {
		travelUtility.afterUpdate(trigger.new, trigger.oldmap);
	}
}