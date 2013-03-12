public without sharing class RequestQuoteController 
{
	
  public Patient__c patient {get; set; }
  public Treatment__c treatment {get; set; }
  public Patient_Lead__c patientLead {get; set; }  
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
  public Map<String, String> patientFieldMap 
  {
  	get 
  	{
  		// Must be lowercase!
  		return new Map<String, String>
		    {
          'patient_first_name__c' => 'patient_first_name__c',
          'patient_last_name__c' => 'patient_last_name__c',
          'date_of_birth__c' => 'date_of_birth__c',
          'gender__c' => 'gender__c',
          'country__c' => 'country__c',
          'phone__c' => 'phone__c',
          'email__c' => 'email__c',
          'preferred_language__c' => 'preferred_language__c',
          'social_security__c' => 'social_security_number__c',
          'ins_policy__c' => 'ins_policy__c'
		    };
  	} 
  	private set;
  }
  public Map<String, String> treatmentFieldMap 
  {
    get 
    {
    	// Must be lowercase!
      return new Map<String, String>
        {
          'payment_type__c' => 'treatment_payment_type__c',
          'referrer__c' => 'treatment_referrer__c',
          'referrer_phone__c' => 'treatment_referrer_phone__c',
          'referral_source__c' => 'treatment_referral_source__c',
          'referring_provider_name__c' => 'treatment_referring_provider_name__c',
          'referring_provider_phone__c' => 'treatment_referring_provider_phone__c',
          'referring_provider_fax__c' => 'treatment_referring_provider_fax__c',
          'referring_provider_npi__c' => 'treatment_referring_provider_npi__c',
          'procedure_category__c' => 'treatment_procedure_category__c',
          'procedure__c' => 'treatment_procedure__c',
          'preferred_destination__c' => 'treatment_preferred_destination__c',
          'lead_entry__c' => 'treatment_lead_entry__c'          
        };
    } 
    private set;
    }  
  public RequestQuoteController()
  {
  	treatment = new Treatment__c();
  	patient = new Patient__c();
    patientLead = new Patient_Lead__c();
    if ( System.currentPagereference() != null )
    {
	  	URLparams = System.currentPagereference().getParameters();
	    if (URLparams.containsKey('nextLead'))
	    {
	      ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM, 'Lead submitted. Submit next lead below.'));
	    }
    }    	  	
  }
  
  private Patient_Lead__c serializeLeadInfo()
  {
  	Patient_Lead__c pl = new Patient_Lead__c();
  	Logger.info('Patient: ' + patient);
  	Logger.info('Treatment: ' + treatment);
    Map<String, Schema.SObjectField> treatmentSchemaFieldMap = Schema.SObjectType.Treatment__c.fields.getMap();
    for ( String fieldName : treatmentSchemaFieldMap.keySet() )
    {
    	Logger.info('fieldName: ' + fieldName);
    	if ( treatmentFieldMap.containsKey(fieldName.toLowerCase()) )
    	{
    		Logger.info('Found key' + fieldName + ' in treatmentFieldMap.');
	    	if (treatment.get(fieldName) != null)
	    	{
	    		    Logger.info('pl: ' + pl);
	    		pl.put(treatmentFieldMap.get(fieldName), treatment.get(fieldName));
	      }
      }
    }
    Map<String, Schema.SObjectField> patientSchemaFieldMap = Schema.SObjectType.Patient__c.fields.getMap();
    for ( String fieldName : patientSchemaFieldMap.keySet() )
    {
    	
      Logger.info('fieldName: ' + fieldName);
      if ( patientFieldMap.containsKey( fieldName.toLowerCase() ) )
      {
        if (patient.get(fieldName) != null)
        {
        	    Logger.info('pl: ' + pl);
          pl.put(patientFieldMap.get(fieldName), patient.get(fieldName));
        }
      }
    }
    Logger.info('pl: ' + pl);
    return pl;   
  }
    public void deserializeLeadInfo(Patient_Lead__c pl)
    {
      this.patient = new Patient__c();      
      this.treatment = new Treatment__c();
      Set<String> patientFields = patientFieldMap.keySet();
      for (String field : patientFields)
      {      	
      	if (pl.get(patientFieldMap.get(field)) != null)
      	{
      		this.patient.put( field, pl.get(patientFieldMap.get(field)) );
      	}
      }
      Set<String> treatmentFields = treatmentFieldMap.keySet();
      for (String field : treatmentFields)
      {        
        if (pl.get(treatmentFieldMap.get(field)) != null)
        {
          this.treatment.put( field, pl.get(treatmentFieldMap.get(field)) );
        }
      }            
    }  
  
  
  public PageReference submitLead()
  {
  	
    patientLead = serializeLeadInfo();
    
    if (URLparams.containsKey('enteredBy'))
    {    
      patientLead.Treatment_Lead_Entry__c = URLparams.get('enteredBy');
    }
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
      patientLead.Treatment_Note__c = noteBody;
    }
    Insert patientLead;
    PageReference nextEntry = new PageReference(ApexPages.currentPage().getUrl());
    nextEntry.setRedirect(true);
    nextEntry.getParameters().put('nextLead', '1');    
    return nextEntry;    

  }   
  public PageReference requestQuote()
  {
    patientLead = serializeLeadInfo();
    INSERT patientLead;
    PageReference thankYouPage = Page.Request_Quote_Thank_You;  
    return thankYouPage;
  }  
}