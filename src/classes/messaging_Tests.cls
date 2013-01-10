@isTest
private class messaging_Tests {
	
	static Patient__c testPatient = new Patient__c();

	static testMethod void messaging_Controller_UnitTest() {
		test.startTest();
			messaging_Controller controller = new messaging_Controller();
//			controller.parentId = null;
//			controller.getTopicOptions();
		test.stopTest();
	}
}