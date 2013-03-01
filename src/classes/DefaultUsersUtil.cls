public with sharing class DefaultUsersUtil {
    public static String travelConcierge = 'Travel Concierge';
    public static String medicalInformationOfficer = 'Medical Information Officer';

	private static Map<String, User> defaultUsersMap = null;
	private static void init() {
		defaultUsersMap = new Map<String, User>();
        for ( User u : [Select Email, Id, IsActive, Name, Username, Medical_Information_Officer__c, Travel_Concierge__c from User where IsActive = true and ( Travel_Concierge__c = true or Medical_Information_Officer__c = true )]){
            if ( u.Travel_Concierge__c ){
                defaultUsersMap.put(travelConcierge,u);
            } else
            if ( u.Medical_Information_Officer__c ){
                defaultUsersMap.put(medicalInformationOfficer,u);
            }
        }
    }
    private static User getDefaultUser( String key ) {
    	if (defaultUsersMap==null) init();
    	return defaultUsersMap.get(key);
    }
    public static User getMedicalInformationOfficer() {
    	return getDefaultUser(medicalInformationOfficer);
    }
    public static User getTravelConcierge() {
    	return getDefaultUser(travelConcierge);
    }
}