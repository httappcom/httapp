public with sharing class DefaultUsersUtil {
    public static String travelConcierge = 'Travel_Concierge__c';
    public static String medicalInformationOfficer = 'Medical_Information_Officer__c';

	private static Map<String, User> defaultUsersMap = null;
	private static void init() {
		defaultUsersMap = new Map<String, User>();
		TaskSpecifierUtility.loadMetaData();
		String qry = 'select Email, Id, IsActive, Name, Username ';
		for (String fld : TaskSpecifierUtility.defaultUserIndicatorFields) {
			qry += ','+fld;
		}
		qry += ' from User where IsActive=true and (';
		String delim = '';
		for (String fld : TaskSpecifierUtility.defaultUserIndicatorFields) {
			qry += delim + fld + '=true';
			delim = ' or ';
		}
		qry += ')';
		User[] defaultUsers = Database.query(qry);
        for ( User u : defaultUsers){
			for (String fld : TaskSpecifierUtility.defaultUserIndicatorFields) {
    	        if ( ((Boolean)u.get(fld)) ){
                	defaultUsersMap.put(fld,u);
    	        }
            }
        }
    }
    public static User getDefaultUser( String key ) {
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