public with sharing class AccessUtil {
	public static User[] getMedicalFacilityUsers( ID medicalFacilityId ) {
      	Medical_Facility__c medicalFacility = [select Public_Group__c from Medical_Facility__c 
      			where id = :medicalFacilityId limit 1];
      	return [ Select Id, Name, Email from User where id in 
      			(select UserOrGroupId from GroupMember  
                             Where Group.Name = :medicalFacility.Public_Group__c) ];
	}
	public static User[] getFacilitatorOrgUsers() {
		PRM_Config__c prmConfig = [Select Public_Group__c from PRM_Config__c Limit 1];
      	return [ Select Id, Name, Email from User where id in 
      			(select UserOrGroupId from GroupMember  
                             Where Group.Name = :prmConfig.Public_Group__c) ];
	}

	public static User[] getInsuranceNetworkUsers() {
		Insurance_Network__c insNetwork = [Select Public_Group__c from Insurance_Network__c Limit 1];
      	return [ Select Id, Name, Email from User where id in 
      			(select UserOrGroupId from GroupMember  
                             Where Group.Name = :insNetwork.Public_Group__c) ];
	}
	
	public static Map<ID, Set<ID>> getSharingMembership( List<SObject> shares ) {
		Map<ID, Set<ID>> retMap = new Map<ID, Set<ID>>();
		Treatment__Share ts = new Treatment__Share();
		for (SObject share : shares ) {
			ID pId = (ID)share.get('parentId');
			Set<Id> memberSet = retMap.get(pId);
			if (memberSet == null) {
				memberSet = new Set<ID>();
				retMap.put(pId, memberSet);
			}
			memberSet.add((ID)share.get('UserOrGroupId'));
		}
		return retMap;
	}

	//Schema.Treatment__Share.RowCause.Care_Team__c
	//Treatment__Share.class.newInstance() [clazz.newInstance()]
	public static void updateSharing( String className, Object sharingReason, 
		List<SObject> currentSharing, Map<ID, UsersAndGroups> requiredSharing ) {

		Map<ID, Set<ID>> curSharingMap = getSharingMembership( currentSharing );
		List<SObject> shareList = new List<SObject>();
		for (ID parentId : requiredSharing.keySet()) {
			UsersAndGroups lists = requiredSharing.get(parentId);
			Set<ID> curSharingSet = curSharingMap.get(parentId);
			List<ID> fullList = new List<ID>();
			fullList.addAll(lists.users);
			fullList.addAll(lists.groups);
			for (ID id : fullList) {
				if (curSharingSet == null || !curSharingSet.contains(id)) {
	system.debug('className='+className);
					if (className == 'Treatment__Share') {
						Treatment__Share st = new Treatment__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=(String)sharingReason);
	system.debug('st='+st);
						shareList.add(st);
					} else if (className == 'Travel__Share'){
						Travel__Share st = new Travel__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=(String)sharingReason);
	system.debug('st='+st);
/*					} else if (className == 'Care_Team_Member__Share'){
						Care_Team_Member__Share st = new Care_Team_Member__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=(String)sharingReason);
						shareList.add(st);*/
					} else if (className == 'Medical_Facility__Share'){
						Medical_Facility__Share st = new Medical_Facility__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=(String)sharingReason);
						shareList.add(st);
					} else if (className == 'Patient__Share'){
						Patient__Share st = new Patient__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=(String)sharingReason);
						shareList.add(st);
					} else if (className == 'Survey_Header__Share'){
						Survey_Header__Share st = new Survey_Header__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=(String)sharingReason);
						shareList.add(st);
					} else {
						throw new NueException('Unknown share class '+className);
					}
				}
			}
		}
		if (shareList.size()>0) {
			insert shareList;
		}
	}
	
	public class UsersAndGroups {
		public List<ID> users = new List<ID>();
		public List<ID> groups = new List<ID>();
	}
	public static Map<ID, UsersAndGroups> getCareTeamUsersOrGroups( Treatment__c[] treatments ) {
system.debug('getCareTeamUsersOrGroups');
		Map<ID, UsersAndGroups> retMap = new Map<ID, UsersAndGroups>();
		PRM_Config__c prmConfig = [select Public_Group__c from PRM_Config__c limit 1];
		Set<String> groupNames = new Set<String>{prmConfig.Public_Group__c};
 		for (Treatment__c treatment : treatments) {
 			if (treatment.Destination_Facility__c != null && treatment.Destination_Facility__r.Public_Group__c != null) {
 				groupNames.add(treatment.Destination_Facility__r.Public_Group__c);
 			}
 		}
 system.debug('groupNames='+groupNames);
		GroupMember[] groupMembers = [select id, 
			GroupId, Group.Name, UserOrGroupId
			from GroupMember
			where Group.Name in :groupNames];
		Map<String, Set<ID>> groupMembershipMap = new Map<String, Set<ID>>();
		Map<String,ID> groupIdMap = new Map<String,ID>();
		for (GroupMember gMember : groupMembers) {
			Set<ID> groupUsers = groupMembershipMap.get(gMember.Group.Name);
			if (groupUsers == null) {
				groupUsers = new Set<ID>();
				groupMembershipMap.put(gMember.Group.Name, groupUsers); 
			}
			groupUsers.add(gMember.UserOrGroupId);
			groupIdMap.put(gMember.Group.Name, gMember.GroupId);
		}
		for (Treatment__c treatment : treatments) {
			UsersAndGroups lists = retMap.get(treatment.id);
			if (lists == null) {
				lists = new UsersAndGroups();
				retMap.put(treatment.id, lists);
			}
			String curGroup = null;
			if (treatment.Destination_Facility__c != null) {
				curGroup = treatment.Destination_Facility__r.Public_Group__c;
			} else if (prmConfig.Public_Group__c != null) {
				curGroup = prmConfig.Public_Group__c;
			}
system.debug('curGroup='+curGroup);
			Set<ID> curGroupUsers = groupMembershipMap.get(curGroup);
			if (curGroupUsers != null) {
system.debug('treatment.Care_Team_Members__r='+treatment.Care_Team_Members__r);
				for (Care_Team_Member__c member : treatment.Care_Team_Members__r) {
system.debug('member.User__r.UserType='+member.User__r.UserType);
					if (member.User__r.UserType == 'Standard') {
system.debug('curGroupUsers='+curGroupUsers);
						if (curGroupUsers.contains(member.User__c)) {
							lists.groups.add(groupIdMap.get(curGroup));
						} else {
system.debug('adding member.User__c');
							lists.users.add(member.User__c);
						}
					}
				}
			}
system.debug('list.users='+lists.users);
system.debug('list.groups='+lists.groups);
		}
		return retMap;
	}
	
	public static Map<ID, UsersAndGroups> getParentUsersAndGroups( Map<ID, ID> parentToXMap, Map<ID, UsersAndGroups> usersAndGroupsMap) {
		Map<ID, UsersAndGroups> retMap = new Map<ID, UsersAndGroups>();
		for (ID parentId : parentToXMap.keySet()) {
			retMap.put(parentId, usersAndGroupsMap.get(parentToXMap.get(parentId)));
		}
		return retMap;
	}

	/*
		This function assumes this is called for a newly create Treatment for which there is currently no apex sharing yet created.
		Need to add current owner to sharing
	*/
/*	public static void replaceTreatmentOwner( List<Treatment__c> treatments, Map<Integer, ID> changeOwnershipRequests ) {
		if (!Trigger.isInsert && !Trigger.isAfter) throw new NueException('replaceTreatmentOwner should only be used in Treatment after insert event.');
  		ID curUser = UserInfo.getUserId();
  		Set<ID> treatmentIds = new Set<ID>();
		List<Treatment__Share> insertShares = new List<Treatment__Share>();
		for (Integer idx : changeOwnershipRequests.keySet()) {
			Treatment__c treatment = treatments[idx];
			if (treatment != null) {
				treatmentIds.add(treatment.id);
				insertShares.add(new Treatment__Share(parentId=treatment.id, UserOrGroupId=curUser,AccessLevel='edit',RowCause=Schema.Treatment__Share.RowCause.Care_Team__c));
			}
		} 
		insert insertShares;
		Map<ID,Treatment__c> updateTreatmentsMap = new Map<ID,Treatment__c>([select Id,OwnerId from Treatment__c where id in:treatmentIds]);
		Set<ID> updatedTreatments = new Set<ID>();
		List<Treatment__c> updateTreatments = new List<Treatment__c>();
		for (Integer idx : changeOwnershipRequests.keySet()) {
			Treatment__c treatment = treatments[idx];
			if (!updatedTreatments.contains(treatment.id)) {
				ID newOwner = changeOwnershipRequests.get(idx);
				Treatment__c updateTreatment = updateTreatmentsMap.get(treatment.id);
				updateTreatment.OwnerId = newOwner;
				updateTreatments.add(updateTreatment);
				updatedTreatments.add(treatment.id);
			}
		}
		update updateTreatments;
	}*/
}