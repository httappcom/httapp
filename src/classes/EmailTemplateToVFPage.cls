public class EmailTemplateToVFPage {
	public static void compileVisualForcePage( String uid, String pwd, EmailTemplate emailTemplate, String vfController, String dbObject ) {
		partnerSoapSforceCom.Soap con = new partnerSoapSforceCom.Soap();
		partnerSoapSforceCom.LoginResult loginResult = con.login(uid, pwd);
		
		con.SessionHeader = new partnerSoapSforceCom.SessionHeader_element();
		con.Sessionheader.sessionid = loginResult.sessionid;
		con.endpoint_x = loginResult.ServerUrl;
		
		List<sobjectPartnerSoapSforceCom.sObject_x> sobjectList = new List<sobjectPartnerSoapSforceCom.sObject_x>();
		sobjectPartnerSoapSforceCom.sObject_x vfPageObj = new sobjectPartnerSoapSforceCom.sObject_x();
		vfPageObj.Markup = vfMarkup;
		sobjPage.MasterLabel = eTmpl.DeveloperName;
		sobjPage.Name = eTmpl.DeveloperName.replaceAll(' ','_');
		sobjPage.ControllerType = '2';
		vfPageObj.type_x = 'ApexPage';
		vfPageObj.ControllerKey = vfController;
		sobjPage.Description = '';

		partnerSoapSforceCom.SaveResult[] saveResult = null;
        if (vfPage == null) {
	        AggregateResult[] results = [select max(ApiVersion) apiversion from ApexPage ];
	   	    sobjPage.ApiVersion = String.valueOf(results[0].get('apiversion'));
	   	    sObjects.add(sobjPage);
        	res = con.create(sObjects);
        } else {
        	sobjPage.Id = vfPage.Id;
    	    sObjects.add(sobjPage);
        	res = con.updateSobjects(sObjects);
        }
 		if (!res[0].success) {
 			String msg = '';
 			String delim = '';
 			List<String> msgs = new List<String>();
 			for (Integer i=0;i<res[0].errors.size();i++) {
 				msg += delim + res[0].errors[i].message;
 				delim = '\n';
 			}
 			throw new ValidationException(msg);
 		}
	}
}