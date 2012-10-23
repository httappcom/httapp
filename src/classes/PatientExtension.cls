/**
* Name        : PatientExtension
* Description : To display Patient and Related data on Patient Tab
* CreatedBy   : Ramadevi Kanchadapu
*/ 
public class PatientExtension {
  public Patient__c patient { get; set; }
  public Treatment__c treatment { get; set; }   
  public List<Treatment__c> treatments { get; set; }    
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
  //public String phaseCount { get; set; } 
  public integer treatmentCurNumber { get; set; } 
  public Integer treatmentTotCount { get; set; } 
  public String treatmentName{ get; set; } 
  public integer quoteCurNumber { get; set; } 
  public Integer quoteTotCount { get; set; } 
  public String quoteName{ get; set; }     
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
             
      if ( patient.Treatments__r.size() > 0 ){ 
        
        treatmentCurNumber = 1;  
        this.treatmentTotCount = patient.Treatments__r.size() ; 
        this.treatments = patient.Treatments__r;
        this.treatments.sort() ;     
        this.treatment = treatments[0]; 
      }     
      if ( patient.Travels__r.size() > 0 ) this.travel = patient.Travels__r[0] ;  
      if ( patient.Medical_Profiles__r.size() > 0 ) this.medprofile     = patient.Medical_Profiles__r[0];
      if ( patient.Payments__r.size() > 0 ) this.Payment = patient.Payments__r[0];
      if ( patient.Tasks.size() > 0 ) this.tasks = patient.tasks;  
      if ( patient.Incidents__r.size() > 0 ) this.incident = patient.incidents__r[0]; 
      if ( patient.Treatment_Quotes__r.size() > 0 ) {
        quoteCurNumber = 1;
        this.quoteTotCount = patient.Treatment_Quotes__r.size() ; 
        this.treatmentQuotes = patient.Treatment_Quotes__r ;  
        this.treatmentQuotes.sort();
        this.treatmentQuote = treatmentQuotes[0] ;        
      }      

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
      this.treatmentName = this.treatment.Name;                                                       
      searchTask();                                                   
      }          
    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
    }
  }  
  
  private void fetchPatient(){
      patient = PatientUtil.queryPatientAll(patient.id);        
      if (this.patient != null){
      treatmentCurNumber = 1;      
      if ( patient.Treatments__r.size() > 0 ) this.treatmentTotCount = patient.Treatments__r.size() ;      
      if ( patient.Treatments__r.size() > 0 ) this.treatment = patient.Treatments__r[0];     
      if ( patient.Travels__r.size() > 0 ) this.travel = patient.Travels__r[0] ;  
      if ( patient.Medical_Profiles__r.size() > 0 ) this.medprofile = patient.Medical_Profiles__r[0];
      if ( patient.Payments__r.size() > 0 ) this.Payment = patient.Payments__r[0];
      if ( patient.Tasks.size() > 0 ) this.tasks = patient.tasks;  
      if ( patient.Incidents__r.size() > 0 ) this.incident = patient.incidents__r[0]; 
      if ( patient.Treatment_Quotes__r.size() > 0 ) this.treatmentQuote = patient.Treatment_Quotes__r[0] ;  
    } 
  } 
  public PageReference doSave() {
    patient.Name  = firstName +' ' + lastName;  
    update patient;  
    return ApexPages.currentPage();
  }  
  public PageReference newTreatment() {
    treatment = new Treatment__c(); 
    treatment.Patient__c = this.patient.id;      
    return ApexPages.currentPage();  
  }  
  public PageReference saveTreatment() {
    Treatment__c tempTreatment;   
    if ( treatment.id ==Null ){
        insert treatment ;
        treatments.add(treatment);
        treatmentTotCount = treatmentTotCount +1;        
        tempTreatment = [select id, Name from  Treatment__c where id = : treatment.id ];
        treatmentName =  tempTreatment.Name;             
    }else{     
        update treatment ; 
    }          
    return ApexPages.currentPage();
  } 
  public boolean hasNextTreatment { 
    get { 
      if(treatmentCurNumber >= treatments.size()) {
        return false; 
      } else {
        return true; 
      }
    }
    set ;
  }
  public String phaseCount { 
    get { 
      if (treatment.Phase__c.contains( 'Inquiry' )) { return  '1';}  
      if (treatment.Phase__c.contains( 'Interaction' )) {return   '2';}  
      if (treatment.Phase__c.contains( 'Travel' )) {return   '3';}   
      if (treatment.Phase__c.contains( 'Post-Op' )) {return   '4';} 
        return '';
    }
        set ;
  }  
  public boolean hasPreviousTreatment { 
   get{ if(treatmentCurNumber <= 1 ) {
        return false; 
        } else {
          return true; 
        }
    }
    set;
  }
  public boolean hasNextQuote { 
    get { 
      if(quoteCurNumber >= treatmentQuotes.size()) {
        return false; 
      } else {
        return true; 
      }
    }
    set ;
  }
  public boolean hasPreviousQuote { 
    get{ 
      if(quoteCurNumber <= 1 ) {
        return false; 
      } else {
        return true; 
      }
    }
    set;
  }   
  public PageReference nextTreatments() {      
    if ( treatmentCurNumber <= treatmentTotCount ){ 
      treatmentCurNumber = treatmentCurNumber + 1; 
      treatment = treatments[treatmentCurNumber -1];
      treatmentName =  treatment.Name;
    }
    return ApexPages.currentPage();        
  }
  public PageReference previousTreatments() {      
    if ( treatmentCurNumber > 1 ){ 
       treatmentCurNumber = treatmentCurNumber - 1; 
       treatment = treatments[treatmentCurNumber -1];
       treatmentName =  treatment.Name;
    }
    return ApexPages.currentPage();        
  }  
  public PageReference nextQuote() {      
    if ( quoteCurNumber <= quoteTotCount ){ 
      quoteCurNumber = quoteCurNumber + 1; 
      treatmentQuote = treatmentQuotes[quoteCurNumber - 1];
      quoteName =  treatmentQuote.Name;
    }
    return ApexPages.currentPage();        
  }
  public PageReference previousQuote() {      
    if ( quoteCurNumber > 1 ){ 
       quoteCurNumber =quoteCurNumber - 1; 
       treatmentQuote = treatmentQuotes[quoteCurNumber - 1];
       quoteName =  treatmentQuote.Name;
    }
    return ApexPages.currentPage();        
  }   
  public PageReference newQuote() {
    treatmentQuote = new Treatment_Quote__c(); 
    treatmentQuote.Patient__c = this.patient.id;
    treatmentQuote.Treatment__c = this.treatment.id;
    return ApexPages.currentPage();
  }   
  public PageReference saveQuote() { 
     Treatment_Quote__c tempQuote;
     if ( treatmentQuote.id == Null ){
        insert treatmentQuote ;
        treatmentQuotes.add(treatmentQuote);
        quoteTotCount = quoteTotCount + 1;        
        tempQuote = [select id, Name from  Treatment_Quote__c where id = : treatmentQuote.id ];
        quoteName =  tempQuote.Name;                          
     }else{     
        update treatmentQuote ; 
     }  
     return ApexPages.currentPage();
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