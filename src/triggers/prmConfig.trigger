trigger prmConfig on PRM_Config__c (before Insert, before Update, after Insert) {
    if (Trigger.isBefore) {
        for (Prm_Config__c config : Trigger.new) {
            config.Name='Facilitator Org Configuration';
        }
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        Group[] groups = [select Name from Group where Name='Facilitator PCCs'];
        if (groups.size()==0) {
            Group grp = new Group(DoesIncludeBosses=true, DoesSendEmailToMembers=false, Type='Regular');
            grp.Name = 'Facilitator PCCs';
            insert grp;
        }
    }
}