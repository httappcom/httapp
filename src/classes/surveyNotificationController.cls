public without sharing class surveyNotificationController {
	public String responseId { get; private set; }

    public pagereference onload () {

        String patientId = apexpages.currentpage().getparameters().get('pid');
        String surveyId = apexpages.currentpage().getparameters().get('sid');
        
/*        Notification__c notification = new Notification__c( Source__c='Survey Gizmo', Category_Id__c=surveyId+':'+patientId, Instance_Id__c=responseId);
        Notification__c[] recs = [select id from Notification__c where Source__c = 'Survey Gizmo' and Category_Id__c = :notification.Category_Id__c and Instance_Id__c = :responseId];
        if (recs.size()==0) {
            insert notification;
        }*/

        return null;
    }
}