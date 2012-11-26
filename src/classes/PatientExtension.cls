/**
* Name        : PatientExtension
* Description : To display Patient and Related data on Patient Tab
* CreatedBy   : Ramadevi Kanchadapu
*/ 
public class PatientExtension {
  public Patient__c patient { get; set; }
  public Treatment__c treatment { get; set; }
  public Payment__c payment { get; set; }      
  public Travel__c travel { get; set; }
  public List<Message__c> messages { get; set; }
  public List<Task> tasks { get; set; }  
 
  public List<Medical_Profile__c> medProfiles { get; set; }
  public Medical_Profile__c medProfile { get; set; }  
  public Treatment_Quote__c treatmentQuote { get; set; }
  public Incident__c incident { get; set; }
    
  public List<SelectOption> taskOptions { get; set; }
  public String selectedTaskOption { get; set; }
  public String firstName { get; set; }
  public String lastName { get; set; } 
  public integer treatmentCurNumber { get; set; } 
  public Integer treatmentTotCount { get; set; } 
  public String treatmentName{ get; set; } 
  public List<String> treatmentNames{ get; set; }   
  public integer quoteCurNumber { get; set; } 
  public Integer quoteTotCount { get; set; } 
  public String quoteName{ get; set; }
  public integer paymentCurNumber { get; set; } 
  public Integer paymentTotCount { get; set; }     
  public String paymentName{ get; set; } 
  public integer incidentCurNumber { get; set; } 
  public Integer incidentTotCount { get; set; }     
  public String incidentName{ get; set; }        
  public Boolean inquiryFlag { get; set; }    
  public Boolean interactionFlag { get; set; }    
  public Boolean travelFlag { get; set; }
  public Boolean postopFlag { get; set; }
  public Boolean IncidentFlag { get; set; }
  public Boolean FeaturesFlag { get; set; }
  public Boolean QuoteFlag { get; set; }
  public Boolean PaymentFlag { get; set; }
  private List<Treatment__c> treatments ;
  private List<Payment__c> payments ;    
  private List<Incident__c> incidents ;
  private List<Treatment_Quote__c> treatmentQuotes ;
            
  public PatientExtension(ApexPages.StandardController sc) {
    this.initiatePatient();     
    try{  
      if  (sc.getId() !=null  ) { 
      //this.patient = (Patient__c)sc.getRecord();          
      this.patient = PatientUtil.queryPatientAll(sc.getId());        
      if (this.patient != null){                
      if ( patient.Treatments__r.size() > 0 ){         
        treatmentCurNumber = 1;  
        this.treatmentTotCount = patient.Treatments__r.size() ; 
        this.treatments = patient.Treatments__r;
        this.treatments.sort() ;  
        for (Treatment__c t : this.treatments) this.treatmentNames.add(t.name);                   
        this.treatment = treatments[0]; 
      }     
      if ( patient.Travels__r.size() > 0 ) this.travel = patient.Travels__r[0] ;  
      if ( patient.Medical_Profiles__r.size() > 0 ) this.medprofile     = patient.Medical_Profiles__r[0];
      if ( patient.Payments__r.size() > 0 ) {
        paymentCurNumber = 1;
        this.paymentTotCount = patient.Payments__r.size() ; 
        this.payments= patient.Payments__r ;  
        this.payments.sort();
        this.payment = payments[0] ;        
      }  
      if ( patient.Incidents__r.size() > 0 ) {
        incidentCurNumber = 1;
        this.incidentTotCount = patient.Incidents__r.size() ; 
        this.incidents= patient.Incidents__r ;  
        this.incidents.sort();
        this.incident = incidents[0] ;        
      }      
      if ( patient.Tasks.size() > 0 ) this.tasks = patient.tasks;  
      if ( patient.Incidents__r.size() > 0 ) this.incident = patient.incidents__r[0]; 
      if ( patient.Treatment_Quotes__r.size() > 0 ) {
        this.quoteCurNumber = 1;
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
                   
      this.firstName = this.patient.Name.split(' ')[0];   
      this.lastName = this.patient.Name.split(' ')[1]; 
      this.treatmentName = this.treatment.Name;                                                       
      searchTask();                                                   
      } 
      }else {       
      }        
    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
    }
  }  
  private void initiatePatient(){
    this.firstName = '';
    this.lastName = '';    
    this.inquiryFlag = true;
    this.interactionFlag = false;
    this.travelFlag = false;
    this.postopFlag = false;
    this.IncidentFlag = false;
    this.FeaturesFlag = false;
    this.QuoteFlag = false;
    this.PaymentFlag = false;    
    this.patient = new Patient__c ();      
    this.treatments = new List<Treatment__c> (); 
    this.tasks = new List<Task> ();
    this.messages = new List<Message__c> ();
    this.treatmentCurNumber = 0;
    this.treatmentTotCount = 0;   
    this.treatmentNames = new List<String> ();     
    initiateTreatment() ;                 
    this.selectedTaskOption = 'All Open';
    this.taskOptions = new List<SelectOption>();
    this.taskOptions.add(new SelectOption('All Open', 'All Open'));
    this.taskOptions.add(new SelectOption('All Closed', 'All Closed'));
    this.taskOptions.add(new SelectOption('My Open', 'My Open'));
    this.taskOptions.add(new SelectOption('My Closed', 'My Closed'));        
  } 
  
  private void initiateTreatment(){  
    this.treatment = new Treatment__c ();  
    this.travel = new  Travel__c ();
    this.payment = new Payment__c ();
    this.payments = new List<Payment__c> ();  
    this.medProfiles = new List<Medical_Profile__c>  ();
    this.medProfile = new Medical_Profile__c (); 
    this.treatmentQuote = new Treatment_Quote__c ();
    this.treatmentQuotes = new List<Treatment_Quote__c> (); 
    this.incidents = new List<Incident__c> ();
    this.incident = new Incident__c();      
    this.quoteTotCount = 0;
    this.quoteCurNumber = 0;    
    this.paymentTotCount = 0;
    this.paymentCurNumber = 0;
    this.treatmentName = '' ;    
    this.paymentName = '' ;
    this.quoteName = ''  ; 
  }      
  public PageReference savePatient() {
    patient.Name  = firstName +' ' + lastName;  
    patient.Patient_First_Name__c = firstname;
    patient.Patient_last_Name__c = lastname;
    if ( patient.id == Null ){ 
      insert patient;
    }else{              
      update patient;  
    }      
    return ApexPages.currentPage();
  } 
  public PageReference newPatient() {
    initiatePatient();
    return ApexPages.currentPage();  
  }     
  public PageReference newTreatment() {
    initiateTreatment();
    return ApexPages.currentPage();  
  }  
  public PageReference saveTreatment() {
    Treatment__c tempTreatment; 
    patient.Name  = firstName +' ' + lastName;  
    patient.Patient_First_Name__c = firstname;
    patient.Patient_last_Name__c = lastname;
    if ( patient.id == Null ){ 
      insert patient;
    }else{              
      update patient;  
    }       
    if ( treatment.id ==Null ){
      treatmentName = '' ;     
      treatment.Patient__c = patient.id;    
      insert treatment ;
      treatments.add(treatment);
      treatmentTotCount = treatmentTotCount + 1;
      treatmentCurNumber = treatmentCurNumber + 1;         
      tempTreatment = [select id, Name from  Treatment__c where id = : treatment.id ];
      treatmentName =  tempTreatment.Name; 
      treatmentNames.add(treatmentName) ;           
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
      if (treatment.id != null){    
      if (treatment.Phase__c.contains( 'Inquiry' )) { return  '1';}  
      if (treatment.Phase__c.contains( 'Interaction' )) {return   '2';}  
      if (treatment.Phase__c.contains( 'Travel' )) {return   '3';}   
      if (treatment.Phase__c.contains( 'Post-Op' )) {return   '4';} 
      }
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
  public boolean hasNextIncident { 
    get { 
      if(incidentCurNumber >= incidents.size()) {
        return false; 
      } else {
        return true; 
      }
    }
    set ;
  }
  public boolean hasPreviousIncident { 
    get{ 
      if(incidentCurNumber <= 1 ) {
        return false; 
      } else {
        return true; 
      }
    }
    set;
  }    
  public boolean hasNextPayment { 
    get { 
      if(paymentCurNumber >= payments.size()) {
        return false; 
      } else {
        return true; 
      }
    }
    set ;
  }
  public boolean hasPreviousPayment { 
    get{ 
      if(paymentCurNumber <= 1 ) {
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
      treatmentName =  treatmentNames[treatmentCurNumber - 1];
    }
    return ApexPages.currentPage();        
  }
  public PageReference previousTreatments() {      
    if ( treatmentCurNumber > 1 ){ 
       treatmentCurNumber = treatmentCurNumber - 1; 
       treatment = treatments[treatmentCurNumber - 1];
       treatmentName =  treatmentNames[treatmentCurNumber - 1];
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
    treatmentQuote.Patient__c = patient.id;
    treatmentQuote.Treatment__c = treatment.id;
    return ApexPages.currentPage();
  }   
  public PageReference saveQuote() { 
     Treatment_Quote__c tempQuote;
     if ( treatmentQuote.id == Null ){
        treatmentQuote.Patient__c = patient.id;     
        insert treatmentQuote ;
        treatmentQuotes.add(treatmentQuote);
        quoteTotCount = quoteTotCount + 1; 
        quoteCurNumber =  quoteCurNumber +1 ;      
        tempQuote = [select id, Name from  Treatment_Quote__c where id = : treatmentQuote.id ];
        quoteName =  tempQuote.Name;                          
     }else{     
        update treatmentQuote ; 
     }  
     return ApexPages.currentPage();
  } 
  public PageReference nextIncident() {      
    if ( incidentCurNumber <= incidentTotCount ){ 
      incidentCurNumber = incidentCurNumber + 1; 
      incident = incidents[incidentCurNumber - 1];
      incidentName =  incident.Name;
    }
    return ApexPages.currentPage();        
  }
  public PageReference previousIncident() {      
    if ( incidentCurNumber > 1 ){ 
       incidentCurNumber =incidentCurNumber - 1; 
       incident = incidents[incidentCurNumber - 1];
       incidentName =  incident.Name;
    }
    return ApexPages.currentPage();       
  }   
  public PageReference newIncident() {
    incident = new Incident__c(); 
    incident.Patient__c = patient.id;
    incident.Treatment__c = treatment.id;
    return ApexPages.currentPage();
  }   
  public PageReference saveIncident() { 
     Incident__c tempIncident;
     if ( incident.id == Null ){
        incident.Patient__c = patient.id;     
        insert incident ;
        incidents.add(incident);
        incidentTotCount = incidentTotCount + 1; 
        incidentCurNumber =  incidentCurNumber +1 ;      
        tempIncident = [select id, Name from  Incident__c where id = : incident.id ];
        incidentName =  tempIncident.Name;                          
     }else{     
        update incident ; 
     }  
     return ApexPages.currentPage();
  } 
  
  public PageReference nextPayment() {      
    if ( paymentCurNumber <= paymentTotCount ){ 
      paymentCurNumber = paymentCurNumber + 1; 
      payment = payments[quoteCurNumber - 1];
      paymentName =  payment.Name;
    }
    return ApexPages.currentPage();        
  }
  public PageReference previousPayment() {      
    if ( paymentCurNumber > 1 ){ 
       paymentCurNumber = paymentCurNumber - 1; 
       payment = payments[paymentCurNumber - 1];
       paymentName =  payment.Name;
    }
    return ApexPages.currentPage();        
  }     
  public PageReference newPayment() {
    payment= new Payment__c(); 
    payment.Patient__c = this.patient.id;
    payment.Treatment__c = this.treatment.id;
    return ApexPages.currentPage();
  }   
  public PageReference savePayment() { 
     Payment__c temppayment;
     if ( payment.id == Null ){
        payment.Patient__c = patient.id;   
        payment.Treatment__c = treatment.id;          
        insert payment;
        payments.add(payment);
        paymentTotCount = paymentTotCount + 1; 
        paymentCurNumber = paymentCurNumber + 1;        
        tempPayment = [select id, Name from  Payment__c where id = : payment.id ];
        paymentName =  tempPayment.Name;                          
     }else{     
        update payment ; 
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