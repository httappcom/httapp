public with sharing class RequestQuoteController 
{
	
  public Patient__c patient {get; set; }
  public Treatment__c treatment {get; set; }
  public Travel__c travel { get; set; }    
  public Treatment_Quote__c treatmentQuote { get; set; }
  
  public String reference_number { get; set; }
  public String authorized_by_insurance { get; set; }
  public String guardian_info { get; set; }
  public String guardian_additional { get; set; }
  public String caller_referral_comments { get; set; }
  public String preferred_facility { get; set; }
  public String medical_diagnosis { get; set; }
  public String symptom_summary { get; set; } 
  public String time_frame { get; set; } 
  public String preferred_appointment { get; set; } 
  public String concierge_needed { get; set; } 
  private Map<String, String> URLParams { get; set; } 
  public RequestQuoteController()
  {
  	treatment = new Treatment__c();
  	patient = new Patient__c();
  	travel = new  Travel__c();
  	URLparams = System.currentPagereference().getParameters();
    if (URLparams.containsKey('nextLead'))
    {
      ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM, 'Lead submitted. Submit next lead below.'));
    }    	  	
  }
  public PageReference submitLead()
  {
    //Check to see if patient already exists
    List<Patient__c> patients = [Select Id FROM Patient__c WHERE Email__c = : patient.Email__c];
    if (patients.size() > 0)
    {
      patient = patients[0];
    }
    treatment.Phase__c = PickListDefines.Phase.Inquiry;
    treatment.Stage__c = PickListDefines.Stage.Initial;
    if (URLparams.containsKey('enteredBy'))
    {    
      treatment.Lead_Entry__c = URLparams.get('enteredBy');
    }
    INSERT travel;    
    if (patient.Id == null) { INSERT patient; }
    else { UPDATE patient; }
    treatment.Travel__c = travel.id;
    treatment.Patient__c = patient.id;    
    INSERT treatment; 
    Note resultsNote = new Note(); 
    String noteBody = '';   
    if (! String.isBlank(reference_number) )
    {
    	noteBody += 'Reference number: ' + reference_number + ' \r\n';
    }
    if (! String.isBlank(authorized_by_insurance) )
    {
      noteBody += 'Authorized by insurance: ' + authorized_by_insurance + ' \r\n';
    } 
    if (! String.isBlank(guardian_info) )
    {
      noteBody += 'Guardian info: ' + guardian_info + ' \r\n';
    }
    if (! String.isBlank(guardian_additional) )
    {
      noteBody += 'Additional guardian info: ' + guardian_additional + ' \r\n';
    } 
    if (! String.isBlank(caller_referral_comments) )
    {
      noteBody += 'Comments about caller/referral: ' + caller_referral_comments + ' \r\n';
    } 
    if (! String.isBlank(preferred_facility) )
    {
      noteBody += 'Preferred facility type and location: ' + preferred_facility + ' \r\n';
    } 
    if (! String.isBlank(medical_diagnosis) )
    {
      noteBody += 'Medical diagnosis: ' + medical_diagnosis + ' \r\n';
    } 
    if (! String.isBlank(symptom_summary) )
    {
      noteBody += 'Current symptoms and issues: ' + symptom_summary + ' \r\n';
    } 
    if (! String.isBlank(time_frame) )
    {
      noteBody += 'Desired treatment time frame: ' + time_frame + ' \r\n';
    } 
    if (! String.isBlank(preferred_appointment) )
    {
      noteBody += 'Preferred treatment/procedure appointment: ' + preferred_appointment + ' \r\n';
    } 
    if (! String.isBlank(concierge_needed) )
    {
      noteBody += 'Travel concierge services required? ' + concierge_needed + ' \r\n';
    }                                  
    if (! String.isBlank(noteBody) )
    {
    	resultsNote.Title = 'Lead Entry Responses';
      resultsNote.ParentId = patient.id;
      resultsNote.Body = noteBody;
      INSERT resultsNote;
    }
    PageReference nextEntry = new PageReference(ApexPages.currentPage().getUrl());
    nextEntry.setRedirect(true);
    nextEntry.getParameters().put('nextLead', '1');    
    return nextEntry;    

  }   
  public PageReference requestQuote()
  {
  	//Check to see if patient already exists
  	List<Patient__c> patients = [Select Id FROM Patient__c WHERE Email__c = : patient.Email__c];
  	if (patients.size() > 0)
  	{
  		patient = patients[0];
  	}
  	treatment.Phase__c = PickListDefines.Phase.Inquiry;
  	treatment.Stage__c = PickListDefines.Stage.Initial;
  	INSERT travel;  	
  	if (patient.Id == null) { INSERT patient; }
  	else { UPDATE patient; }
  	treatment.Travel__c = travel.id;
  	treatment.Patient__c = patient.id;
  	INSERT treatment;
  	PageReference thankYouPage = Page.Request_Quote_Thank_You;  
    return thankYouPage;
  }
 
}