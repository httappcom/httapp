public with sharing class surveyGizmoAPI_Methods {

	private static final string username = 'nema@healthtraveltechnologies.com';
	private static final string password = 'nuehealth123';
	
	//For encryption, DO NOT MODIFY////
	private static final string AESKEY 	= 'gPQEiFm4E4hCmHsRn3XZWQSR2NGfCHihKkMlgGQMwWA=';
	private static final string INITV	= 'Ym/RaHLLU6n8173xYC8e8w==';
	///////////////////////////////////

	public static Satisfaction_Survey__c survey {get;set;}
	public static list<Satisfaction_Survey_Question__c> sfQA {get;set;} 
	
	public static Medical_Profile_Header__c profile {get;set;}
	public static list<Medical_Profile_Question__c> sfpQA {get;set;}

	public static string thisPatientID {get;set;}

	public class surveyClass {
		public list<questionClass> data;
		public string total_Count;
	}
	
	public class questionClass {
		public string id;
		public string type;
		public string subtype;
		public titleClass title;
		public propertyClass properties;
		public list<optionClass> options;
		public Satisfaction_Survey_Question__c sfQuestion;
		public Medical_Profile_Question__c sfpQuestion;
	}
	
	public class propertyClass {
		public string hidden;
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
	 
	public static void retrieveMedicalProfile (string patientId) {
		Patient__c p = [select id, Medical_Profile_Type__c from Patient__c where id = :patientId];
		thisPatientId = p.id;
		retrieveSurvey(p.Medical_Profile_Type__c, 'Patient');
	}
	
	public static void retrieveSatisfactionSurvey (string treatmentId) {
		retrieveSurvey('some title','Treatment');
	}
	 
	public static void retrieveSurvey(string title, string patientOrTreatment) {
		
		/*for testing 
		 * Medical Travel Readiness Assessment - survey title
		 * 1112561 - survey id
		 */
		
		httprequest req = new httprequest();
		string endPoint = 'https://restapi.surveygizmo.com/v3/survey?user:pass='+username+':'+password; 
		endPoint += '&filter[field][0]=title&filter[operator][0]==&filter[value][0]='+EncodingUtil.urlEncode(title, 'UTF-8');
		req.setEndPoint(endPoint);
		req.setmethod('GET');
		http ht = new http();
		string response = '';
		if (test.isrunningTest() == false) {		
			httpresponse res = ht.send(req);
			response = res.getbody();
		}
		system.debug('Survey: '+response);
		JSONParser surveyIdParser = JSON.createParser(response);
		//parse for survey id
		string surveyID = '';
		while (surveyIDParser.nextToken() != null){
			surveyIDParser.nextToken();
			system.debug('parser current token: '+surveyIdParser.getcurrenttoken());
			if (surveyIDParser.getCurrentToken() == jsontoken.START_OBJECT) {
				surveyIDParser.nextToken();
				system.debug(surveyIDParser.getText());
				if (surveyIDParser.getText() == 'id') {
					surveyIDParser.nextToken();
					surveyID = surveyIDParser.getText();
					system.debug('Parsed survey id: '+surveyID);
					break;	
				}
			}
		}		
		
		if (surveyID.trim().length() > 0) {
			if (patientOrTreatment == 'Treatment') {
				survey = new Satisfaction_Survey__c();
				survey.name = title;
				survey.survey_id__c = surveyid+' - '+encryptPatientId(thispatientid);
				survey.Treatment__c = 'a0Fd000000DudSP'; /*TEMPORARY REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				 REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				  REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				   REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				    REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				     REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				      REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				       REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE REPLACE
				       */
			}
			else if (patientOrTreatment == 'Patient') {
				profile = new Medical_Profile_Header__c();
				profile.name = title;
				profile.profile_id__c = surveyid+' - '+encryptPatientId(thispatientid);
				profile.Patient__c = thisPatientID;
			}
			
			req = new httprequest();
			endPoint = 'https://restapi.surveygizmo.com/v3/survey/'+surveyID+'/surveyquestion?user:pass='+username+':'+password; 
			req.setEndPoint(endPoint);
			req.setmethod('GET');
			ht = new http();
			response = '';
			if (test.isrunningTest() == false) {		
				httpresponse res = ht.send(req);
				response = res.getbody();
			}
			system.debug('Survey Question: '+response);
			
			surveyClass surveyStructure = parseSurvey(response);
					
			req = new httprequest();
			endPoint = 	'https://restapi.surveygizmo.com/v3/survey/'+surveyID+'/surveyresponse'+
						'?filter[field][0]=status&filter[operator][0]==&filter[value][0]=Complete'+
						'&filter[field][1]=[question(45)]&filter[operator][1]==&filter[value][1]='+encryptPatientId(thisPatientID)+
						'&user:pass='+username+':'+password;
			req.setEndPoint(endPoint);
			req.setmethod('GET');
			ht = new http();
			response = '';
			if (test.isrunningTest() == false) {		
				httpresponse res = ht.send(req);
				response = res.getbody();
			}
			system.debug('Survey Response: '+response);
			
			map<string, list<string>> responsemap = parseResponses(response);
			
			if (patientOrTreatment == 'Treatment') {
				database.upsert(Survey,Satisfaction_Survey__c.Fields.Survey_ID__c,true);	
			}
			else if (patientOrTreatment == 'Patient') {
				database.upsert(profile,Medical_Profile_Header__c.Fields.Profile_ID__c,true);
			}
			// construct SF Questions from structure
			sfQA = new list<Satisfaction_Survey_Question__c>();
			sfpQA = new list<Medical_Profile_Question__c>();
			
			for (questionClass qc : surveyStructure.data){
				if (patientOrTreatment == 'Treatment') {
					qc.sfQuestion = new Satisfaction_Survey_Question__c(Satisfaction_Survey__c = survey.id, name=(qc.title.english.length() > 80)?qc.title.english.substring(0,79):qc.title.english,Full_Question_Text__c =qc.title.english, order__c=integer.valueof(qc.id), Survey_Order_Patient_EXT_ID__c = surveyid+' - '+qc.id+' - '+encryptPatientId(thispatientid));	
				}
				else if (patientOrTreatment == 'Patient') {
					qc.sfpQuestion = new Medical_Profile_Question__c(Medical_Profile_Header__c = profile.id, name=(qc.title.english.length() > 80)?qc.title.english.substring(0,79):qc.title.english,Full_Question_Text__c =qc.title.english, order__c=integer.valueof(qc.id), Survey_Order_Patient_EXT_ID__c = surveyid+' - '+qc.id+' - '+encryptPatientId(thispatientid));
				}
				
				if (responseMap.containsKey(qc.id)) {
					for(string s : responseMap.get(qc.id)){
						system.debug('Answering question #'+qc.sfquestion.order__c+': '+s);
						if (patientOrTreatment == 'Treatment') {
							qc.sfquestion.answer__c = (qc.sfquestion.answer__c == null || qc.sfquestion.answer__c.trim().length() ==0)?s:qc.sfquestion.answer__c+', '+s;
						}
						else if (patientOrTreatment == 'Patient') {
							qc.sfpquestion.answer__c = (qc.sfpquestion.answer__c == null || qc.sfpquestion.answer__c.trim().length() ==0)?s:qc.sfpquestion.answer__c+', '+s;
						}
					}
				}
				else {
					if (patientOrTreatment == 'Treatment') {
						qc.sfquestion.answer__c = 'No Answer';
					}
					else if (patientOrTreatment == 'Patient') {
						qc.sfpquestion.answer__c = 'No Answer';
					}
				}
				
				if (patientOrTreatment == 'Treatment') {
					if (Pattern.matches('[0-9, ]*', qc.sfquestion.answer__c)) {
						list<string> optionstrings = qc.sfquestion.answer__c.split(',');
						set<string> optionset = new set<string>();
						for (string str : optionstrings){
							optionset.add(str.trim());
						}
						qc.sfquestion.answer__c='';
						for (optionClass oc : qc.options) {
							if (optionset.contains(oc.id)) {
								qc.sfquestion.answer__c = (qc.sfquestion.answer__c.trim().length() ==0)?oc.value:qc.sfquestion.answer__c+', '+oc.value;
							}
						}
					}
				}
				else if (patientOrTreatment == 'Patient') {
					if (Pattern.matches('[0-9, ]*', qc.sfpquestion.answer__c)) {
						list<string> optionstrings = qc.sfpquestion.answer__c.split(',');
						set<string> optionset = new set<string>();
						for (string str : optionstrings){
							optionset.add(str.trim());
						}
						qc.sfpquestion.answer__c='';
						for (optionClass oc : qc.options) {
							if (optionset.contains(oc.id)) {
								qc.sfpquestion.answer__c = (qc.sfpquestion.answer__c.trim().length() ==0)?oc.value:qc.sfpquestion.answer__c+', '+oc.value;
							}
						}
					}
				}
				if (patientOrTreatment == 'Treatment') {
					sfqa.add(qc.sfquestion);
				}
				else if (patientOrTreatment == 'Patient') {
					sfpqa.add(qc.sfpquestion);
				}		
			}
			if (patientOrTreatment == 'Treatment') {
				database.upsert(sfqa, Satisfaction_Survey_Question__c.Fields.Survey_Order_Patient_EXT_ID__c, true);
			}
			else if (patientOrTreatment == 'Patient') {
				database.upsert(sfpqa, Medical_Profile_Question__c.Fields.Survey_Order_Patient_EXT_ID__c, true);
			}
		}
	}
	
	public static string encryptPatientId (string patientId) {
		Blob b = crypto.encrypt('AES256', encodingUtil.base64Decode(AESKEY), encodingUtil.base64Decode(INITV), blob.valueOf(patientId.trim()));
		String s = encodingUtil.base64Encode(b);
		String f = encodingUtil.urlEncode(s,'UTF-8');
		return f;
	}
	
	public static surveyClass parseSurvey(string input) {
		input = input.replace('_type','type');
		input = input.replace('_subtype','subtype');
		input = input.replace('\\/','/');
		input = input.replace('\\"','');
//		system.debug(input);
		JSONParser parser = JSON.createParser(input);
		parser.nexttoken();
		
//		system.debug('current token: '+parser.getCurrentToken());
		surveyClass s = (surveyClass)parser.readValueAs(surveyClass.class);
//		system.debug(s);
		return s;
	}
	
	public static map<string,list<string>> parseResponses(string input){
		map<string, list<string>> responseMap = new map<string,list<string>>();
		input = input.replace('_type','type');
		input = input.replace('_subtype','subtype');
		input = input.replace('\\/','/');
		input = input.replace('\\"','');
//		system.debug(input);
		JSONParser parser = JSON.createParser(input);
		while (parser.nextToken() != null){
			parser.nextToken();
			if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
				while(parser.nextToken() != null && parser.nextToken() != JSONToken.END_OBJECT){
					parser.nextToken();
//					system.debug(parser.getCurrentToken()+' : '+parser.getText());
					string key ='';
					if (parser.getText() != null){
						key = parser.getText().replace('[','').replace(']','');
						key = (key.contains(','))?key.substringbefore(','):key;
						key = key.trim().substringbetween('(',')');
//						system.debug('key: '+key);
					}
					parser.nextToken();
//					system.debug(parser.getCurrentToken()+' : '+parser.getText());
					string value ='';
					if (parser.getText() != null){
						value = parser.getText();
//						system.debug('value: '+value);
					}
					
					if (key!= null && value != null && key.trim().length()>0 && value.trim().length()>0 && key.contains('[variable')==false){
						list<string> templist = new list<string>();
						if (responseMap.containsKey(key)) {
							templist = responseMap.get(key);
							templist.add(value);
							responseMap.put(key,templist);
						}
						else {
							templist.add(value);
							responseMap.put(key,templist);
						}
					}
				}
			}
		}	
		return responseMap;
	}	
}