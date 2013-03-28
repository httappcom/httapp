public with sharing class TreatmentRedirectController {
	Private Treatment__c treatment;
	public TreatmentRedirectController(ApexPages.StandardController sc) {
		treatment = (Treatment__c)sc.getRecord();
	}
	public PageReference load() {
		PageReference pr = Page.Patient;
		pr.getParameters().put('id', treatment.Patient__c);
		pr.getParameters().put('tid', treatment.id);
		
		return null;
	}
}