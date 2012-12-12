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
 	public integer treatmentCurNumber { get; set; }
 	public Integer treatmentTotCount { get; set; } 
  	public List<String> treatmentNames{ get; set; }   
/*  public integer quoteCurNumber { get; set; } 
  	public Integer quoteTotCount { get; set; } 
  	public String quoteName{ get; set; }*/
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
  	public String quoteURL { get; private set; }
  	public String itineraryURL { get; private set; }
  	public String activeInteractionTab { get; public set; }
  	public Procedure__c procedure { get; private set; }
   	private Treatment__c treatmentWithChildren = null;
  	public List<SelectOption> procedureList { get; private set; }
  	public List<Treatment__c> treatments { get; private set; }
  	private List<Payment__c> payments ;    
  	private List<Incident__c> incidents ;
//  private List<Treatment_Quote__c> treatmentQuotes ;
            
  	public PatientExtension(ApexPages.StandardController sc) {
  		Logger.info('Patient Constructor');
    	this.initiatePatient();
    	try {  
   		if  (sc.getId() != null  ) {
      		//this.patient = (Patient__c)sc.getRecord();
      		this.patient = PatientUtil.queryPatientAll(sc.getId());
      		if (this.patient != null) {
      		if ( patient.Treatments__r.size() > 0 ) {
  Logger.info('Treatments exist');         
        		treatmentCurNumber = 1;  
        		this.treatmentTotCount = patient.Treatments__r.size() ; 
        		this.treatments = patient.Treatments__r;
        		this.treatments.sort() ;
  Logger.info('treatments='+treatments);
        		for (Treatment__c t : this.treatments) {
            		this.treatmentNames.add(t.name);
  Logger.info('tName='+t.name);
        		}
        		setTreatmentInfo( 1 );
      		}
      		if ( patient.Medical_Profiles__r.size() > 0 ) this.medprofile = patient.Medical_Profiles__r[0];
      		if ( patient.Payments__r.size() > 0 ) {
 	       		paymentCurNumber = 1;
        		this.paymentTotCount = patient.Payments__r.size() ; 
        		this.payments= patient.Payments__r ;  
        		this.payments.sort();
        		this.payment = payments[0] ;        
      		}
      		if ( treatment.Incidents__r.size() > 0 ) {
        		incidentCurNumber = 1;
        		this.incidentTotCount = treatment.Incidents__r.size() ; 
        		this.incidents= treatment.Incidents__r ;  
        		this.incidents.sort();
        		this.incident = incidents[0] ;        
      		}
      		if ( patient.Tasks.size() > 0 ) this.tasks = patient.tasks;  
      		if ( treatment.Incidents__r.size() > 0 ) this.incident = treatment.incidents__r[0];
  Logger.info('quotes='+treatment.Treatment_Quotes__r);

      		searchTask();                                                   
      	} 
      	}        
      	setInitialViewState();
    	} catch(Exception e){
   Logger.info(e.getStackTraceString());
      		ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
      		throw e;
    	}
  	}  
  private void initiatePatient() {
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
  
  	private void initiateTreatment() {
    	this.treatment = new Treatment__c (Phase__c = '(1) Inquiry', Stage__c = 'New');  
    	this.travel = new  Travel__c ();
    	this.payment = new Payment__c ();
    	this.payments = new List<Payment__c> ();  
    	this.medProfiles = new List<Medical_Profile__c>  ();
    	this.medProfile = new Medical_Profile__c (); 
    	this.treatmentQuote = new Treatment_Quote__c ();
    	this.procedure = null;
    	this.incidents = new List<Incident__c> ();
    	this.incident = new Incident__c();      
//    this.quoteTotCount = 0;
//    this.quoteCurNumber = 0;    
    	this.paymentTotCount = 0;
    	this.paymentCurNumber = 0;
    	this.paymentName = '' ;
//    this.quoteName = ''  ; 
  }      
  public PageReference savePatient() {
  Logger.info('Save Patient');
    if ( patient.id == Null ){
      insert patient;
    } else {              
      update patient;  
    }      
    return ApexPages.currentPage();
  } 
  public PageReference newPatient() {
    initiatePatient();
    return ApexPages.currentPage();  
  }
  	public PageReference listTreatments() {
  		return null;
  	}
	public PageReference newTreatment() {
    	initiateTreatment();
    	return ApexPages.currentPage();  
  	}  
	public PageReference saveTreatment() {
    	Treatment__c tempTreatment;
    	try {
	    	if ( patient.id == null ) {
    	  		insert patient;
    		} else {
		      	update patient;  
    		}
	    	if ( treatment.id == null ) {
      			treatment.Patient__c = patient.id;    
      			insert treatment ;
	      		treatments.add(treatment);
			    treatmentTotCount = treatments.size() + 1;
      			treatmentCurNumber = treatmentCurNumber + 1;         
      			tempTreatment = [select id, Name from  Treatment__c where id = : treatment.id ];
    	  		treatmentNames.add(tempTreatment.Name) ;
    		} else {     
        		update treatment ; 
    		}
    	} catch (DmlException dmlEx) {
    		addError(dmlEx);
    	}
    	return null;
	}
	 
  public boolean hasNextTreatment { 
    get { 
      if (treatmentCurNumber >= treatments.size()) {
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
/*  public boolean hasNextQuote { 
    get { 
      if (treatmentQuotes==null || quoteCurNumber >= treatmentQuotes.size()) {
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
  }*/ 
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
 	private void setTreatmentInfo( Integer idx ) {
//    this.quoteCurNumber = 1;
    	if (idx<1 || idx > treatments.size()) {
        	treatment = null;
        	treatmentWithChildren = null;
        	return;
    	}
      	treatment = treatments[ idx-1 ];
      	treatmentWithChildren = PatientUtil.getTreatmentChildren( treatment.Id );
      	this.travel = treatment.Travel__r;  
      	setQuoteInfo();
      	loadProcedureList();
      	incidents = treatmentWithChildren.Incidents__r;
  	}
  public PageReference nextTreatments() {      
    if ( treatmentCurNumber <= treatmentTotCount ){ 
      treatmentCurNumber = treatmentCurNumber + 1;
      setTreatmentInfo( treatmentCurNumber -1 );
    }
    return ApexPages.currentPage();        
  }
  public PageReference previousTreatments() {      
    if ( treatmentCurNumber > 1 ){ 
       treatmentCurNumber = treatmentCurNumber - 1; 
      setTreatmentInfo( treatmentCurNumber -1 );
    }
    return ApexPages.currentPage();        
  }
	private void setQuoteInfo() {
		if ( treatmentWithChildren != null && treatmentWithChildren.Treatment_Quotes__r.size() > 0 ) {
			treatmentQuote = treatmentWithChildren.Treatment_Quotes__r[0];
     	} else {
  Logger.info('Creating new quote');
     		newQuote();
     	}
      	procedure = treatmentQuote.Procedure__r;
  Logger.info('setQUoteInfo proc='+procedure);
      	if (procedure != null) {
          	loadProcedure(procedure.Id);
      	}
      	PageReference pr=Page.Quote;
		pr.getParameters().put('id', treatmentQuote.id);
		quoteURL = pr.getUrl();
		
		pr = Page.travelitineraryPdf;
		pr.getParameters().put('id', treatmentQuote.id);
		itineraryURL = pr.getUrl();
  }
/*  public PageReference nextQuote() {      
    if ( quoteCurNumber <= quoteTotCount ){ 
      quoteCurNumber = quoteCurNumber + 1;
      setQuoteInfo( quoteCurNumber );
    }
    return null;        
  }
  public PageReference previousQuote() {      
    if ( quoteCurNumber > 1 ){ 
        quoteCurNumber =quoteCurNumber - 1; 
        setQuoteInfo( quoteCurNumber );
    }
    return null;       
  }*/
     
  	public PageReference newQuote() {
    	treatmentQuote = new Treatment_Quote__c(); 
    	treatmentQuote.Treatment__c = treatment.id;
    	procedure = null;
    	return null;
  	}
 	
 	public PageReference saveQuote() {
 	Logger.info('saveQuote='+treatmentQuote);
  		if (treatmentQuote == null) newQuote();
     	if ( treatmentQuote.id == null ) {
        	treatmentQuote.Treatment__c = treatment.id;     
        	insert treatmentQuote ;
//        treatmentQuotes.add(treatmentQuote);
//        quoteTotCount = quoteTotCount + 1; 
//        quoteCurNumber =  quoteCurNumber +1 ;      
//        tempQuote = [select id, Name from  Treatment_Quote__c where id = : treatmentQuote.id ];
//        quoteName =  tempQuote.Name;                          
     	} else {
        	update treatmentQuote;
     	}
     	setQuoteInfo();
     	return null;
  	}
  public PageReference sendQuoteToEchosign() {
  	
  	return null;
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
    incident.Treatment__c = treatment.id;
    return ApexPages.currentPage();
  }   
  public PageReference saveIncident() { 
     Incident__c tempIncident;
     if ( incident.id == Null ){
        incident.Treatment__c = treatment.id;     
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
      payment = payments[paymentCurNumber - 1];
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
	private void setInitialViewState() {
  		if (treatment == null) return;
  Logger.info('initViewState='+treatment.Phase__c);
  		if (treatment.Phase__c == '(1) Inquiry') {
  			displayInquiry();
  		} else if (treatment.Phase__c == '(2) Interaction') {
  			displayInteraction();
  			if (treatment.Stage__c == 'Treatment Approved/Quoting') {
  				displayQuotes();
  			}
  		} else if (treatment.Phase__c == '(3) Travel') {
  			displayTravel();
  		} else if (treatment.Phase__c == '(4) Post-Op') {
  			displayPostOp();
  		}
	}
	
	private void setInteractionState() {
		if (treatment.Stage__c == 'Treatment Approved/Quoting') {
			activeInteractionTab = 'Quotes';
			displayQuotes();
		} else {
			activeInteractionTab = 'Incidents';
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
    	setInteractionState();
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
    loadProcedureList();
    setQuoteInfo();
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
  	public PageReference changeViewState() {
  	    this.setInitialViewState();
  		return null;
  	}
  public PageReference changeProcedureSubCategory() {
    loadProcedureList();
    if (treatmentQuote.id == null) {
        treatmentQuote.Procedure__c = null;
        procedure = null;
    }
    this.setInitialViewState();
    return null;
  }
  public PageReference setProcedure() {
    loadProcedure( treatmentQuote.Procedure__c);
    if (procedure != null) {
        treatmentQuote.Number_of_Hospital_Nights__c = procedure.Hospital_Nights_Required__c;
        treatmentQuote.Hotel_Nights_Included__c = procedure.Hotel_Nights_Included__c;
        treatmentQuote.Hotel_Nights_Needed__c = procedure.Recovery_Nights_Required__c;
        treatmentQuote.Ground_Transportation_Included__c = procedure.Transportation_Included__c;
        PatientUtil.loadProcedurePrices( treatment );
        treatmentQuote.Sub_Total__c = PatientUtil.getProcedurePrice( procedure.id );
    }
    return null;
  }
  private void loadProcedure(ID procedureId) {
    if (procedureId == null) {
        procedure = null;
        return;
    }
    Procedure__c[] procedures = [SELECT 
    	Price__c,
        Comments__c,
        Details__c,
        Doctor__c,
        Facility__c,
        Hospital_Nights_Required__c,
        Hotel_Nights_Included__c,
        Procedure_Category__c,
        Recovery_Nights_Required__c,
        Transportation_Included__c
        FROM Procedure__c where id = :procedureId];
    if (procedures.size()>0) {
        procedure = procedures[0];
    } else {
        procedure = null;
    }
  }
  
	private void loadProcedureList() {
Logger.info('cat='+treatment.Procedure_Category__c+', subcat='+treatment.Procedure__c);
    	procedureList = new List<SelectOption>();
    	Procedure__c[] procs = [SELECT Name, Doctor__r.Name, Facility__r.Name, Price__c FROM Procedure__c 
        	where Procedure_Category__c = :treatment.Procedure_Category__c and Name = :treatment.Procedure__c
        	order by Doctor__r.Name, Facility__r.Name];
    	procedureList.add(new SelectOption('', ''));
    	for (Procedure__c proc : procs) {
        	procedureList.add(new SelectOption(proc.Id, proc.Doctor__r.Name + ' / ' + proc.Facility__r.Name + ' / ' + proc.Price__c));
    	}
  	}

	private void addError( DmlException dmlEx) {
       	addError(dmlEx.getDmlMessage(0));
	}
	
	private void addError( String msg ) {
       	ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, msg));
	}
  static testMethod void testPatientExtension(){
    Patient__c pat = new Patient__c();
    pat.name = 'Test';
    insert pat;
        
    Treatment__c t = new Treatment__c(Phase__c = '(1) Inquiry', Stage__c = 'New');
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