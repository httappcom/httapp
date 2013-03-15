public without sharing class surveyGizmoUtil {

    private static final string username = 'nema@healthtraveltechnologies.com';
    private static final string password = 'nuehealth123';
    
    //For encryption, DO NOT MODIFY////
    private static final string AESKEY  = 'gPQEiFm4E4hCmHsRn3XZWQSR2NGfCHihKkMlgGQMwWA=';
    private static final string INITV   = 'Ym/RaHLLU6n8173xYC8e8w==';
    ///////////////////////////////////

    public class surveyClass {
        public list<questionClass> data;
        public string total_Count;
        public String entityId;
        public String instanceId;
        public Map<String,questionClass> getMap() {
        	Map<String,questionClass> mp = new Map<String,questionClass>();
        	for (questionClass q : data) {
        		mp.put( q.id, q);
        	}
        	return mp;
        }
    }
    
    public class surveyPagesClass {
        public list<SurveyPage> data;
        public string total_count;
    }
    
    public class SurveyPage {
    	public String id;
    	public String type;
    	public titleClass title;
    	public List<SurveyPageQuestion> questions;
    	public List<SurveyPageQuestion> getNonDecorativeQuestions() {
    		List<SurveyPageQuestion> retList = new List<SurveyPageQuestion>();
    		for (SurveyPageQuestion q : questions) {
	    		if (q.Type == 'SurveyQuestion') {
	    			retList.add(q);
	    		}
    		}
    		return retList;
    	}
    }

	public class SurveyPageQuestion {
		public String id;
		public String type;
		public titleClass title;
		public String subType;
		public List<String> sub_question_skus;
	}

    
    public class questionClass {
        public string id;
        public string type;
        public string subtype;
        public titleClass title;
		public List<String> sub_question_skus;
        public propertyClass properties;
        public list<optionClass> options;
    }
    
    public class propertyClass {
        public string break_after;
    }
    
    public class titleClass {
        public string English;
        // other languages
    }
    
    public class optionClass {
        public string id;
        public string type;
        public titleClass title;
        public string value;
    }
     
    public static void retrieveMedicalProfile (String surveyId, string patientId) {
    	retrieveMedicalProfile ( surveyId, patientId, null );
    }
    public static void retrieveMedicalProfile (String surveyId, string patientId, Decimal instance) {
 Logger.info('retrieveMedicalProfile pId='+patientId+', surveyId='+surveyId);
        surveyGizmoUtil.retrieveSurvey(surveyId, patientId, 'Patient', instance);
    }
    
    public static void test() {
//        thisPatientId = 'a08d000000LPOls';
        retrieveSurvey('?', 'a08d000000LPOls', 'Patient', null);
    }
    
    public static void retrieveSurvey(String surveyId, String patientId, string surveyType, Decimal latestInstance) {
    
    	String entityId = encryptPatientId(patientId);
    	if (latestInstance == null) {
    		latestInstance = getLatestInstanceId(surveyId, entityId);
    	}
    	String instanceId = latestInstance == null ? '' : String.valueOf(latestInstance.intValue());
 system.debug('instanceId='+instanceId);
        Survey_Header__c survey = new Survey_Header__c();
        if (surveyType == 'Treatment') {
            survey.treatment__c = null;
        } else {
            survey.Patient__c = patientId;
        }
        survey.Instance__c = latestInstance;
  Logger.info('Instance='+latestInstance);
//        survey.put('name', title);
        survey.put('response_id__c', surveyid + ' - ' + entityId );
        survey.put('survey_id__c', surveyid );

        HttpRequest req = new httprequest();
        String endPoint = 'https://restapi.surveygizmo.com/v3/survey/'+surveyID+'/surveypage?user:pass='+username+':'+password;
system.debug('endPoint='+endPoint);
        req.setEndPoint(endPoint);
        req.setmethod('GET');
        Http ht = new http();
        String response = '';
        if (!test.isrunningTest()) {        
            httpresponse res = ht.send(req);
            response = res.getbody();
        }
        surveyPagesClass pagesStruct = parseSurveyPages( response );
        surveyClass surveyStruct = getSurveyStructure( surveyId );
        String surveyPagesJSON = JSON.serialize(pagesStruct);
        survey.put('Survey_Pages_JSON__c', surveyPagesJSON);
            
        req = new httprequest();
  Logger.info('entity question id='+surveyStruct.entityId);
  Logger.info('instance question id='+surveyStruct.instanceId);
        endPoint =  'https://restapi.surveygizmo.com/v3/survey/'+surveyID+'/surveyresponse'+
                        '?filter[field][0]=status&filter[operator][0]==&filter[value][0]=Complete'+
                        '&filter[field][1]=[question('+surveyStruct.entityId+')]&filter[operator][1]==&filter[value][1]='+entityId+
                        '&filter[field][2]=[question('+surveyStruct.instanceId+')]&filter[operator][2]==&filter[value][2]='+instanceId+
                        '&user:pass='+username+':'+password;
  Logger.info('endpoint='+endpoint);
        req.setEndPoint(endPoint);
        req.setmethod('GET');
        ht = new http();
        response = '';
        if (test.isrunningTest() == false) {        
            httpresponse res = ht.send(req);
            response = res.getbody();
        }
       
        List<Survey_Question__c> responses = parseResponses(response, surveyType);
        if (responses == null || responses.size()==0) {
        	throw new NueException('Not Found');
        	return;
        }
  Logger.info('Survey Responses='+responses);
       ID headerId = null;
        Database.UpsertResult result = database.upsert(survey, Survey_Header__c.Fields.Response_Id__c,true);
        headerId = result.getId();
        List<Survey_Question__c> delRecs = [select id from Survey_Question__c where header__c = :headerId];
        delete delRecs;
 Logger.info('response='+response+', headerId='+headerId);
  Logger.info('responses='+responses.size()+', '+responses);
  		for (Survey_Question__c resp : responses) {
  			resp.Header__c = headerId;
  		}
        insert responses;
  Logger.info('Inserted responses');
    }
    
 	public static string encryptPatientId (string patientId) {
  		return patientId;
/*        Blob b = crypto.encrypt('AES256', encodingUtil.base64Decode(AESKEY), encodingUtil.base64Decode(INITV), encodingUtil.base64Decode(patientId.trim()));
        String s = encodingUtil.base64Encode(b);
        String f = encodingUtil.urlEncode(s,'UTF-8');
        return f;*/
    }
    
    public static string decryptPatientId (string encodedID) {
    	return encodedID;
/*        blob b = crypto.decrypt('AES256', encodingUtil.base64Decode(AESKEY), encodingUtil.base64Decode(INITV),encodingUtil.base64Decode(encodingutil.urldecode(encodedID,'UTF-8')));
        string patientID = EncodingUtil.base64Encode(b);
        return patientID.substring(0,15);*/
    }
    
    public static surveyClass parseSurvey(string input) {
        input = input.replace('_type','type');
        input = input.replace('_subtype','subtype');
        input = input.replace('\\/','/');
        input = input.replace('\\"','');
        JSONParser parser = JSON.createParser(input);
        parser.nexttoken();
        
        surveyClass s = (surveyClass)parser.readValueAs(surveyClass.class);
        for (questionClass q : s.data) {
        	if (q.type == 'SurveyAction' && q.subType == 'hidden') {
        		if (q.title.English == 'EntityId') {
        			s.entityId = q.id;
        		} else if (q.title.English == 'ResponseId') {
        			s.instanceId = q.id;
        		}
        	}
        }
        return s;
    }
    
    public static surveyPagesClass parseSurveyPages(string input) {
        input = input.replace('_type','type');
        input = input.replace('_subtype','subtype');
        input = input.replace('\\/','/');
        input = input.replace('\\"','');
        JSONParser parser = JSON.createParser(input);
        parser.nexttoken();
        
        surveyPagesClass s = (surveyPagesClass)parser.readValueAs(surveyPagesClass.class);
        return s;
    }
    
    public static list<Survey_Question__c> parseResponses(string input, String surveyType){
        list<Survey_Question__c> responses = new list<Survey_Question__c>();
        input = input.replace('_type','type');
        input = input.replace('_subtype','subtype');
        input = input.replace('\\/','/');
        input = input.replace('\\"','');
//      Logger.info(input);
        JSONParser parser = JSON.createParser(input);
        Integer order = 0;
        
       	Pattern qPattern = pattern.compile('\\[question\\((\\d+)\\)(, option\\((\\d+)\\))?(, question_pipe\\(([^\\)]+)\\))?\\]');  //option\\((\\d+\\)
        while (parser.nextToken() != null){
            parser.nextToken();
            string key ='';
            if (parser.getCurrentName()!= null && parser.getCurrentName().contains('question(')){
            	String curName = parser.getCurrentName();
				Matcher qMatcher = qPattern.matcher(curName);
				if (qMatcher.groupCount()==5 && qMatcher.matches()) {
					String questionId = qMatcher.group(1);
					String optionId = qMatcher.group(3);
					String rowLabel = qMatcher.group(5);
					String answer = parser.getText();
					if (answer != null && answer.length()> 32768) {
						answer = answer.substring(0,32768);
					}
					if (answer.length()==0) answer = null;
                    Survey_Question__c response = new Survey_Question__c();
					String responseId = questionId;
					if (optionId != null) {
						responseId += ':'+optionId;
					}
					response.Response_Id__c = responseId;
					if (answer != null) {
						response.Answer__c = answer;
					}
					response.Order__c = order++;
					if (rowLabel != null) {
						response.Row_Label__c = rowLabel;
					}
					responses.add(response);
				}
            }
        }
        return responses;
    } 
    
    public static String getSurveyId(String title) {
        HttpRequest req = new HttpRequest();
        string endPoint = 'https://restapi.surveygizmo.com/v3/survey?user:pass='+username+':'+password;
        endPoint += '&filter[field][0]=title&filter[operator][0]==&filter[value][0]='+EncodingUtil.urlEncode(title, 'UTF-8');
        req.setEndPoint(endPoint);
        req.setmethod('GET');
        Http ht = new Http();
        string response = '';
        if (test.isrunningTest() == false) {        
            httpresponse res = ht.send(req);
            response = res.getbody();
        }
        JSONParser surveyIdParser = JSON.createParser(response);
        //parse for survey id
        String surveyId = '';
        while (surveyIDParser.nextToken() != null){
            surveyIDParser.nextToken();
            if (surveyIDParser.getCurrentToken() == jsontoken.START_OBJECT) {
                surveyIDParser.nextToken();
                if (surveyIDParser.getText() == 'id') {
                    surveyIDParser.nextToken();
                    surveyId = surveyIDParser.getText();
                    break;  
                }
            }
        }       
        
        if (surveyId.trim().length() <= 0) {
        	throw new NueException('No valid survey Id found.');
        }
        return surveyId;
	}
	private static Map<String, surveyClass> surveyStructureMap = null;
    public static surveyClass getSurveyStructure( String surveyId ) {
    	if (surveyStructureMap==null) surveyStructureMap = new Map<String, surveyClass>();
    	SurveyClass surveyStruct = surveyStructureMap.get(surveyId);
    	if (surveyStruct !=null) return surveyStruct; 
        HttpRequest req = new httprequest();
        String endPoint = 'https://restapi.surveygizmo.com/v3/survey/'+surveyId+'/surveyquestion?user:pass='+username+':'+password;
        req.setEndPoint(endPoint);
        req.setMethod('GET');
        Http ht = new http();
        String response = '';
        if (test.isrunningTest() == false) {        
            httpresponse res = ht.send(req);
            response = res.getbody();
        }
        surveyStruct = parseSurvey(response);
        surveyStructureMap.put(surveyId, surveyStruct);
        return surveyStruct;
    }

/*    	String surveyType = paramMap.get('stype');
        X String entityId = paramMap.get('eid');
        X String sid = paramMap.get('sid');
        X String oid = paramMap.get('oid');
        X String did = paramMap.get('did');
        String surveyName = paramMap.get('sname');
*/
    public static string generateMedicalProfileLink(string PatientId) {
    	Patient__c patient = [select Medical_Profile_Type__r.Name from Patient__c where id = :patientId];
    	if (patient.Medical_Profile_Type__c == null) return '';
        String surveyName = patient.Medical_Profile_Type__r.Name;
  Logger.info('surveyName='+surveyName);
        string oid = userinfo.getOrganizationId();
        string did = '';
        Treatment__c[] treatments = [Select Destination_Facility__c from Treatment__c 
                                     Where Patient__c = :patientId Order by CreatedDate DESC];
        if (treatments.size() > 0)
        {
        	if (treatments[0].Destination_Facility__c != null)
        	{
        		Medical_Facility__c[] mfs = [Select Survey_Banner_Image__c from Medical_Facility__c 
        		                              Where Id = :treatments[0].Destination_Facility__c];
        		if (mfs.size() > 0)
        		{
        			if (mfs[0].Survey_Banner_Image__c != null) {did = mfs[0].Survey_Banner_Image__c;}
        		} 
        	}
        }
        if (did == '')
        {
          PRM_Config__c prm = [select id, Survey_Banner_Image__c from PRM_Config__c limit 1];
          did = prm.Survey_Banner_Image__c;
        }
        string serverinstance = System.URL.getSalesforceBaseUrl().getHost().substringbefore('-');
        
        
	  	List<Site> patientPortal = [Select MasterLabel, Subdomain From Site Where MasterLabel = 'Patient Portal' ];
    	String patientPortalSubdomain = patientPortal.size()>0?patientPortal[0].Subdomain:'';  	
        string linkurl = 'http://'+EmailController.getPatientPortalDomain()+'/SurveyFrame';
        
        linkurl += '?eid='+patientId;
        linkurl += '&sid='+serverinstance;
        linkurl += '&oid='+oid;
        linkurl += '&did='+did;
        linkurl += '&stype=MedicalProfile';
        linkurl += '&sname='+EncodingUtil.urlEncode(surveyName, 'UTF-8');
        return linkurl;
    }
    public static string generateSatisfactionSurveyLink(string treatmentId) {
    	Treatment__c[] treatments = [Select Destination_Facility__c, Patient__c from Treatment__c 
    	                             Where Id = : treatmentId];
      if (treatments.size() == 1)
      {
        string patientIDHash = encryptPatientId(treatments[0].Patient__c);
        string oid = userinfo.getOrganizationId();
        string did = '';
        string linkurl = '';
        if (treatments[0].Destination_Facility__c != null)
	      {
	      	Logger.info('Destination Facility: ' + treatments[0].Destination_Facility__c);
	        Medical_Facility__c[] mfs = [Select Survey_Banner_Image__c, Satisfaction_Survey_Link__c from Medical_Facility__c 
	                                      Where Id = :treatments[0].Destination_Facility__c];
	        if (mfs.size() == 1)
	        {
	          if (mfs[0].Survey_Banner_Image__c != null) {did = mfs[0].Survey_Banner_Image__c;}
	          if (mfs[0].Satisfaction_Survey_Link__c != null) {linkurl = mfs[0].Satisfaction_Survey_Link__c;}
	        } 
	      }
        if ((did == '') || (linkurl == ''))
        {
          PRM_Config__c prm = [select Survey_Banner_Image__c, Satisfaction_Survey_Link__c  from PRM_Config__c limit 1];
          if (did == '')
	        {
	          did = prm.Survey_Banner_Image__c;
	        }
	        if (linkurl == '')
	        {
	          linkurl = prm.Satisfaction_Survey_Link__c;
	        }  
        }      
        linkurl += '?eid='+patientIDHash;
        string serverinstance = System.URL.getSalesforceBaseUrl().getHost().substringbefore('-');
        linkurl += '&sid='+serverinstance;
        linkurl += '&oid='+oid;
        linkurl += '&did='+did;
        return linkurl;   
      }
      else { return ''; }    	                             
   }
	public static Decimal getLatestInstanceId(String surveyId, String entityId) {
Logger.info('surveyId='+surveyId+', entityId='+entityId);
		AggregateResult[] results = [select max(Instance_Id__c) latestInstance from Survey_Instance__c where Survey_Id__c = :surveyId and Entity_Id__c = :entityId];
Logger.info('results='+results);
		if (results.size()>0) {
			return (Decimal)results[0].get('latestInstance');
		}
    	return null;
	}

}