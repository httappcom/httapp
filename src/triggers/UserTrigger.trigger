trigger UserTrigger on User (after insert, after update) {
	
	if ( trigger.isAfter && trigger.isInsert ){
		Map<Id,Id> contactUserMap = new Map<Id,Id>();
		for ( User u : trigger.new ){
			if ( u.ContactId != null ){
				contactUserMap.put(u.ContactId,u.Id);
			}
		}
		List<Care_Team_Member__c> ctmInserts = new List<Care_Team_Member__c>();
		for ( Patient__c p : [Select Id, Key_Contact__c, (Select Id from Treatments__r) from Patient__c where Key_Contact__c in : contactUserMap.keySet()] ){
			for ( Treatment__c t : p.Treatments__r ){
				Care_Team_Member__c ctm = new Care_Team_Member__c();
				ctm.Role__c = 'Patient';
				ctm.Treatment__c = t.Id;
				ctm.User__c = contactUserMap.get(p.Key_Contact__c);
				ctmInserts.add(ctm);
			}
		}
		if ( ctmInserts.size() > 0 ){
			insert ctmInserts;
		}
	}


	if ( trigger.isAfter && trigger.isUpdate ){
		
	}

}