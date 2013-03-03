/**
* Name        : PatientExtension
* Description : To display Patient and Related data on Patient Tab
* CreatedBy   : Ramadevi Kanchadapu
*/ 
public class PatientExtension {
	PUBLIC STRING SURVEYURL {GET;SET;}
	public Boolean showLightbox {get;set;}
    public Patient__c patient { get; set; }
    public ID MedicalProfileId { get; set; }
    public Treatment__c treatment { get; set; }
    public Travel__c travel { get; set; }
    public List<Task> tasks { get; set; }
    public UILookup__c lookup { get; public set; }
 
    public Treatment_Quote__c treatmentQuote { get; set; }
    
    public String getDoctorPortalURL() {
    	if (treatment.Treatment_Quotes__r.size()>0 && treatment.Treatment_Quotes__r[0].Procedure__r != null &&
            	treatment.Treatment_Quotes__r[0].Procedure__r.Doctor__c != null &&
            		treatment.Treatment_Quotes__r[0].Procedure__r.Doctor__r.Key_Contact__c != null) {
    		ID doctorUserId = doctorContactToUserMap.get(treatment.Treatment_Quotes__r[0].Procedure__r.Doctor__r.Key_Contact__c);
    		if (doctorUserId != null) {
		    	PageReference pr = Page.DoctorPortal;
    			pr.getParameters().put('docUserId', doctorUserId);
    			return pr.getUrl();
    		}
		}
    	return null;
    }
    public String getPatientPortalURL() {
    	PageReference pr = Page.patientPortal;
    	pr.getParameters().put('devPatId', patient.id);
    	return pr.getUrl();
    }
    public String emailType { get; set; }
    
    public List<SelectOption> taskOptions { get; set; }
    public List<SelectOption> onsiteCoordinators { get; set; }
    public List<SelectOption> insuranceNetworkContacts {get; private set;}
    public String selectedTaskOption { get; set; }
    public ID treatmentId { get; public set; }
    public ID treatmentLastId { get; set; }
    public Boolean inquiryFlag { get; set; }     
    public Boolean interactionFlag { get; set; }    
    public Boolean travelFlag { get; set; }
    public Boolean postopFlag { get; set; }
    public Boolean isNewTreatment { get; private set; }
    public String quoteURL { get; private set; }
    public String itineraryURL { get; private set; }
    public String activeInteractionTab { get; public set; }
    public Procedure__c procedure { get; private set; }
    private Treatment__c treatmentWithChildren = null;
    public List<SelectOption> procedureList { get; private set; }
    public List<Treatment__c> treatments { get; private set; }
     
    public boolean showAdvocateInfo {get;set;}
    public boolean emailToPatient {get;set;}
    public boolean emailToOnsiteCoordinator {get;set;}
    public string additionalEmailRecipients {get;set;}
    public string emailError {get;set;}
    public boolean sendSuccess {get;set;}
    
    public Boolean getCanEditQuote() {
    	return treatment != null &&
    		treatment.Quote_Status__c != PickListDefines.QuoteStatus.Signed &&
    		treatment.Quote_Status__c != PickListDefines.QuoteStatus.Complete &&
    		treatment.Quote_Status__c != PickListDefines.QuoteStatus.Rejected;
    }

    public PatientExtension(ApexPages.StandardController sc) {
    	isNewTreatment = false;
        needTreatmentUpdate = false;
		showLightbox = false;
        sendSuccess = false;
        this.initiatePatient();
        try {  
        if  (sc.getId() != null  ) {
            //this.patient = (Patient__c)sc.getRecord();
            this.patient = PatientUtil.queryPatientAll(sc.getId());
            loadNetworkContactsList();
			SURVEYURL = surveyGizmoUtil.generateMedicalProfileLink(Patient.Id); 
            showAdvocateInfo = (this.patient.Advocate_Name__c != null)?true:false;
            if (this.patient != null) {
            	treatmentId = patient.Treatments__r.size()==0 ? null : patient.Treatments__r[0].id;
           	 loadTreatments();
            	setTreatmentInfo();
            	queryMedicalProfile();
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
    }  
  private void initiatePatient() {
    this.inquiryFlag = true;
    this.interactionFlag = false;
    this.travelFlag = false;
    this.postopFlag = false;
    this.tasks = new List<Task> ();
    this.selectedTaskOption = 'All Open';
    this.taskOptions = new List<SelectOption>();
    this.taskOptions.add(new SelectOption('All Open', 'All Open'));
    this.taskOptions.add(new SelectOption('All Closed', 'All Closed'));
    this.taskOptions.add(new SelectOption('My Open', 'My Open'));
    this.taskOptions.add(new SelectOption('My Closed', 'My Closed'));        
  } 
  
    private void initiateTreatment() {
        this.treatment = new Treatment__c (
        	Phase__c = PickListDefines.Phase.Inquiry, 
        	Stage__c = PickListDefines.Stage.Initial
        	);
        treatmentId = null;
        this.travel = new  Travel__c();
        this.treatmentQuote = new Treatment_Quote__c ();
        this.procedure = null;
    }
	private void savePatient() {
    	if ( patient.id == null ) {
			insert patient;
    	} else {
      		update patient;  
    	}
  	}

	public PageReference toggleLightBox(){
		showLightbox = !showLightbox;
		return null;
	}

	public PageReference quoteCompleted() {
		treatment.Quote_Status__c = 'Quote Complete';
		saveTreatment();
		needTreatmentUpdate = true;
		return null;
	}
	public PageReference reviseQuote() {
		treatment.Quote_Status__c = 'Revising Quote';
		treatmentQuote.echosignDocKey__c = null;
		treatmentQuote.Doc_Signed_Timestamp__c = null;
		saveQuote();
		needTreatmentUpdate = true;
		return null;
	}
	public PageReference insuranceNetworkChanged() {
system.debug('insuranceNetworkId='+patient.Insurance_Network__c);
        loadNetworkContactsList();
        return null;
	}
    public PageReference newTreatment() {
    	isNewTreatment = true;
        initiateTreatment();
        return null;  
    }
    public PageReference cancelTreatment() {
        treatmentId = treatmentLastId;
    	isNewTreatment = false;
        setTreatmentInfo();
        return null;
        
    }
    public PageReference saveTreatment() {
    	isNewTreatment = false;
Logger.info('saveTreatment');
		boolean ok = true;
		if (treatment.Approval_State__c == PickListDefines.ApprovalState.Approved) {
			needTreatmentUpdate = true;	
		}

		try {
			if (treatment.Quote_Status__c == PickListDefines.QuoteStatus.Complete) {
	
	            Treatment_Quote__c tempTreatmentQuote = [select id, echosignDocKey__c from  Treatment_Quote__c where Id = : treatmentQuote.id ];
          		if ( tempTreatmentQuote.echosignDocKey__c == null) { 
            		sendQuoteToEchosign();
            	}
        	}
		} catch (Exception e) {
			addError(e.getMessage());
			return null;
		}
		Savepoint sp = Database.setSavepoint();
		try {
            savePatient();
            saveTravel();
            treatment.Travel__c = travel.id;
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
			Database.rollback(sp);
            addError(dmlEx);
        } catch (NueException ex) {
			Database.rollback(sp);
            addError(ex.getMessage());
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
    
    private void setTreatmentInfo() {
        treatment = treatmentId == null? null : treatmentMap.get(treatmentId);
        if (treatment == null) return;
        treatmentWithChildren = treatmentMap==null?null:treatmentMap.get( treatmentId );
        this.travel = treatment.Travel__c==null?(new Travel__c()): treatment.Travel__r;
        setQuoteInfo();
        loadProcedureList();
        loadOnsiteCoordinators();
    }
    
    public PageReference setTreatment() {
 Logger.info('setTreatment id='+treatmentId);
        setTreatmentInfo();
        return null;        
    }
    private void setQuoteInfo() {
        if ( treatmentWithChildren != null && treatmentWithChildren.Treatment_Quotes__r.size() > 0 ) {
            treatmentQuote = treatmentWithChildren.Treatment_Quotes__r[0];
        } else {
            newQuote();
        }
        procedure = treatmentQuote.Procedure__r;
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
        if (treatmentQuote == null) newQuote();
        if (treatment.Payment_Type__c != null)
        {
        if (treatmentQuote.Treatment__c==null) {
			saveTreatment();
			treatmentQuote.Treatment__c = treatment.id;
		}
		if ( treatmentQuote.id == null ) {
			insert treatmentQuote ;
//        treatmentQuotes.add(treatmentQuote);
//        quoteTotCount = quoteTotCount + 1; 
//        quoteCurNumber =  quoteCurNumber +1 ;      
//        tempQuote = [select id, Name from  Treatment_Quote__c where id = : treatmentQuote.id ];
//        quoteName =  tempQuote.Name;                          
		} else {
			update treatmentQuote;
			saveTreatment();
		}
//      setQuoteInfo();
        }
		return null;
	}

	public PageReference medInfoIndicatorChanged() {
		saveTreatment();
		needTreatmentUpdate = true;
		return null;
	}
	public Boolean needTreatmentUpdate {get;private set;}
	public PageReference updateTreatment() {
        loadTreatments();
        setTreatmentInfo();
        needTreatmentUpdate = false;
        return null;
	}
	public PageReference checkOnEchoSign()
    {
        if ( (treatment.Quote_Status__c == PickListDefines.QuoteStatus.AwaitingSignature) )
          
          {
            Treatment_Quote__c currentQuote =  [SELECT Id, Treatment__c, echosignDocKey__c,  Doc_Signed_Timestamp__c 
                                                FROM  Treatment_Quote__c WHERE Treatment__c = :treatment.Id ORDER BY CreatedDate DESC LIMIT 1 ];                                          
             if (currentQuote.Doc_Signed_Timestamp__c == null) {
                QuoteUtility.pollEchoSignDocInfo(treatment, currentQuote);
              }
          }
         return null;
    }
  public PageReference sendQuoteToEchosign() {
    QuoteUtility.sendQuoteToEchosign(treatment);
//  QuoteUtility.debugDocQuery();
    return null;
  }

    private void setInitialViewState() {
        if (treatment == null) return;
        if (treatment.Phase__c == PickListDefines.Phase.Inquiry) {
            displayInquiry();
        } else if (treatment.Phase__c == PickListDefines.Phase.Interaction) {
            displayInteraction();
            if (treatment.Stage__c == PickListDefines.Stage.Quoting) {
                displayQuotes();
            }
        } else if (treatment.Phase__c == PickListDefines.Phase.Travel) {
            displayTravel();
        } else if (treatment.Phase__c == PickListDefines.Phase.PostOp) {
            displayPostOp();
        }
    }
    
    private void setInteractionState() {
        if (treatment.Stage__c == PickListDefines.Stage.Quoting) {
            activeInteractionTab = 'Quotes';
            displayQuotes();
        } else {
            activeInteractionTab = 'Medical Information';
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
  
  private void loadOnsiteCoordinators() {
    onsiteCoordinators = new List<SelectOption>();
    if (treatment.Destination_Facility__c == null) {
        PRM_User__c[] prmUsers = [select User__c, User__r.Name from PRM_User__c  where
            Role__c in ('Primary Onsite Coordinator', 'Onsite Coordinator')];
        for (PRM_User__c user : prmUsers) {
            onsiteCoordinators.add(new SelectOption(user.User__c, user.User__r.Name));
        }
    } else {
        Medical_Facility_User__c[] medFacUsers = [select User__c, User__r.Name from Medical_Facility_User__c 
            where Medical_Facility__c = :treatment.Destination_Facility__c and 
            Role__c in ('Primary Onsite Coordinator', 'Onsite Coordinator')];
        for (Medical_Facility_User__c user : medFacUsers) {
            onsiteCoordinators.add(new SelectOption(user.User__c, user.User__r.Name));
        }
	}
  }
  
    private void loadProcedureList() {
        procedureList = new List<SelectOption>();
        Procedure__c[] procs = [SELECT Name, Doctor__r.Last_Name__c, Facility__r.Name, Price__c FROM Procedure__c 
            where Procedure_Category__c = :treatment.Procedure_Category__c and Name = :treatment.Procedure__c
            order by Doctor__r.Last_Name__c, Facility__r.Name];
        procedureList.add(new SelectOption('', ''));
        for (Procedure__c proc : procs) {
            procedureList.add(new SelectOption(proc.Id, proc.Doctor__r.Last_Name__c + ' / ' + proc.Facility__r.Name + ' / ' + proc.Price__c));
        }
    }
    
    private Map<ID, Treatment__c> treatmentMap = null;
    private Map<ID, ID> doctorContactToUserMap = null;
    private void loadTreatments() {
        treatments = PatientUtil.getTreatmentsWithChildren(patient.Id);
//        treatments = [select id, Preferred_Travel_Date_To__c, Preferred_Travel_Date_From__c, Procedure__c, Procedure_Category__c, Travel__c, Travel__r.Id from treatment__c where patient__c = :patient.id];
        treatmentMap = new Map<ID, Treatment__c>();
        Set<ID> doctorContactIds = new Set<ID>();
        for (Treatment__c treatment : treatments) {
            treatmentMap.put(treatment.Id, treatment);
            if (treatment.Treatment_Quotes__r.size()>0 && treatment.Treatment_Quotes__r[0].Procedure__r != null &&
            	treatment.Treatment_Quotes__r[0].Procedure__r.Doctor__c != null) {
            	doctorContactIds.add(treatment.Treatment_Quotes__r[0].Procedure__r.Doctor__r.Key_Contact__c);
            }
        }
        User[] doctorUsers = [select id, contactId from User where contactId in :doctorContactIds];
        doctorContactToUserMap = new map<ID, ID>();
        for (User doctorUser : doctorUsers) {
        	doctorContactToUserMap.put(doctorUser.contactId, doctorUser.id);
        }
    }
    private void loadNetworkContactsList() {
    	insuranceNetworkContacts = new List<SelectOption>();
    	List<Insurance_Network_User__c> users = PatientUtil.getInsuranceNetworkContacts( patient.Insurance_Network__c );
    	if (users != null && users.size()>0) {
    		for (Insurance_Network_User__c user : users) {
    			insuranceNetworkContacts.add(new SelectOption(user.Insurance_Contact__c, user.Insurance_Contact__r.Name));
    		}
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
    
/*    public pagereference showEmailForm() {
        sendSuccess = false;
        calcEmailType();
        if (patient.id != null && treatments != null && treatments.size() > 0)
        saveQuote();
        emailToPatient = (patient.Email__c != null && patient.Email__c.trim().length() > 0)?true:false;
        emailToOnsiteCoordinator = (treatment.Onsite_Coordinator__r.Email != null && treatment.Onsite_Coordinator__r.Email.trim().length() > 0 )?true:false;
        additionalEmailRecipients = '';
        return null;
    }*/
    
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
    	try {
	        String surveyId = surveyGizmoUtil.getSurveyId( patient.Medical_Profile_Type__r.name );
        	surveyGizmoUtil.retrieveSurvey(surveyId, this.patient.id, 'Patient');
    	} catch (Exception ex) {
    		addError(ex.getMessage());
    		return null;
    	}
        this.patient = PatientUtil.queryPatientAll(this.patient.id);
        queryMedicalProfile();
        PageReference pr = ApexPages.currentPage();
        pr.setRedirect(true);
        return pr;
    }
    
    public void queryMedicalProfile() {
        if ( patient.Survey_Headers__r.size() > 0 ){
        	MedicalProfileId = patient.Survey_Headers__r[0].Id;
        }
    }
    
  static testMethod void testPatientExtension(){
    Patient__c pat = new Patient__c();
    pat.name = 'Test';
    insert pat;
        
    Treatment__c t = new Treatment__c(Phase__c = PickListDefines.Phase.Inquiry, Stage__c = PickListDefines.Stage.Initial);
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