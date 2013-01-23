public with sharing class S3Utils {
    //For encryption, DO NOT MODIFY////
    private static final string AESKEY  = 'gPQEiFm4E4hCmHsRn3XZWQSR2NGfCHihKkMlgGQMwWA=';
    private static final string INITV   = 'Ym/RaHLLU6n8173xYC8e8w==';
    ///////////////////////////////////
	private static Map<String, String> extnToMimeTypeMap = new Map<String, String>{
		'gif' => 'image/gif',
		'jpeg' => 'image/jpeg',
		'jpg' => 'image/jpeg',
		'png' => 'image/png',
		'tif' => 'image/tiff',
		'tiff' => 'image/tiff',
		'html' => 'text/html',
		'htm' => 'text/html',
		'txt' => 'text/plain',
		'pdf' => 'application/pdf',
		'rtf' => 'application/rtf',
		'doc' => 'application/msword',
		'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
	};
	public static String getMimeMapJS() {
		String js = 'var extnToMimeTypeMap = {';
		String delim = '';
		for (String key : extnToMimeTypeMap.keySet()) {
			js += delim+'\''+key+'\':\''+extnToMimeTypeMap.get(key)+'\'';
			delim = ',';
		}
		js += '};';
		return js;
	} 
	//'Medical Records S3 Credentials'
	public static S3_Credentials__c getCredentials( String name ) {
		Map<String,S3_Credentials__c> credsMap = S3_Credentials__c.getAll();
		return credsMap.get(name);
	}
	
	public static String genDocKey(String patientId) {
        String oid = userinfo.getOrganizationId();
		String oPatientId = oid+patientId;
        DateTime dt = DateTime.now();
		String millis = String.valueOf(dt.getTime());
		String suffix = millis+Crypto.getRandomLong();
		return oPatientId.trim()+'-'+suffix;
/*        Blob b = crypto.encrypt('AES256', encodingUtil.base64Decode(AESKEY), encodingUtil.base64Decode(INITV), blob.valueOf());
        return encodingUtil.base64Encode(b)+'-'+suffix;*/
	}
	
	public String getMimeTypeForExtn( String extn ) {
		return extnToMimeTypeMap.get(extn);
	}
}