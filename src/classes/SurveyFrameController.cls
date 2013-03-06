public with sharing class SurveyFrameController {
	public String surveyURL { get; private set; }

    public pagereference onload () {
   Logger.info('onload');
    	Map<String,String> paramMap = apexpages.currentpage().getparameters();
    	String surveyType = paramMap.get('stype');
        String entityId = paramMap.get('eid');
        String sid = paramMap.get('sid');
        String oid = paramMap.get('oid');
        String did = paramMap.get('did');
        String surveyName = paramMap.get('sname');
        String treatmentId = paramMap.get('tid');
        String surveyLink = null;
        
        if (surveyType == 'MedicalProfile') {
	        PRM_Medical_Profile_Link__c[] links = [select Survey_Link__c from PRM_Medical_Profile_Link__c where Name = :surveyName limit 1];
	        if (links.size()==1) {
    	    	surveyLink = links[0].Survey_Link__c;
        	}
        }
       
  Logger.info('surveyLink='+surveyLink);
		String[] parts = surveyLink==null?null:surveyLink.split('/');
		String surveyId = (parts==null||parts.size()<3)?null:parts[parts.size()-2];

        Decimal instanceId = 1;
        if (surveyId != null && entityId != null) {
	        Survey_Instance__c[] instances = [select Instance_Id__c from Survey_Instance__c where Survey_Id__c = :surveyId and Entity_Id__c = :entityId limit 1 for update ];
    	    if (instances.size()==0) {
        		Survey_Instance__c instance = new Survey_Instance__c( Survey_Id__c = surveyId, Entity_Id__c = entityId, Instance_Id__c = InstanceId);
        		insert instance;
	        } else {
    	    	instanceId = instances[0].Instance_Id__c+1;
        		instances[0].Instance_Id__c = instanceId;
        		update instances[0];
        	}
        } else {
        	surveyURL = null;
        }
        surveyURL = surveyLink;
        surveyURL += '&eid='+encodingUtil.urlEncode(entityId,'UTF-8');
        surveyURL += '&iid='+instanceId.intValue()+'&sid='+sid+'&oid='+oid+'&did='+did;
  Logger.info('surveyURL='+surveyURL);
      
        return null;
    }
}