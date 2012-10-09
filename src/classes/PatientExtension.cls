/**
* Name        : PatientExtension
* Description : To display Patient and Related data on Patient Tab
* CreatedBy   : Ramadevi Kanchadapu
*/ 
public class PatientExtension {
  public Patient__c patient { get; set; }
  public Treatment__c treatment { get; set; }    
  public Travel__c travel { get; set; }
  public List<Message__c> messages { get; set; }
  public List<Task> tasks { get; set; }  
  public Payment__c payment { get; set; }   
  public List<Medical_Profile__c> medProfiles { get; set; }
  public Medical_Profile__c medProfile { get; set; }  
  public Treatment_Quote__c treatmentQuote { get; set; }
  public List<Treatment_Quote__c> treatmentQuotes { get; set; }   
  public List<Incident__c> incidents { get; set; }
  public Incident__c incident { get; set; }
    
  public List<SelectOption> taskOptions { get; set; }
  public String selectedTaskOption { get; set; }
  public String firstName { get; set; }
  public String lastName { get; set; }
  public String phaseCount { get; set; }    
  public Boolean inquiryFlag { get; set; }    
  public Boolean interactionFlag { get; set; }    
  public Boolean travelFlag { get; set; }
  public Boolean postopFlag { get; set; }
  public Boolean IncidentFlag { get; set; }
  public Boolean FeaturesFlag { get; set; }
  public Boolean QuoteFlag { get; set; }
  public Boolean PaymentFlag { get; set; }
  public ID pid ; 
            
  public PatientExtension(ApexPages.StandardController sc) {
    this.patient = (Patient__c)sc.getRecord();
           
    try{       
        this.patient = PatientUtil.queryPatientAll(sc.getId());        
      if (this.patient != null){
      if ( patient.Treatments__r.size() > 0 ) this.treatment = patient.Treatments__r[0];     
      if ( patient.Travels__r.size() > 0 ) this.travel = patient.Travels__r[0] ;  
      if ( patient.Medical_Profiles__r.size() > 0 ) this.medprofile     = patient.Medical_Profiles__r[0];
      if ( patient.Payments__r.size() > 0 ) this.Payment = patient.Payments__r[0];
      if ( patient.Tasks.size() > 0 ) this.tasks = patient.tasks;  
      if ( patient.Incidents__r.size() > 0 ) this.incident = patient.incidents__r[0]; 
      if ( patient.Treatment_Quotes__r.size() > 0 ) this.treatmentQuote = patient.Treatment_Quotes__r[0] ;      

      System.debug('Patient Name'+ this.patient); 
      System.debug('Treatment Name'+ this.treatment); 
      System.debug('Travel Name'+ this.travel);       
      System.debug('medprofile   Name'+ this.medprofile  );            
      System.debug('Payment Name'+ this.payment); 
      System.debug('Tasks Name'+ this.tasks);       
      System.debug('Incident Name'+ this.incident); 
      System.debug('treatmentQuote Name'+ this.treatmentQuote ); 
      
      this.inquiryFlag = true;
      this.interactionFlag = false;
      this.travelFlag = false;
      this.postopFlag = false;
      this.selectedTaskOption = 'All Open';
      taskOptions = new List<SelectOption>();
      taskOptions.add(new SelectOption('All Open', 'All Open'));
      taskOptions.add(new SelectOption('All Closed', 'All Closed'));
      taskOptions.add(new SelectOption('My Open', 'My Open'));
      taskOptions.add(new SelectOption('My Closed', 'My Closed')); 
       
                   
      this.firstName = this.patient.Name.split(' ')[0];   
      this.lastName = this.patient.Name.split(' ')[1]; 

  
      if (treatment.Phase__c.contains( 'Inquiry' )) {phaseCount = '1';}  
      if (treatment.Phase__c.contains( 'Interaction' )) {phaseCount = '2';}  
      if (treatment.Phase__c.contains( 'Travel' )) {phaseCount = '3';}   
      if (treatment.Phase__c.contains( 'Post-Op' )) {phaseCount = '4';}                                                         
      searchTask();                                                   
      }          
    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
    }
  }    
  public void displayInquiry(){
    inquiryFlag = true;
    interactionFlag = false;
    travelFlag = false;
    postopFlag = false;
  }    
  public void displayInteraction(){
    inquiryFlag = false;
    interactionFlag = true;
    travelFlag = false;
    postopFlag = false;
    IncidentFlag = true;
  }        
  public void displayTravel(){
    inquiryFlag = false;
    interactionFlag = false;
    travelFlag = true;
    postopFlag = false;
  }      
  public void displayPostOp(){
    inquiryFlag = false;
    interactionFlag = false;
    travelFlag = false;
    postopFlag = true;
  }   
  public void displayIncident(){
    IncidentFlag = true;
    FeaturesFlag = false;
    QuoteFlag = false;
    PaymentFlag = false;
  }    
  public void displayFeatures(){
    IncidentFlag = false;
    FeaturesFlag = true;
    QuoteFlag = false;
    PaymentFlag = false;
  }    
  public void displayQuotes(){
    IncidentFlag = false;
    FeaturesFlag = false;
    QuoteFlag = true;
    PaymentFlag = false;
  }    
  public void displayPayments(){
    IncidentFlag = false;
    FeaturesFlag = false;
    QuoteFlag = false;
    PaymentFlag = true;
  }    
  
  public void searchTask(){
    Id currentUserId =   UserInfo.getUserId();
    this.tasks = new List<Task>();
        
    try {
         
      if (selectedTaskOption == 'All Open') {
        for (Task t : this.patient.Tasks) {
          if (t.Status != 'Completed') {     
              this.tasks.add(t);
          }
        }
      } else if (selectedTaskOption == 'My Open') {
        for (Task t : this.patient.Tasks) {
          if (t.Status !='Completed' && t.Ownerid == currentUserId) {
            this.tasks.add(t);
          }
        }
      } else if (selectedTaskOption == 'All Closed') {
        for (Task t : this.patient.Tasks) {
            if (t.Status == 'Completed') {
                this.tasks.add(t);
            }
        }
      } else if (selectedTaskOption == 'My Closed') {
        for (Task t : this.patient.Tasks) {
            if (t.Status !='Completed' && t.Ownerid == currentUserId) {
                this.tasks.add(t);
            }
        }
      }                                                                 
    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
    }
  }   
  static testMethod void testPatientExtension(){
    Patient__c pat = new Patient__c();
    pat.name = 'Test';
    insert pat;
        
    Treatment__c t = new Treatment__c();
    t.Patient__c = pat.id;
    insert t;
    
    Task task = new Task();
    task.subject ='Test';
    task.Status = 'Completed';
    task.Whatid = pat.id;    
    insert task ;
    
    PatientExtension pe = new PatientExtension( new ApexPages.StandardController(pat));
    pe.displayInquiry();    
    pe.displayInteraction();
    pe.displayTravel();
    pe.displayPostOp();
    pe.displayIncident();  
    pe.displayFeatures(); 
    pe.displayQuotes();  
    pe.displayPayments();   
    pe.selectedTaskOption = 'All Closed';
    pe.searchTask();    
  }       
}