public with sharing class MedicalRecordUtility {

//  	private String testRecordsList = '{"medicalObjects": {"medicalObjects":[\n{\n"objectId": "VLcbStHf1d9S2X6Eugs0",\n"objectType": "someType",\n"description": "A medical record of some type.",\n"date": "1357685363000"\n},\n{\n"objectId": "tG3oIsLG7jqI4LEW5LR7",\n"objectType": "someOtherType",\n"description":  "A medical record of some other type.",\n"date": "1368359603000"\n}\n,\n{\n"objectId": "Wx4aUPVoF9MlujHxisyr",\n"objectType": "yetAnotherType",\n"description":  "A medical record of yet another type.",\n"date": "1374129681000"\n}\n]\n}\n}';
  private class MphRxCallout 
  {
  	public String getContent(String urlCommand, Map<String, String> urlParameters)
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
		    String urlParameterString = '';
				Set<String> keys = new Set<String>();
		    keys = urlParameters.keySet();
		    for (String k : keys)
		    {
		      String v = urlParameters.get(k);
//		      urlParameterString = urlParameterString + '&' + k + '=' + EncodingUtil.urlEncode(v, 'UTF-8');
          urlParameterString = urlParameterString + k + '=' + EncodingUtil.urlEncode(v, 'UTF-8') + '&';//test
		    }
		    urlParameterString = urlParameterString + 'cert=' + cert + '&password=' + pwd; //test
//		    url = url + urlCommand + '?cert=' + cert + '&password=' + pwd + urlParameterString;
        url = url + urlCommand; //test
        
		    req.setEndpoint(url);
//		    req.setMethod('GET');
		    req.setMethod('POST'); //test
		    req.setBody(urlParameterString);//test
		    Logger.info(urlParameterString);//test
		    Logger.info(req.toString());
		    try
		    {
		      HttpResponse res = h.send(req);		    
		      result = res.getBody();
		      Logger.info('MphRxCallout.getall().result = ' + result);
		    }
				catch(CalloutException ce)
		    {
		       Logger.info(ce.getStackTraceString());
		       ServerLogUtility.updateServerLog('MphRx', ce.getmessage());
		    }   
		    catch(Exception e)
		    {
		       Logger.info(e.getStackTraceString());
		       throw e;
		    }

  		}
  		return (String.isEmpty(result) ? null : result);   		
  	}
  }
  private static List<Medical_Record__c> deserializeMphRxRecordsList(String JSONinput)
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
  private static List<String> deserializeMphRxDataReturn(String JSONInput)
  {
  	/* Sample returns:
  	 
  	   {"success":[{"code":0,"text":"31"}]}
  	   {"error":[{"code":2,"text":"Missing Mandatory Parameter"}]}
  	
  	*/
  	Map<String, Object> messageMap = (Map<String, Object>) JSON.deserializeUntyped(JSONInput);
  	Integer returnCode = null;
  	String returnText = '';
  	List<String> returnList = new List<String>();
  	for(Object o: messageMap.values())
  	{
      List<Object> l = (List<Object>)o;
      Map<String, Object> dataMap = (Map<String, Object>)l[0];
  		returnCode = (Integer)dataMap.get('code');
  		returnText = (String)dataMap.get('text');
  		if ( (returnCode != null) && (! String.isEmpty(returnText) ))
  		{
  			returnList.add(String.valueof(returnCode));
  			returnList.add(returnText);
  		}
  	}
    return returnList;
  }
  public static String createMphRxPatientRecord(Patient__c patient)
  {
  	String mphRxPatientID = '';
  	List<String> mphRxNewPatientResult = new List<String>();
    Map<String, String> parameters = new Map<String, String>();
    if (! String.isEmpty(patient.Patient_First_Name__c)) {  parameters.put('patientFirstName', patient.Patient_First_Name__c); }
    if (! String.isEmpty(patient.Patient_Last_Name__c)) {  parameters.put('patientLastName', patient.Patient_Last_Name__c); }
    if (! String.isEmpty(patient.Country__c)) {  parameters.put('patientCountry', patient.Country__c); }
    if (! String.isEmpty(patient.State__c)) {  parameters.put('patientState', patient.State__c); }
    if (! String.isEmpty(patient.Gender__c)) 
    {
    	if (patient.Gender__c == 'Male') { parameters.put('patientGender', 'M'); } 
    	if (patient.Gender__c == 'Female') { parameters.put('patientGender', 'F'); }
    }
    if (patient.Date_of_Birth__c != null) 
    { 
    	Datetime bd =  Datetime.newInstance(patient.Date_of_Birth__c, Time.newInstance(12, 0, 0, 0));
    	parameters.put('patientDateOfBirth', bd.format('yyyyMMdd')); 
    }
  	MphRxCallout callOut = new MphRxCallout();
  	mphRxNewPatientResult = deserializeMphRxDataReturn(callout.getContent('createPatientRecord', parameters));
  	Logger.info('mphRxNewPatientResult = ' + mphRxNewPatientResult);
  	if (mphRxNewPatientResult[0] == '0') //MphRx returned success
  	{
  		mphRxPatientID = mphRxNewPatientResult[1];
  	} 
  	else //MphRx returned error, or something else went wrong
  	{
  		String errorMessage = mphRxNewPatientResult[1];
  		if (String.isEmpty(errorMessage)) { errorMessage = 'Unknown Error.'; }
  		errorMessage = 'Error creating new patient: ' + errorMessage;
  		ServerLogUtility.updateServerLog('MphRx', errorMessage);
  	}
  	return mphRxPatientID;
  }
  public static String getUploadDicomURL(Patient__c patient)
  {
/*sample return {"success":[{"code":0,"text":"https://srsna.mphrx.com/connectwebapp/VStudy/uploadDicomWidget?sessionId=5E4FCD22A714F11DABA67573C95C66A7"}]}
*/
    List<String> getURLResult = new List<String>();
    String uploadDicomURL = '';
    Map<String, String> parameters = new Map<String, String>();
    parameters.put('patientID', patient.MphRx_Patient_ID__c);
    MphRxCallout callOut = new MphRxCallout();
    getURLResult = deserializeMphRxDataReturn(callout.getContent('getUploadDicomURL', parameters));
    if (getURLResult[0] == '0') //MphRx returned success
    {
      uploadDicomURL = getURLResult[1];
    } 
    else //MphRx returned error, or something else went wrong
    {
      String errorMessage = getURLResult[1];
      if (String.isEmpty(errorMessage)) { errorMessage = 'Unknown Error.'; }
      errorMessage = 'Error getting URL for DICOM upload: ' + errorMessage;
      ServerLogUtility.updateServerLog('MphRx', errorMessage);
    }
    return uploadDicomURL;
  }
  public static void testMphRx()
  {
 	Patient__c testPatient = [SELECT Id, Patient_First_Name__c, Patient_Last_Name__c, Country__c, State__c, Date_of_Birth__c FROM Patient__c WHERE Id = 'a08d000000JTxM9AAL'];
 	testPatient.Gender__c = 'Female';
 Logger.info('Patient created with ID: ' + createMphRxPatientRecord(testPatient)); 	
// 	testPatient.MphRx_Patient_ID__c = '61';
// 	Logger.info('URL for DICOM upload: ' + getUploadDicomURL(testPatient));
  }  
}