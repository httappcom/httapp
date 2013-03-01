public with sharing class MessagingUtil {
	private static Map<String, Care_Team_Member__c> userToCareTeamMemberMap = null;
	public static void loadCareTeamMemberMap( ID[] treatmentIds ) {
		Care_Team_Member__c[] members = [SELECT id, Treatment__c, User__c FROM Care_Team_Member__c 
			where Treatment__c in :treatmentIds];
		userToCareTeamMemberMap = new Map<String, Care_Team_Member__c>();
		for (Care_Team_Member__c member : members) {
			userToCareTeamMemberMap.put(member.Treatment__c+'+'+member.User__c, member);
		}
	}
	public static Communication__c createPrivateMessage( ID treatmentId, Id fromUser, Id toUser, String message ) {
		Care_Team_Member__c fromMember = userToCareTeamMemberMap.get(treatmentId+'+'+fromUser);
		Care_Team_Member__c toMember = userToCareTeamMemberMap.get(treatmentId+'+'+toUser);
		if (fromMember==null || toMember==null) return null;
		return new Communication__c( 
			Treatment__c = treatmentId,
			From_User__c = fromMember.id,
			Care_Team_Member__c = toMember.id,
			Body__c = message
			);
	}
}