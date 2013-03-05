trigger TaskSpecifierTrigger on Task_Specifier__c (before update, before insert) {
    TaskSpecifierUtility.beforeInsertOrUpdate( Trigger.new );
}