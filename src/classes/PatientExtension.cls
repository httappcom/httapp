/**
* Name        : PatientExtension
* Description : To display Patient and Related data on Patient Tab
* CreatedBy   : Ramadevi Kanchadapu
*/ 
public class PatientExtension {
	PUBLIC STRING SURVEYURL {GET;SET;}
	public Boolean showLightbox {get;set;}
    public Patient__c patient { get; set; }
    public Treatment__c treatment { get; set; }
    public Payment__c payment { get; set; }      
    public Travel__c travel { get; set; }
    public List<Message__c> messages { get; set; }
    public List<Task> tasks { get; set; }
    public UILookup__c lookup { get; public set; }
 
//  public List<Medical_Profile__c> medProfiles { get; set; }
//  public Medical_Profile__c medProfile { get; set; }  
    public Treatment_Quote__c treatmentQuote { get; set; }
    public Incident__c incident { get; set; }
    public String emailType { get; set; }
    
    public List<SelectOption> taskOptions { get; set; }
    public List<SelectOption> onsiteCoordinators { get; set; }
    public String selectedTaskOption { get; set; }
    public ID treatmentId { get; public set; }
    public ID treatmentLastId { get; set; }
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
    public String quoteURL { get; private set; }
    public String itineraryURL { get; private set; }
    public String activeInteractionTab { get; public set; }
    public Procedure__c procedure { get; private set; }
    private Treatment__c treatmentWithChildren = null;
    public List<SelectOption> procedureList { get; private set; }
    public List<Treatment__c> treatments { get; private set; }
    private List<Payment__c> payments ;    
    private List<Incident__c> incidents ;
     
    public Medical_Profile_Header__c medicalProfile {get;set;}
    public list<Medical_Profile_Question__c> medicalProfileQuestions {get;set;} 
     
    public boolean showAdvocateInfo {get;set;}
    public boolean emailToPatient {get;set;}
    public boolean emailToOnsiteCoordinator {get;set;}
    public string additionalEmailRecipients {get;set;}
    public string emailError {get;set;}
    public boolean sendSuccess {get;set;}
            
    public PatientExtension(ApexPages.StandardController sc) {
		showLightbox = false;
        sendSuccess = false;
        Logger.info('Patient Constructor');
        this.initiatePatient();
        try {  
        if  (sc.getId() != null  ) {
            //this.patient = (Patient__c)sc.getRecord();
            this.patient = PatientUtil.queryPatientAll(sc.getId());
SURVEYURL = surveyGizmoAPI_Methods.generateMedicalProfileLink(Patient.Id); 
            showAdvocateInfo = (this.patient.Advocate_Name__c != null)?true:false;
            if (this.patient != null) {
            treatmentId = patient.Treatments__r.size()==0 ? null : patient.Treatments__r[0].id;
  Logger.info('Treatments exist');
            loadTreatments();
  Logger.info('treatments='+treatments);
            setTreatmentInfo();
            queryMedicalProfile();
            if ( patient.Payments__r.size() > 0 ) {
                paymentCurNumber = 1;
                this.paymentTotCount = patient.Payments__r.size() ; 
                this.payments= patient.Payments__r ;  
                this.payments.sort();
                this.payment = payments[0] ;        
            }
            if ( treatment != null ) {
                if ( treatment.Incidents__r.size() > 0 ) {
                    incidentCurNumber = 1;
                    this.incidentTotCount = treatment.Incidents__r.size() ; 
                    this.incidents= treatment.Incidents__r ;  
                    this.incidents.sort();
                    this.incident = incidents[0] ;        
                }
                if ( treatment.Incidents__r.size() > 0 ) this.incident = treatment.incidents__r[0];
  Logger.info('quotes='+treatment.Treatment_Quotes__r);
            }
            if ( patient.Tasks.size() > 0 ) this.tasks = patient.tasks;  

            searchTask();                                                   
        } 
        }
        if (patient == null) this.patient = new Patient__c ();
        if (treatment == null) initiateTreatment();                 
        setInitialViewState();
        } catch(Exception e){
   Logger.info(e.getStackTraceString());
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
            throw e;
        }
        if (incident == null) newIncident();
    }  
  private void initiatePatient() {
    this.inquiryFlag = true;
    this.interactionFlag = false;
    this.travelFlag = false;
    this.postopFlag = false;
    this.tasks = new List<Task> ();
    this.messages = new List<Message__c> ();
    this.selectedTaskOption = 'All Open';
    this.taskOptions = new List<SelectOption>();
    this.taskOptions.add(new SelectOption('All Open', 'All Open'));
    this.taskOptions.add(new SelectOption('All Closed', 'All Closed'));
    this.taskOptions.add(new SelectOption('My Open', 'My Open'));
    this.taskOptions.add(new SelectOption('My Closed', 'My Closed'));        
  } 
  
    private void initiateTreatment() {
        this.treatment = new Treatment__c (Phase__c = '(1) Inquiry', Stage__c = 'New');
        treatmentId = null;
        this.travel = new  Travel__c();
   Logger.info('travel set to blank object');
        this.payment = new Payment__c();
        this.payments = new List<Payment__c> ();  
//      this.medProfiles = new List<Medical_Profile__c>  ();
//      this.medProfile = new Medical_Profile__c (); 
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
    if ( patient.id == null ){
      insert patient;
    } else {              
      update patient;  
    }
    
SURVEYURL = surveyGizmoAPI_Methods.generateMedicalProfileLink(Patient.Id);  
    
    return ApexPages.currentPage();
  } 
	public PageReference toggleLightBox(){
		showLightbox = !showLightbox;
		return null;
	}
  
  public PageReference newPatient() {
    initiatePatient();
    return ApexPages.currentPage();  
  }
    public PageReference newTreatment() {
        initiateTreatment();
        return null;  
    }
    public PageReference cancelTreatment() {
        treatmentId = treatmentLastId;
        setTreatmentInfo();
        return null;
        
    }
    public PageReference saveTreatment() {
Logger.info('saveTreatment');
      if (treatment.Sub_Stage__c == 'Quote Complete - Send to Echosign')
      {     
        Logger.info('treatmentQuote.id=' + treatmentQuote.id);
        try 
        {
            Treatment_Quote__c tempTreatmentQuote = [select id, echosignDocKey__c from  Treatment_Quote__c where Id = : treatmentQuote.id ];
          Logger.info('tempTreatmentQuote.echosignDocKey__c = ' + tempTreatmentQuote.echosignDocKey__c);        
          if ( tempTreatmentQuote.echosignDocKey__c == null)
            { 
              sendQuoteToEchosign();
            }
        }
        catch (Exception e)
        {
          Logger.info(e.getStackTraceString());
          ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
          throw e;
        }
      }
        try {
            savePatient();
   Logger.info('saveTreatment travel='+travel);
            saveTravel();
            treatment.Travel__c = travel.id;
   Logger.info('treatment.Travel='+treatment.Travel__c);   
            if ( treatment.id == null ) {
                treatment.Patient__c = patient.id;    
                insert treatment;
                treatmentId = treatment.id;
  Logger.info('Inserted Treatment id='+treatmentId);
                loadTreatments();
                setTreatmentInfo();
                treatmentLastid = treatmentId;
  Logger.info('Treatment.id='+treatment.id);
            } else {
  Logger.info('Updating Treatment...');
                update treatment; 
            }
        } catch (DmlException dmlEx) {
            addError(dmlEx);
            throw dmlEx;
        }
        return null;
    }
    
    public pagereference saveTravel() {
        if (travel.id == null) {
            insert travel;
        } else {
            update travel;
        }
        return null;
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
    private void setTreatmentInfo() {
        treatment = treatmentId == null? null : treatmentMap.get(treatmentId);
        if (treatment == null) return;
        treatmentWithChildren = treatmentMap==null?null:treatmentMap.get( treatmentId );
        this.travel = treatment.Travel__c==null?(new Travel__c()): treatment.Travel__r;
  Logger.info('setTreatmentInfo travel='+travel);
        setQuoteInfo();
        loadProcedureList();
        incidents = treatmentWithChildren.Incidents__r;
    }
    
    public PageReference setTreatment() {
 Logger.info('setTreatment id='+treatmentId);
        setTreatmentInfo();
        return null;        
    }
        public PageReference setTreatment(string jsTreatmentID) { //overloaded to accepted treatment id as param from treatment list js
 Logger.info('setTreatment id='+jstreatmentId);
        treatmentID = jsTreatmentID;
        setTreatmentInfo();
        return null;        
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
     
    private void newQuote() {
        if (treatment.id == null) saveTreatment();
        treatmentQuote = new Treatment_Quote__c(Treatment__c = treatment.id);
        procedure = null;
        treatmentQuote.Departure_Date__c = treatment.Preferred_Travel_Date_To__c;
        treatmentQuote.Arrival_Date__c = treatment.Preferred_Travel_Date_From__c;
    }
    
    public PageReference saveQuote() {
		Logger.info('saveQuote='+treatmentQuote);
        if (treatmentQuote == null) newQuote();
        if (treatmentQuote.Treatment__c==null) {
			Logger.info('treatmentQuote.Treatment= null');
			saveTreatment();
			treatmentQuote.Treatment__c = treatment.id;
		}
		if ( treatmentQuote.id == null ) {
			Logger.info('Inserting treatmentQuote='+treatmentQuote);
			insert treatmentQuote ;
//        treatmentQuotes.add(treatmentQuote);
//        quoteTotCount = quoteTotCount + 1; 
//        quoteCurNumber =  quoteCurNumber +1 ;      
//        tempQuote = [select id, Name from  Treatment_Quote__c where id = : treatmentQuote.id ];
//        quoteName =  tempQuote.Name;                          
		} else {
			Logger.info('Updating treatmentQuote='+treatmentQuote);
			update treatmentQuote;
		}
//      setQuoteInfo();
		return null;
	}

	public PageReference checkOnEchoSign()
    {
        if ( (treatment.Sub_Stage__c == 'Quote In Process') )
          
          {
            Treatment_Quote__c currentQuote =  [SELECT Id, Treatment__c, echosignDocKey__c,  Doc_Signed_Timestamp__c 
                                                FROM  Treatment_Quote__c WHERE Treatment__c = :treatment.Id ORDER BY CreatedDate DESC LIMIT 1 ];                                          
             if (currentQuote.Doc_Signed_Timestamp__c == null)
              {
                QuoteUtility.pollEchoSignDocInfo(treatment, currentQuote);
              }
          }
         return null;
    }
  public PageReference sendQuoteToEchosign()
  {
    QuoteUtility.sendQuoteToEchosign(treatment);
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
    if (incidentTotCount==null) incidentTotCount = 0;
    if (incidentCurNumber ==null) incidentCurNumber=0;
    if (incidents == null) incidents = new list<Incident__c>();
    return ApexPages.currentPage();
  }   
  public PageReference saveIncident() { 
/*     Incident__c tempIncident;
     if ( this.incident.id == Null ){
        if (treatment.id == null) saveTreatment();
        incident.Treatment__c = treatment.id;     
        insert incident ;
        incidents.add(incident);
        incidentTotCount = incidentTotCount + 1; 
        incidentCurNumber =  incidentCurNumber +1 ;      
        tempIncident = [select id, Name from  Incident__c where id = : incident.id ];
        incidentName =  tempIncident.Name;                          
     }else{     
        update incident ; 
     }*/  
     return ApexPages.currentPage();
  }   
  public PageReference nextPayment() {      
/*    if ( paymentCurNumber <= paymentTotCount ){ 
      paymentCurNumber = paymentCurNumber + 1; 
      payment = payments[paymentCurNumber - 1];
      paymentName =  payment.Name;
    }*/
    return ApexPages.currentPage();        
  }
  public PageReference previousPayment() {      
/*    if ( paymentCurNumber > 1 ){ 
       paymentCurNumber = paymentCurNumber - 1; 
       payment = payments[paymentCurNumber - 1];
       paymentName =  payment.Name;
    }*/
    return ApexPages.currentPage();        
  }     
  public PageReference newPayment() {
/*    payment= new Payment__c(); 
    payment.Patient__c = this.patient.id;
    payment.Treatment__c = this.treatment.id;*/
    return ApexPages.currentPage();
  }   
  public PageReference savePayment() { 
/*     Payment__c temppayment;
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
     }*/  
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

    public PageReference displayInquiry(){
        inquiryFlag = true;
        interactionFlag = false;
        travelFlag = false;
        postopFlag = false;
        calcEmailType();
        return null;
    }
    public PageReference displayInteraction(){
        inquiryFlag = false;
        interactionFlag = true;
        travelFlag = false;
        postopFlag = false;
        calcEmailType();
        setInteractionState();
        return null;
    }   
    public PageReference displayTravel(){
        inquiryFlag = false;
        interactionFlag = false;
        travelFlag = true;
        postopFlag = false;
        calcEmailType();
        return null;
    }
    public PageReference displayPostOp(){
        inquiryFlag = false;
        interactionFlag = false;
        travelFlag = false;
        postopFlag = true;
        calcEmailType();
        return null;
    }
  public void displayQuotes(){
    loadProcedureList();
    setQuoteInfo();
  }    
  
  public void searchTask(){
    Id currentUserId =   UserInfo.getUserId();
    this.tasks = new List<Task>();
        
//    try {
         
 Logger.info('searchTask option='+selectedTaskOption);
 Logger.info('tasks='+this.patient.Tasks);
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
/*    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
    }*/
  }
    public PageReference changeViewState() {
        this.setInitialViewState();
        return null;
    }
  public PageReference changeProcedureSubCategory() {
  Logger.info('changeProcedureSubCategory');
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
        treatmentQuote.Sub_Total__c = procedure.Price__c;
    }
    return null;
  }
  private void loadProcedure(ID procedureId) {
 Logger.info('Load Procedure');
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
    onsiteCoordinators = new List<SelectOption>();
    if (procedures.size()>0) {
        procedure = procedures[0];
 Logger.info('procedure='+procedure);
    } else {
        procedure = null;
    }
    if (treatment.Destination_Facility__c == null) {
        PRM_User__c[] prmUsers = [select User__c, User__r.Name from PRM_User__c  where
            Role__c in ('Primary Onsite Coordinator', 'Onsite Coordinator')];
Logger.info('Med Fac Users='+prmUsers);
        for (PRM_User__c user : prmUsers) {
            onsiteCoordinators.add(new SelectOption(user.User__c, user.User__r.Name));
        }
    } else {
        Medical_Facility_User__c[] medFacUsers = [select User__c, User__r.Name from Medical_Facility_User__c 
            where Medical_Facility__c = :treatment.Destination_Facility__c and 
            Role__c in ('Primary Onsite Coordinator', 'Onsite Coordinator')];
Logger.info('Med Fac Users='+medFacUsers);
        for (Medical_Facility_User__c user : medFacUsers) {
            onsiteCoordinators.add(new SelectOption(user.User__c, user.User__r.Name));
        }
	}
  }
  
    private void loadProcedureList() {
Logger.info('cat='+treatment.Procedure_Category__c+', subcat='+treatment.Procedure__c);
        procedureList = new List<SelectOption>();
        Procedure__c[] procs = [SELECT Name, Doctor__r.Last_Name__c, Facility__r.Name, Price__c FROM Procedure__c 
            where Procedure_Category__c = :treatment.Procedure_Category__c and Name = :treatment.Procedure__c
            order by Doctor__r.Last_Name__c, Facility__r.Name];
 Logger.info('proces='+procs);
        procedureList.add(new SelectOption('', ''));
        for (Procedure__c proc : procs) {
            procedureList.add(new SelectOption(proc.Id, proc.Doctor__r.Last_Name__c + ' / ' + proc.Facility__r.Name + ' / ' + proc.Price__c));
        }
    }
    
    private Map<ID, Treatment__c> treatmentMap = null;
    private void loadTreatments() {
    	system.debug('Patient id'+patient.id);
        treatments = PatientUtil.getTreatmentsWithChildren(patient.Id);
//        treatments = [select id, Preferred_Travel_Date_To__c, Preferred_Travel_Date_From__c, Procedure__c, Procedure_Category__c, Travel__c, Travel__r.Id from treatment__c where patient__c = :patient.id];
        system.debug(treatments);
        treatmentMap = new Map<ID, Treatment__c>();
        for (Treatment__c treatment : treatments) {
            treatmentMap.put(treatment.Id, treatment);
        }
    }

    private void addError( DmlException dmlEx) {
        addError(dmlEx.getDmlMessage(0));
    }
    
    private void addError( String msg ) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, msg));
    }
    
    public pagereference toggleAdvocateInfo() {
        showAdvocateInfo = (showAdvocateInfo==false)?true:false;
        patient.Advocate_Email__c = (patient.Advocate_Email__c==null)?patient.Email__c:patient.Advocate_Email__c;
        patient.Advocate_Phone__c = (patient.Advocate_Phone__c==null)?patient.Phone__c:patient.Advocate_Phone__c;
        patient.Advocate_Name__c = (patient.Advocate_Name__c==null)?patient.Name:patient.Advocate_Name__c;
        return null;
    }
    
    public pagereference showEmailForm() {
        sendSuccess = false;
        calcEmailType();
        if (patient.id != null && treatments != null && treatments.size() > 0)
        saveQuote();
        emailToPatient = (patient.Email__c != null && patient.Email__c.trim().length() > 0)?true:false;
        emailToOnsiteCoordinator = (treatment.Onsite_Coordinator__r.Email != null && treatment.Onsite_Coordinator__r.Email.trim().length() > 0 )?true:false;
        additionalEmailRecipients = '';
        return null;
    }
    
    private void calcEmailType() {
        emailType = (interactionFlag==true)?'Quote':(travelFlag==true)?'Itinerary':'';
    }
    public pagereference sendEmail() {
        calcEmailType();
        //add patient and onsite emails if applicable
        list<string> toAddresses = new list<string>();
        if (additionalEmailRecipients != null && additionalEmailRecipients.trim().length() > 0){
            if (additionalEmailRecipients.indexof(',') > 0) {
                toAddresses = additionalEmailRecipients.split(',');
            }
            else{
                toAddresses.add(additionalEmailRecipients);
            }
        }
        if (emailToPatient==true) {
            toAddresses.add(patient.email__c);
        }
        if (emailToOnsiteCoordinator==true){
            toAddresses.add(Treatmentquote.Treatment__r.Onsite_Coordinator__r.Email);
        }
        
        emailError = '';
        //verify all additional recipients and add if pass; return error otherwise
        for (string email : toAddresses) {
            boolean valid = validateEmail(email.trim());
            if (valid == false){
                emailError = email + ' is not a valid email address.';//return error message about invalid email
                return null;
            }
            email = email.trim();
        }
            
        //Email constructors
        if (toAddresses.size() > 10) {
            emailError = 'Cannot exceed 10 recipients, including the patient and onsite coordinator.';//return error for exceeding limit
            return null;
        }
        else if (toAddresses.size() == 0) {
            emailError = 'Must specify at least 1 recipient.';//return error for no to address.
            return null;
        }
        Messaging.reserveSingleEmailCapacity(toAddresses.size());
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        EmailTemplate[] tmpls = [select Body from EmailTemplate where DeveloperName = 'Your_Travel_Itinerary_is_Ready'];
Logger.info('tmpls='+tmpls);
        String body = tmpls[0].body.replace('{!Patient__c.Name}', patient.Name);
        msg.setPlainTextBody(body);
        Pagereference PDF;
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();    
        
        if (emailType == 'Itinerary') {
            pdf = Page.travelItineraryPDF;
            pdf.getparameters().put('id',treatmentquote.id);
            efa.setFileName('Travel_Itinerary.pdf'); 
            // use template "Your Travel Itinerary is Ready"
        }
        else if (emailType == 'Quote') {
            pdf = Page.Quote;
            pdf.getparameters().put('id',treatmentquote.id);
            efa.setFileName('Treatment_Quote.pdf'); 
            //use template ????
        }       
        
        pdf.setRedirect(true);
        efa.setBody(pdf.getContent()); //attach the PDF  
        
        msg.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        msg.setBccSender(false);
        msg.setUseSignature(false);
        msg.setReplyTo('noreply@htt.com');
        msg.setSenderDisplayName('Mike Test');
        msg.setToAddresses(toAddresses);
        system.debug('To Addresses: '+toAddresses);
        //process email into template and mail 
        try {
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { msg });
            sendSuccess = true;
            emailToPatient = (patient.Email__c != null && patient.Email__c.trim().length() > 0)?true:false;
            emailToOnsiteCoordinator = (Treatmentquote.Treatment__r.Onsite_Coordinator__r.Email != null && Treatmentquote.Treatment__r.Onsite_Coordinator__r.Email.trim().length() > 0 )?true:false;
            additionalEmailRecipients = '';
        }
        catch (exception e){
            emailError = 'There was an error sending the email.';
            sendSuccess = false;
        }
        return null;
    }
    
    public static Boolean validateEmail(string email) {
        if ( email != null ) {
            String pat = '[a-zA-Z0-9\\.\\!\\#\\$\\%\\&\\*\\/\\=\\?\\^\\_\\+\\-\\`\\{\\|\\}\\~\'._%+-]+@[a-zA-Z0-9\\-.-]+\\.[a-zA-Z]+';
            Boolean test = Pattern.matches(pat, email);
            return test;
        } 
        else {
            return false;
        }
    }
    
    public pagereference retrieveMedicalProfile () {
        surveyGizmoAPI_Methods.retrieveMedicalProfile(this.patient.id);
        this.patient = PatientUtil.queryPatientAll(this.patient.id);
        queryMedicalProfile();
        return null;
    }
    
    public void queryMedicalProfile() {
        if ( patient.Survey_Headers__r.size() > 0 ){
             medicalProfile = patient.Survey_Headers__r[0];
             medicalProfileQuestions = patientUtil.queryMedicalProfileQuestions(medicalProfile.id);
        }
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
    pe.displayQuotes();  
    pe.selectedTaskOption = 'All Closed';
    pe.searchTask();
  } 
  
  public static void testEmailSend() {
     Messaging.SingleEmailMessage mail = 
            new Messaging.SingleEmailMessage();
 
// Who you are sending the email to
//   mail.setTargetObjectId(recipient);
   mail.setToAddresses(new List<String>{'richjvann@gmail.com', 'rich@healthtraveltechnologies.com'});

   // The email template ID used for the email
   mail.setTemplateId('00Xd0000000WwaSEAS');
          
   mail.setWhatId('a08d000000I542T');    
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setReplyTo('richjvann@gmail.com');
   mail.setSenderDisplayName('Rich Test');
   mail.setSaveAsActivity(false);  
 
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    
  }      
}