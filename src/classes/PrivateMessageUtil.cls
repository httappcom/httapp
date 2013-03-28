public without sharing class PrivateMessageUtil {

	public static void addSharing( Private_Message__c msg) {
		addSharing( new List<Private_Message__c>{msg});
	}
	public static void addSharing( List<Private_Message__c> msgList) {
		Map<ID, List<ID>> addSharingMap = new Map<ID, List<ID>>();
		for (Private_Message__c msg : msgList) {
			AccessUtility.addSharingToMap( addSharingMap, msg.id, msg.Recipient__c);
		}
		AccessUtility.addSharing( addSharingMap, 'Private_Message__Share' );
	}
	
}