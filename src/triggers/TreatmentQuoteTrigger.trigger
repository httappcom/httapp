trigger TreatmentQuoteTrigger on Treatment_Quote__c (after insert, after update) {
    if ( trigger.isAfter && trigger.isInsert ){
        TreatmentQuoteUtility.afterInsert(trigger.new);
    }
    if ( trigger.isAfter && trigger.isUpdate ){
        TreatmentQuoteUtility.afterUpdate(trigger.new);
    }
    

}