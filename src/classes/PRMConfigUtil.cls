public with sharing class PRMConfigUtil {
    public static void before( List<PRM_Config__c> prmConfigs ) {
        Map<String, Group> groupMap = new Map<String, Group>();
        Group[] groups = [select id, Name from Group];
        for (Group grp : groups) {
            groupMap.put(grp.Name, grp);
        }
        for (PRM_Config__c config : prmConfigs) {
            if (!groupMap.containsKey(config.Public_Group__c)) {
                config.addError('Please enter a valid Public Group name.');
            }
        }
    }
}