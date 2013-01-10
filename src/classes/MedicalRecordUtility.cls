public with sharing class MedicalRecordUtility {

//  	private String testRecordsList = '{"medicalObjects": {"medicalObjects":[\n{\n"objectId": "VLcbStHf1d9S2X6Eugs0",\n"objectType": "someType",\n"description": "A medical record of some type.",\n"date": "1357685363000"\n},\n{\n"objectId": "tG3oIsLG7jqI4LEW5LR7",\n"objectType": "someOtherType",\n"description":  "A medical record of some other type.",\n"date": "1368359603000"\n}\n,\n{\n"objectId": "Wx4aUPVoF9MlujHxisyr",\n"objectType": "yetAnotherType",\n"description":  "A medical record of yet another type.",\n"date": "1374129681000"\n}\n]\n}\n}';
  public class MphRxCallout 
  {
  	public String getContent(String urlCommand, List<String> urlParameters)
  	{    
  		List<mphRxAPI__c> mphRxSetting = mphRxAPI__c.getAll().values();
  		String result = null;
  		if (! mphRxSetting.isempty())
  		{
		  	String url = mphRxSetting[0].URL__c;
		  	String cert = mphRxSetting[0].cert__c;
		  	String pwd = mphRxSetting[0].Password__c;
		    Http h = new Http();    
		    HttpRequest req = new HttpRequest();
		    String urlParameterString = null;
		    for (String s : urlParameters)
		    {
		    	urlParameterString = urlParameterString + '&' + EncodingUtil.urlEncode(s, 'UTF-8');
		    }
		    url = url + urlCommand + '?cert=' + cert + '&password=' + pwd + urlParameterString;
		    req.setEndpoint(url);
		    req.setMethod('GET');
		    Logger.info(req.toString());
//		    HttpResponse res = h.send(req);
//		    result = res.getBody();
  		}
  		return String.isEmpty(result) ? result : null;   		
  	}
  }
  public static List<Medical_Record__c> deserializeMphRxRecordsList(String JSONinput)
  {
  	Map<String, Object> recordsMap = (Map<String, Object>) JSON.deserializeUntyped(JSONinput);
    Set<String> keys = new Set<String>();
    keys = recordsMap.keySet();
	  for (String s : keys)
	  {
	  	Object o = recordsMap.get(s);
	  	Logger.info(s + ':' + o);
	  }
    Map<String, Object> innerMap = new Map<String, Object>();
    innerMap = (Map<String, Object>)recordsMap.get('medicalObjects');
    keys = innerMap.keySet();
    for (String s : keys)
    {
      Object o = innerMap.get(s);
      Logger.info(s + ':' + o);
    }    
    List<Object> objectList = new List<Object>();
    objectList = (List<Object>) innerMap.get('medicalObjects');
    List<Medical_Record__c> medicalRecords = new List<Medical_Record__c>(); 
    for (Object o : objectList)
    {
    	Map<String,Object> objectMap = new Map<String,Object>();
    	objectMap = (Map<String, Object>)o;
    	Medical_Record__c mr = new Medical_Record__c();
    	mr.MphRxObjectID__c = (String)objectMap.get('objectId');
    	String dateString = (String)objectMap.get('date');
    	mr.MphRxDate__c = DateTime.newInstance(Long.valueOf(dateString));
    	mr.ObjectType__c = (String)objectMap.get('objectType');
    	mr.Description__c = (String)objectMap.get('description');
    	medicalRecords.add(mr);
      Logger.info('Object: ' + mr);
    }
  	return medicalRecords;
  }
  public static Integer createMphRxPatientRecord(Patient__c patient)
  {
  	Integer mphRxPatientID;
  	return mphRxPatientID;
  }
}