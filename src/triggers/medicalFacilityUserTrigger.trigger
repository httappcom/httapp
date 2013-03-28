trigger medicalFacilityUserTrigger on Medical_Facility_User__c ( before Insert, before Update, after insert, after update, after delete) {
    if (Trigger.isAfter) {
        Group[] groups = [select id, Name from Group where Type='Regular' AND Name <> null];
  system.debug('groups='+groups);
        Map<String, Id> groupMap = new Map<String, Id>();
        for (Group grp : groups) {
  system.debug('group Name='+grp.Name);
            groupMap.put(grp.Name, grp.id);
        }
        GroupMember[] groupMembers = [select UserOrGroupId, GroupId from GroupMember where GroupId in :groupMap.values()];
        Map<ID,Set<ID>> existingMembersMap = new Map<Id,Set<ID>>();
        for (GroupMember member : groupMembers) {
            Set<ID> memberSet = existingMembersMap.get(member.GroupId);
            if (memberSet == null) {
                memberSet = new Set<ID>();
                existingMembersMap.put(member.GroupId, memberSet);
            }
            memberSet.add(member.UserOrGroupId);
        }
        Medical_Facility_User__c[] users = [select User__c, Medical_Facility__r.Name from Medical_Facility_User__c];
        List<ID> groupIds = new List<ID>();
        List<ID> userOrGroupIds = new List<ID>();
        for (Medical_Facility_User__c user : users) {
   system.debug('MedFac Name='+user.Medical_Facility__r.Name);
            ID groupId = groupMap.get(user.Medical_Facility__r.Name);
            Set<ID> memberSet = existingMembersMap.get(groupId);
            if ((memberSet==null || !memberSet.contains(user.User__c)) && groupId != null) {
                groupIds.add(groupId);
                userOrGroupIds.add(user.User__c);
  system.debug('Adding User 2:groupId='+groupId+', user='+user.User__c);
            }
        }
        GroupMemberUtil.insertGroupMembers( groupIds, userOrGroupIds);
    }
}