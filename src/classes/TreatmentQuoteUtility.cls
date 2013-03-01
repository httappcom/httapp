public with sharing class TreatmentQuoteUtility {

/* Get Treatment__c, Procedure__r.Doctor__r.Key_Contact__c from quote
key_contact__c = :user.contactid
*/
    public static void afterInsert (List<Treatment_Quote__c> treatmentQuotes){
		addDoctorsToCareTeamIfNeeded( treatmentQuotes );
    }

    public static void afterUpdate (List<Treatment_Quote__c> newQuotes){
		addDoctorsToCareTeamIfNeeded( newQuotes );
    }

	private static void addDoctorsToCareTeamIfNeeded(List<Treatment_Quote__c> treatmentQuotes) {
		loadQuoteRelatedData( treatmentQuotes );
	}
	private static Map<ID, ID> contactToDoctorMap = null;
	private static void loadContactToDoctorMap(Set<ID> contacts) {
system.debug('contacts='+contacts);
		User[] doctors = [select id, ContactId from User where ContactId in :contacts];
system.debug('doctors='+doctors);
		contactToDoctorMap = new Map<ID, ID>();
		for (User doctor : doctors) {
			contactToDoctorMap.put(doctor.ContactId, doctor.id);
		}
	}
	private static void loadQuoteRelatedData( List<Treatment_Quote__c> treatmentQuotes ) {
		Set<ID> treatmentQuoteIds = new Set<ID>();
    	for (Treatment_Quote__c quote : treatmentQuotes) {
    		treatmentQuoteIds.add(quote.id);
    	}
		Map<ID, Treatment_Quote__c> quoteMap = new Map<ID, Treatment_Quote__c>([select 
			Treatment__c, 
			Procedure__r.Doctor__r.Key_Contact__c 
			from Treatment_Quote__c 
			where id in :treatmentQuoteIds]);
		Set<ID> contactIds = new Set<ID>();
		for (Treatment_Quote__c quote : quoteMap.values()) {
			if (quote.Procedure__c != null && quote.Procedure__r.Doctor__c != null && quote.Procedure__r.Doctor__r.Key_Contact__c != null) {
				contactIds.add(quote.Procedure__r.Doctor__r.Key_Contact__c);
			}
		}
		loadContactToDoctorMap(contactIds);
		List<Care_Team_Member__c> insertMembers = new List<Care_Team_Member__c>();
    	for (Treatment_Quote__c quote : treatmentQuotes) {
    		ID treatmentId = quote.Treatment__c;
   			Treatment_Quote__c expandedQuote = quoteMap.get(quote.id);
   system.debug('Looking for contact '+expandedQuote.Procedure__r.Doctor__r.Key_Contact__c);
    		ID doctorId = contactToDoctorMap.get(expandedQuote.Procedure__r.Doctor__r.Key_Contact__c);
    		if (doctorId != null) {
    			insertMembers.add(new Care_Team_Member__c(Treatment__c = treatmentId, User__c = doctorId, Role__c = 'Doctor'));
    		}
    	}
    	CareTeamUtil.addMembersToCareTeam(insertMembers);
	}
	
}