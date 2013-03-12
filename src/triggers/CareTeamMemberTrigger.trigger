trigger CareTeamMemberTrigger on Care_Team_Member__c (before insert, before update, after insert, after update) {

	if ( trigger.isBefore && (trigger.isInsert || trigger.isUpdate) ){
		for ( Care_Team_Member__c c : trigger.new ) {
			c.External_Id__c = c.FormulaExternalId__c;
system.debug('External Id = '+c.FormulaExternalId__c);
			c.Name = c.FormulaName__c;
		}
	}
	if ( trigger.isAfter && (trigger.isInsert || trigger.isUpdate) ){
		CareTeamUtil.updateSharing( Trigger.new );
	}
}