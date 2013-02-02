public with sharing class MedicalRecordUploadController {
	
	private ID patientId = null;

	public String docKey { get; set; }	
 	private String AWSCredentialName = 'Medical Records S3 Credentials';
 	private S3_Credentials__c credentials;
 	public String secret { get {return credentials.Secret__c;} }
	public String key { get {return credentials.Key__c;} }
	public String bucket { get {return credentials.Bucket__c;} }
	private String policy;
	
	public Medical_Record__c record;
 	public String serverURL {get;set;}
 	
 	public String getMimeMapJS() {
 		return S3Utils.getMimeMapJS();
 	}
 	
 	ApexPages.StandardController con;
 	public MedicalRecordUploadController(ApexPages.StandardController stdController) {
        this.con = stdController;
		this.record = (Medical_Record__c)stdController.getRecord();
        User u = [select id, contactid from User where id = :userinfo.getUserId()];
        
        Patient__c[] plist = [select id 
                            from Patient__c 
                            where key_contact__c = :u.contactid
                            limit 1];
        patientId = plist[0].id;
		record.Patient__c = patientId;
 		
 		serverURL = URL.getSalesforceBaseUrl().toExternalForm();
    }
    
    public PageReference constructor(){
		credentials = S3Utils.getCredentials(AWSCredentialName);
		if (credentials == null || credentials.Key__c == null || credentials.Secret__c == null || credentials.Bucket__c == null) {
	    	ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Please set S3 credentials for Medical Records.');
			ApexPages.addMessage(errorMsg);
		}	
    
		Datetime expire = System.now().addDays(1);
		String formattedexpire = expire.formatGmt('yyyy-MM-dd')+'T'+
			expire.formatGmt('HH:mm:ss')+'.'+expire.formatGMT('SSS')+'Z';           
	      
		policy  = '{ "expiration": "'+formattedexpire+'","conditions": [ {"bucket": "'+
    		credentials.Bucket__c +'" } ,{ "acl": "public-read" },'+
//    	'{"success_action_redirect": "https://'+serverurl+'/'+record.id+'"},' +
    	'["starts-with", "$com.salesforce.visualforce.viewstatecsrf", ""],'+
    	'["starts-with", "$com.salesforce.visualforce.viewstatemac", ""],'+
    	'["starts-with", "$success_action_redirect", ""],'+
    	'["starts-with", "$com.salesforce.visualforce.viewstate", ""],'+
    	' ["starts-with", "$key", ""] ]}';

		docKey = S3Utils.genDocKey(patientId);
Logger.info('docKey='+docKey);
		
		return null;
    }
    
    public String getPolicy() {
        return EncodingUtil.base64Encode(Blob.valueOf(policy));
    }
    
    public String getSignedPolicy() {    
        return make_sig(EncodingUtil.base64Encode(Blob.valueOf(policy)));        
    }
    
    // tester
    public String getHexPolicy() {
        String p = getPolicy();
        return EncodingUtil.convertToHex(Blob.valueOf(p));
    }
    
    //method that will sign
    private String make_sig(string canonicalBuffer) {        
        String macUrl ;
        String signingKey = EncodingUtil.base64Encode(Blob.valueOf(secret));
        Blob mac = Crypto.generateMac('HMacSHA1', blob.valueof(canonicalBuffer),blob.valueof(Secret)); 
        macUrl = EncodingUtil.base64Encode(mac);                
        return macUrl;
    }
    
	public pageReference saveMedRec() {
		con.save();
		return null;
	}
	
}