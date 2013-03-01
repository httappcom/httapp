public with sharing class CareTeamUtil {
   	public static void addMembersToCareTeam( List<Care_Team_Member__c> careTeamMembers ) {
   		Set<ID> treatmentIds = new Set<ID>();
   		for (Care_Team_Member__c member : careTeamMembers) {
   			treatmentIds.add(member.Treatment__c);
   		}
   		Care_Team_Member__c[] members = [SELECT Medical_Professional__c, User__c, External_Contact__c, Treatment__c 
   			FROM Care_Team_Member__c where treatment__c in :treatmentIds];
   		Map<String, String> careTeamMemberMap = new Map<String, String>();
   		for (Care_Team_Member__c member : members) {
   			careTeamMemberMap.put( makeExternalId(member), member.id );
   		}
   		List<Care_Team_Member__c> insertMembers = new List<Care_Team_Member__c>();
   		for (Care_Team_Member__c member : careTeamMembers) {
   			if (!careTeamMemberMap.containsKey(makeExternalId(member))) {
   				insertMembers.add(member);
   				careTeamMemberMap.put( makeExternalId(member), 'NEW');
   			}
   		}
   		if (insertMembers.size()>0) {
	   		insert insertMembers;
   		}
   	}

	public static String makeExternalId( Care_Team_Member__c member ) {
		String key = member.Treatment__c + '+';
		if (member.User__c != null) {
			key += member.User__c;
		} else if (member.Medical_Professional__c != null) {
			key += member.Medical_Professional__c;
		} else if (member.External_Contact__c != null) {
			key += member.External_Contact__c;
		}
		return key;
	}
}