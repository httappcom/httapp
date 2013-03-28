public without sharing class AccessUtility {
    public static Medical_Facility_User__c[] getMedicalFacilityUsers( ID medicalFacilityId ) {
        Medical_Facility__c medicalFacility = [select id, (select User__c, User__r.Name from Medical_Facility_Users__r order by Name) from Medical_Facility__c 
                where id = :medicalFacilityId limit 1];
        return medicalFacility.Medical_Facility_Users__r;
    }
    public static Prm_User__c[] getFacilitatorOrgUsers() {
        PRM_Config__c prmConfig = [Select id, (Select User__c, User__r.Name from Prm_Users__r order by User__r.Name) from PRM_Config__c Limit 1];
        return prmConfig.Prm_Users__r;
    }

    public static Insurance_Network_User__c[] getInsuranceNetworkUsers() {
        Insurance_Network__c insNetwork = [Select id, (select Insurance_Contact__c, Insurance_Contact__r.Name from Insurance_Network_Users__r order by Name) from Insurance_Network__c Limit 1];
        return insNetwork.Insurance_Network_Users__r;
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
    public static void updateSharing( String className, List<SObject> currentSharing, Map<ID, UsersAndGroups> requiredSharing ) {

        Map<ID, List<ID>> addSharingMap = new Map<ID, List<ID>>();
        Map<ID, Set<ID>> curSharingMap = getSharingMembership( currentSharing );
        for (ID parentId : requiredSharing.keySet()) {
            UsersAndGroups lists = requiredSharing.get(parentId);
            Set<ID> curSharingSet = curSharingMap.get(parentId);
            List<ID> fullList = new List<ID>();
            fullList.addAll(lists.users);
            fullList.addAll(lists.groups);
            for (ID id : fullList) {
                if (curSharingSet == null || !curSharingSet.contains(id)) {
                    List<ID> userList = addSharingMap.get(parentId);
                    if (userList==null) {
                        userList = new List<ID>();
                        addSharingMap.put(parentId, userList);
                    }
                    userList.add(id);
                }
            }
        }
        addSharing( addSharingMap, className );
    }
    
    public static void addSharing( Map<ID, List<ID>>addSharingMap, String className ) {
system.debug('addSharing');
        List<SObject> shareList = new List<SObject>();
        Set<ID> userIds = new Set<ID>();
        for (ID parentId : addSharingMap.keySet()) {
            userIds.addAll(addSharingMap.get(parentId));
        }
        User[] users = [select UserType from User where id in :userIds];
        Set<ID> validUserIds = new Set<ID>();
        for (User u : users) {
            if (u.UserType == 'Standard') validUserIds.add(u.id);
        }
system.debug('validUserIds='+validUserIds);
        for (ID parentId : addSharingMap.keySet()) {
system.debug('parentId='+parentId+', list='+addSharingMap.get(parentId));
            for (ID id : addSharingMap.get(parentId)) {
                if (validUserIds.contains(id)) {
                    if (className == 'Treatment__Share') {
                        Treatment__Share st = new Treatment__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=Schema.Treatment__Share.RowCause.Care_Team__c);
                        shareList.add(st);
                    } else if (className == 'Travel__Share') {
                        Travel__Share st = new Travel__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=Schema.Travel__Share.RowCause.Care_Team__c);
/*                  } else if (className == 'Care_Team_Member__Share'){
                        Care_Team_Member__Share st = new Care_Team_Member__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=Schema.Care_Team_Member__Share.RowCause.Care_Team__c);
                        shareList.add(st);*/
                    } else if (className == 'Private_Message__Share') {
                        Private_Message__Share st = new Private_Message__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='read',RowCause=Schema.Private_Message__Share.RowCause.Private_Message__c);
                        shareList.add(st);
                    } else if (className == 'Medical_Facility__Share') {
                        Medical_Facility__Share st = new Medical_Facility__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=Schema.Medical_Facility__Share.RowCause.Care_Team__c);
                        shareList.add(st);
                    } else if (className == 'Patient__Share'){
                        Patient__Share st = new Patient__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=Schema.Patient__Share.RowCause.Care_Team__c);
                        shareList.add(st);
                    } else if (className == 'Survey_Header__Share'){
                        Survey_Header__Share st = new Survey_Header__Share(parentId=parentId, UserOrGroupId=id,AccessLevel='edit',RowCause=Schema.Survey_Header__Share.RowCause.Care_Team__c);
                        shareList.add(st);
                    } else {
                        throw new NueException('Unknown share class '+className);
                    }
                }
            }
        }
    system.debug('shareList='+shareList);
        if (shareList.size()>0) {
            insert shareList;
        }
    }
    
    public class UsersAndGroups {
        public List<ID> users = new List<ID>();
        public List<ID> groups = new List<ID>();
    }
    public static Map<ID, UsersAndGroups> getCareTeamUsersOrGroups( Treatment__c[] treatments ) {
system.debug('getCareTeamUsersOrGroups treatments='+treatments);
        Group[] groups = [select id, Name from Group where Type='Regular'];
        Map<String, Id> groupMap = new Map<String, Id>();
        for (Group grp : groups) {
            groupMap.put(grp.Name, grp.id);
        }
        Map<ID, UsersAndGroups> retMap = new Map<ID, UsersAndGroups>();
        Map<String, Set<ID>> groupMembershipMap = new Map<String, Set<ID>>();
        PRM_Config__c prmConfig = [SELECT Id, (SELECT User__c FROM PRM_Users__r) FROM PRM_Config__c limit 1];
        for (PRM_User__c user : prmConfig.PRM_Users__r) {
            Set<ID> userSet = groupMembershipMap.get(prmConfig.id);
            if (userSet==null) {
                userSet = new Set<ID>();
                groupMembershipMap.put(prmConfig.id, userSet);
            }
system.debug('Adding to groupMembership user='+user.User__c);
            userSet.add(user.User__c);
        }
        Set<ID> medFacIds = new Set<ID>();
        for (Treatment__c treatment : treatments) {
            if (treatment.Destination_Facility__c != null) {
                medFacIds.add(treatment.Destination_Facility__c);
            }
        }
 system.debug('medical Facility Ids='+medFacIds);
        List<Medical_Facility__c> medicalFacilities = [SELECT Id, Name, (SELECT User__c FROM Medical_Facility_Users__r) FROM Medical_Facility__c where id in :medFacIds];
        for (Medical_Facility__c medicalFacility : medicalFacilities) {
            for (Medical_Facility_User__c user: medicalFacility.Medical_Facility_Users__r) {
                Set<ID> userSet = groupMembershipMap.get(medicalFacility.id);
                if (userSet==null) {
                    userSet = new Set<ID>();
                    groupMembershipMap.put(medicalFacility.id, userSet);
                }
                userSet.add(user.User__c);
            }
        }
        for (Treatment__c treatment : treatments) {
system.debug('doing treatment '+treatment);
            UsersAndGroups lists = retMap.get(treatment.id);
            if (lists == null) {
                lists = new UsersAndGroups();
                retMap.put(treatment.id, lists);
            }
            String curGroup = null;
            Set<ID> curGroupUsers = null;
            if (treatment.Destination_Facility__c != null) {
                curGroupUsers = groupMembershipMap.get(treatment.Destination_Facility__c);
                curGroup = treatment.Destination_Facility__r.Name;
            } else {
                curGroupUsers = groupMembershipMap.get(prmConfig.id);
                curGroup = 'Facilitator PCCs';
            }
system.debug('curGroupUsers='+curGroupUsers);
system.debug('curGroup='+curGroup);
system.debug('Care Team members='+treatment.Care_Team_Members__r);
            if (curGroupUsers != null) {
                for (Care_Team_Member__c member : treatment.Care_Team_Members__r) {
                    if (member.User__r.UserType == 'Standard') {
                        if (curGroupUsers.contains(member.User__c)) {
                            lists.groups.add(groupMap.get(curGroup));
                        } else {
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

	public static void addSharingToMap( Map<ID, List<ID>> addSharingMap, ID parentId, ID id) {
		List<ID> userList = addSharingMap.get(parentId);
		if (userList==null) {
			userList = new List<ID>();
			addSharingMap.put(parentId, userList);
		}
		userList.add(id);
	}

}