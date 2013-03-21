public with sharing class ArrivalsReportController {
  public List<Treatment_Quote__c> treatmentQuoteList {get; set; }
  public List<String> facilityList {get; set; }
  public List<SelectOption> availableFacilityNames  {get; set; }
  public List<SelectOption> dateFilterOptions
  { 
    get
    {
      List<SelectOption> options = new List<SelectOption>();
      options.add(new SelectOption('7DAY', 'Next 7 days'));
      options.add(new SelectOption('MONTH', 'Next month')); 
      return options;
    }
    set; }
  public String dateFilterChosen {get; set; }   
  public Date arrivalFilterDate {get; set; }
  
  public ArrivalsReportController()
  {
  	facilityList = new List<String>();
  	availableFacilityNames = new List<SelectOption>();
  	List<Medical_Facility__c> availableFacilities = [Select Name, Id From Medical_Facility__c ];
  	if (availableFacilities.size() > 0)
  	{
  		for (Medical_Facility__c f: availableFacilities)
  		{
  			availableFacilityNames.add(New SelectOption( f.Id, f.Name));
  		}
  	}
  }
  public PageReference showArrivals()
  {
  	if (dateFilterChosen == '7DAY') arrivalFilterDate = Date.today().addDays(7);
  	else if (dateFilterChosen == 'MONTH') arrivalFilterDate = Date.today().addMonths(1);
  	treatmentQuoteList = [Select Treatment__r.Patient__r.Name, Treatment__r.Patient__r.Phone__c, Treatment__r.Arrival_Time__c, Treatment__r.Travel__r.Arrival_Airline__r.Name,  
                                Treatment__r.Travel__r.Arrival_Flight_No__c, Treatment__r.Travel__r.Wheel_Chair_Bound__c, Treatment__r.Procedure_Date__c, 
                                Treatment__r.Travel__r.Companion__c, Hotel_Nights_Included__c 
                           From Treatment_Quote__c
                           Where Procedure__r.Facility__c in : facilityList
                              And Arrival_Date__c <= : arrivalFilterDate 
                              And Arrival_Date__c >= TODAY ];
  	return null;
  }
}