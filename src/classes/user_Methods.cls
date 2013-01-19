public with sharing class user_Methods {

	static String TRAVEL_CONCIERGE = 'Travel Concierge';
	static String MEDICAL_INFORMATION_OFFICER = 'Medical Information Officer';

	static User ORG_DEFAULT_USER_TRAVEL_CONCIERGE = queryUserBy(null, TRAVEL_CONCIERGE);
	static User ORG_DEFAULT_USER_MEDICAL_INFORMATION_OFFICER = queryUserBy(null, MEDICAL_INFORMATION_OFFICER);
	 
	public static Map<String,User> populateOrgDefaultUsers(){
		Map<String,User> results = new Map<String,User>();
		for ( User u : [Select Email, Id, IsActive, Name, Username, Medical_Information_Officer__c, Travel_Concierge__c from User where IsActive = true and ( Travel_Concierge__c = true or Medical_Information_Officer__c = true )]){
			if ( u.Travel_Concierge__c ){
				results.put(TRAVEL_CONCIERGE,u);
			} else
			if ( u.Medical_Information_Officer__c ){
				results.put(MEDICAL_INFORMATION_OFFICER,u);
			}
		}
		return results;
	}
	
	public static Map<Id,User> populateUserMap(Set<Id> userIds){
		Map<id,User> results = new Map<Id,User>([
			Select Id,
				FirstName,
				LastName,
				Name,
				ProfileId,
				Profile.Name
			From User
			Where Id in :userIds
		]);
		return results;
	}

	public static User queryUserBy(Id userId, String orgDefault){
		String queryString = 'Select Email, Id, IsActive, Name, Username, Medical_Information_Officer__c, Travel_Concierge__c from User where IsActive = true ';
		if ( userId != null ){
			queryString += ' and Id = \''+ userId +'\''; 
		} else
		if ( orgDefault == TRAVEL_CONCIERGE ){
			queryString += ' and Travel_Concierge__c = true '; 
		} else
		if ( orgDefault == MEDICAL_INFORMATION_OFFICER ){
			queryString += ' and Medical_Information_Officer__c = true '; 
		}
		queryString += ' limit 1';
		List<User> results = database.query(queryString);
		if ( results.size() == 1){
			return results[0];
		}
		return null;
	}
}