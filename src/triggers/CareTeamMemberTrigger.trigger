trigger CareTeamMemberTrigger on Care_Team_Member__c (before insert, before update) {

	if (trigger.isBefore && trigger.isInsert){
		Set<Id> userIds = new Set<Id>();
		for ( Care_Team_Member__c c : trigger.new ){
			userIds.add(c.User__c);
		}
		Map<Id,User> userMap = new Map<Id,User>([Select Id, Name from User where Id in :userIds]);
		for ( Care_Team_Member__c c : trigger.new ){
			c.Name = userMap.get(c.User__c).Name;
		}
	}

}