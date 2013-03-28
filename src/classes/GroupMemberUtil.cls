public with sharing class GroupMemberUtil {
	
	@future
	public static void insertGroupMembers( List<Id> GroupIds, List<ID> UserOrGroupIds) {
system.debug('groupids='+GroupIds);
		List<GroupMember> members = new List<GroupMember>();
		for (Integer i=0;i<UserOrGroupIds.size();i++) {
			members.add(new GroupMember(GroupId=GroupIds[i], UserOrGroupId=UserOrGroupIds[i]));
		}
system.debug('inserting members='+members);
		insert members;
	}
}