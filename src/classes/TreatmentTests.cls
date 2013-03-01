/**
* TreatmentTests.cls
* Description : Testing of the Treatment object and all related functionality
* @author M. Wicherski, MK Partners 2012
*/ 

@istest
private class TreatmentTests {

    static Patient__c patient {get;set;}
    static Treatment__c treatment {get;set;}
    static Treatment__c treatmentCheck {get;set;} //used for verification queries
    static Travel__c travel {get;set;}
    
}