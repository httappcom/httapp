trigger MedicalFacility on Medical_Facility__c (after Insert, after Update) {
    if ( trigger.isAfter && (trigger.isInsert || Trigger.isUpdate)) {
        MedicalFacilityUtil.afterInsertOrUpdate( Trigger.newMap );
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        Set<String> names = new Set<String>();
        for (Medical_Facility__c medicalFacility : Trigger.new) {
            names.add(medicalFacility.name);
        }
        Group[] groups = [select Name from Group where Name in :names];
        Map<String, group> groupMap = new Map<String, group>();
        for (Group grp : groups) {
            groupMap.put(grp.Name, grp);
        }
        List<Group> insertGroups = new List<Group>();
        for (Medical_Facility__c medFac : Trigger.new) {
            if (!groupMap.containsKey(medFac.Name)) {
                Group grp = new Group(DoesIncludeBosses=true, DoesSendEmailToMembers=false, Type='Regular');
                grp.Name = medFac.Name;
                insertGroups.add(grp);
            }
        }
        if (insertGroups.size()>0) {
            insert insertGroups;
        }
    }
}