public with sharing class ArrivalsReportController {
  public List<Treatment_Quote__c> treatmentQuoteList {get; set; }
  public List<Id> facilityList {get; set; }
  public Date arrivalFilterDate {get; set; }
  
  public ArrivalsReportController()
  {
  	facilityList = new List<Id>();
    treatmentQuoteList = [Select Treatment__r.Patient__r.Name, Treatment__r.Patient__r.Phone__c, Treatment__r.Arrival_Time__c, Treatment__r.Travel__r.Arrival_Airline__r.Name,  
                            Treatment__r.Travel__r.Arrival_Flight_No__c, Treatment__r.Travel__r.Wheel_Chair_Bound__c, Treatment__r.Procedure_Date__c, 
                            Treatment__r.Travel__r.Companion__c, Hotel_Nights_Included__c 
                           From Treatment_Quote__c
                           Where Procedure__r.Facility__c in : facilityList
                              And Arrival_Date__c <= : arrivalFilterDate 
                              And Arrival_Date__c >= TODAY ];
  }
}