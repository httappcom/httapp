trigger prmUserTrigger on PRM_User__c (after insert, after update, after delete) {
    if (Trigger.isAfter) {
        Group[] groups = [select id from Group where Name='Facilitator PCCs'];
        ID groupId = groups[0].id;
        GroupMember[] groupMembers = [select UserOrGroupId from GroupMember where GroupId=:groupId];
        Set<ID> existingMembers = new Set<ID>();
        for (GroupMember member : groupMembers) {
            existingMembers.add(member.UserOrGroupId);
        }
        PRM_User__c[] users = [select User__c from PRM_User__c];
        List<ID> groupIds = new List<ID>();
        List<ID> userOrGroupIds = new List<ID>();
        for (PRM_User__c user : users) {
            if (!existingMembers.contains(user.User__c)) {
               groupIds.add(groupId);
               userOrGroupIds.add(user.User__c);
            }
        }
        GroupMemberUtil.insertGroupMembers( groupIds, userOrGroupIds);
    }

}