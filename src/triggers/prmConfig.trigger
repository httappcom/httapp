trigger prmConfig on PRM_Config__c (before Update, before Insert) {
    PRMConfigUtil.before( (List<PRM_Config__c>)Trigger.new );
}