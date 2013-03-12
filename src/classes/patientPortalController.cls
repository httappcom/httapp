public without sharing class patientPortalController {

	public Attachment attachment {
  		get {
      		if (attachment == null) {
        		attachment = new Attachment();
      		}
      		return attachment;
    	}
  		set;
  	}
 
    public static String quotePdfURL = null;
    public static String itineraryPdfURL = null;
    static {
    	PageReference pr = Page.Quote;
        quotePdfURL = pr.getUrl();
        
        pr = Page.travelitineraryPdf;
        itineraryPdfURL = pr.getUrl();
    }
    public PRM_Config__c prmConfig { get; private set; }

    public string currentPage {get;set;}
    public Patient__c patient {get;set;}
    public string patientid {get;set;}
    public String surveyId {get; set; }
    public Boolean displaySurveyResults { get; private set; }
    public Boolean displayUploadPanel { get; private set; }

    public Id treatmentId {get;set;}
    public String getTravelPhase() {
    	return PickListDefines.Phase.Travel;
    }

    public list<TreatmentRow> treatmentList {get; private set;}
    public Medical_Facility__c destinationFacility {get; private set; }
    
    public class TreatmentRow {
    	public Treatment__c treatment {get; private set; }
    	public String quoteURL { get; private set; }
    	public String itineraryURL { get; private set; }
    	public TreatmentRow( Treatment__c treatment ) {
    		this.treatment = treatment;
    		if (treatment.treatment_quotes__r.size()>0) {
    			quoteURL = patientPortalController.quotePdfURL + '?id=' + treatment.treatment_quotes__r[0].id;
    			itineraryURL = patientPortalController.itineraryPdfURL + '?id=' + treatment.treatment_quotes__r[0].id;
    		}
    	}
    }
    
    public string selectedItinerary {get;set;}
    
    public patientPortalController () {
    	displayUploadPanel = false;
 system.debug('patientPortalController');
//        medicalRecords = new list<Medical_Profile__c>();
        loadPrmConfig();
 
        User u = [select id, contactid from User where id = :userinfo.getUserId()];
        
        list<Patient__c> plist = [select id 
                            from Patient__c 
                            where key_contact__c = :u.contactid
                            limit 1]; 
        
        currentPage='Home';
        if (apexPages.currentPage().getparameters().get('devPatID') != null) {
            patientid = apexPages.currentPage().getparameters().get('devPatID');
            load();
        } else if (plist != null && plist.size() > 0) {
            patientid = plist[0].id;
            load();
        } else currentPage ='Portal User Error'; 
        
    }
    
    public pagereference load() {
  system.debug('load');
        patient = queryPatientRelatedDesc(patientid);
        if ( patient.Treatments__r.size() > 0 ){
            treatmentId = patient.Treatments__r[0].Id;
        }
        loadTreatmentInfo();
        return null;
    }
    
    public PageReference showUploadPanel() {
    	displayUploadPanel = true;
    	return null;
    }
    public PageReference hideUploadPanel() {
    	displayUploadPanel = false;
    	return null;
    }
  	public PageReference upload() {
 system.debug('upload...');
 Logger.info('upload...');
 
	    attachment.OwnerId = UserInfo.getUserId();
    	attachment.ParentId = patient.id; // the record the file is attached to
    	attachment.IsPrivate = false;
 
    	try {
  system.debug('attachment='+attachment);
  Logger.info('attachment='+attachment);
      		insert attachment;
      		displayUploadPanel = false;
    	} catch (DMLException ex) {
   system.debug('dmlex='+ex);
      		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment:'+ex.getMessage()));
      		return null;
    	} catch (Exception e) {
   system.debug('ex='+e);
      		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,e.getMessage()));
      		return null;
    	} finally {
      		attachment = new Attachment(); 
    	}
 
    	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    	patient = queryPatientRelatedDesc(patientid);
    	return null;
  	}
  	
    public void loadTreatmentInfo() {
  system.debug('loadTreatmentInfo');
        treatmentList = new list<TreatmentRow>();
        Treatment__c[] treatments = queryTreatmentRelatedDesc(patient.treatments__r);
        for (Treatment__c treatment : treatments) {
        	treatmentList.add(new TreatmentRow(treatment));
        }
  system.debug('loadTreatmentInfo 2 prmConfig='+prmConfig);
        if (treatmentList.size()>0 && treatmentList[0].treatment.Destination_Facility__c != null && treatmentList[0].treatment.Destination_Facility__r.Patient_Portal_Banner_Image__c != null) {
        	destinationFacility = treatmentList[0].treatment.Destination_Facility__r;
  system.debug('loadTreatmentInfo 3');
        }
    }
    
    public PageReference showSurveyResults() {
    	displaySurveyResults = true;
    	return null;
    }
    public PageReference hideSurveyResults() {
    	displaySurveyResults = false;
    	return null;
    }
    public pagereference goToHome(){ 
        currentPage='Home';
        return null;
    }
    
    public pagereference goToMedicalRecords(){
        currentPage = 'Medical Records';
        return null;
    }
    
    public pagereference goToYourTravel () {
        currentPage = 'Your Travel';
        return null;
    }
    
    public pagereference goToYourTreatment (){
        currentPage = 'Your Treatment'; 
        return null;
    }

    public pagereference getItineraryPDF() {
system.debug('selectedItinerary='+selectedItinerary);
        Pagereference p = Page.travelItineraryPDF;
        p.getParameters().put('id',selectedItinerary);
        p.setRedirect(true);
        return p;
    }
    
    public Patient__c queryPatientRelatedDesc(string patientId) {
        return  [Select id, 
                       Name,
                       Owner.Name,
                       Advocate_Email__c,
                       Advocate_Name__c,
                       Advocate_Phone__c,
                       Alternate_Email__c,
                       City__c,
                       Country__c,
                       Date_of_Birth__c,
                       Email__c,
                       Gender__c,
                       Mobile__c,
                       Patient_Stage__c,
                       Phone__c,
                       Postal_Code__c,
                       Preferred_Language__c,
                       Salutation__c,
                       State__c,
                       Street__c,
                       Time_Zone__c,
                       Last_Communication__c,
                       Nationality__c,
                       Age__c,
                       Patient_First_Name__c,
                       Patient_Last_Name__c,
                       Key_Contact__c,
                       (select id, 
                               Name,
                               Additional_Amount__c,
                               Best_Time_to_Contact__c, 
                               Case_Manager_s_Feel__c,
                               Close_Date__c,
                               Decision_Timeframe__c,
                               Deposit_Required__c,
                               Financial_Reconciliation__c, 
                               Financing_Required__c,
                               Inquiry_Quality__c,
                               Inquiry_Source__c, 
                               On_Site_Recovery_Period__c,
                               Patient__r.Original_Number_Rank__c,
                               Patient__c,
                               Patient__r.Email__c,
                               Payment_Type__c, 
                               Phase__c,
                               Destination_Facility__c,
                               Preferred_Form_of_Contact__c, 
                               Preferred_Travel_Date_From__c,
                               Preferred_Travel_Date_To__c,
                               Procedure__c, 
                               Procedure_Category__c,
                               Procedure_Date__c,
                               Procedure_Treatment_Type__c,
                               Response_SLA__c, 
                               Stage__c,
                               Sub_Stage__c,
                               Quote_Status__c,
                               Patient_Not_Committed_Reason__c,
                               Patient__r.Name,
                               Request_Summary__c,
                               Next_Follow_Up__c,
                               Primary_Campaign__c,
                               Related_Campaign__c,
                               Treatment_Summary__c                                 
                       from Treatments__r
                       order by lastModifiedDate desc),
                       (select id,
                               Owner.Name,
                               CallDurationInSeconds,
                               CallObject,
                               CallDisposition,
                               CallType,
                               Description,
                               ActivityDate,
                               Who.Name,
                               Priority,
                               What.Name,
                               Status,
                               Subject
                       from Tasks
                       order by lastModifiedDate desc), 
                      (select Id,
                              Name,
                              Benefit_Percentage__c,
                              Claim_Address__c,
                              Co_pay__c,
                              Deductible__c,
                              IsDeleted,
                              Dependent_Coverage__c,
                              Effective_Date__c, 
                              Fax_Number_Medical_Reviews__c,
                              Group__c,
                              Insurance_Contact__c,
                              Name_of_Insurance__c,
                              Patient__c,
                              Payment_Type__c,
                              Policy_ID__c, 
                              Treatment__c,
                              Verification_Date__c,
                              Verification_Phone_Number__c 
                      from Payments__r
                      order by lastModifiedDate desc),
                      (select Id,
                              Name,
                              Patient__c,
                              Survey_Id__c
                      from Survey_Headers__r),
                      (SELECT Id, Description, Name, CreatedDate FROM Attachments order by name)
                from Patient__c 
                where id = :patientId];
    }
    
    public list<Treatment__c> queryTreatmentRelatedDesc(Treatment__c[] treatments) {
        return 
            [ Select    t.Treatment_Summary__c,
                        t.Travel__c,
                        t.Sub_Stage__c,
                        t.Quote_Status__c,
                        t.Stage__c,
                        t.Response_SLA__c,
                        t.Request_Summary__c,
                        t.Related_Campaign__c,
                        t.Procedure__c,
                        t.Procedure_Treatment_Type__c,
                        t.Procedure_Date__c,
                        t.Procedure_Category__c,
                        t.Primary_Campaign__c,
                        t.Preferred_Travel_Date_To__c,
                        t.Preferred_Travel_Date_From__c,
                        t.Preferred_Form_of_Contact__c,
                        t.Destination_Facility__c,
                        t.Destination_Facility__r.Patient_Portal_Banner_Image__c,
                        t.Phase__c,
                        t.Payment_Type__c,
                        t.Patient__c,
                        t.Patient_Not_Committed_Reason__c,
                        t.Patient_Email__c,
                        t.Patient_Email_Formula__c,
                        t.On_Site_Recovery_Period__c,
                        t.Active_Status__c,
                        t.Next_Follow_Up__c,
                        t.Name,
                        t.LastActivityDate,
                        t.IsDeleted,
                        t.Inquiry_Source__c,
                        t.Inquiry_Quality__c,
                        t.Id,
                        t.Financing_Required__c,
                        t.Financial_Reconciliation__c,
                        t.Final_Departure_Date__c,
                        t.Deposit_Required__c,
                        t.Decision_Timeframe__c,
                        t.Close_Date__c,
                        t.Case_Manager_s_Feel__c,
                        t.Best_Time_to_Contact__c,
                        t.Arrival_Time__c,
                        t.Amount__c,
                        t.Additional_Amount__c,
                            (Select tq.echosignDocKey__c,
                                    tq.Treatment__c,
                                    tq.Total_Price__c,
                                    tq.Syncing__c,
                                    tq.Sub_Total__c,
                                    tq.Procedure__c,
                                    tq.Number_of_Hospital_Nights__c,
                                    tq.Name,
                                    tq.IsDeleted,
                                    tq.Id,
                                    tq.Hotel_Nights_Needed__c,
                                    tq.Hotel_Nights_Included__c,
                                    tq.Ground_Transportation_Included__c,
                                    tq.Expiration_Date__c,
                                    tq.Discount_Amount__c,
                                    tq.Description__c,
                                    tq.Departure_Date__c,
                                    tq.Arrival_Date__c,
                                    tq.procedure__r.doctor__c,
                                    tq.procedure__r.facility__c 
                                From Treatment_Quotes__r tq
                                order by tq.lastmodifieddate desc)    
                    From Treatment__c t
                    where id
                    IN :treatments
                    order by t.Procedure_Date__c desc
            ];
    }
    public PageReference uploadDocument()
    {
        return null;
    }
    
    public List<Attachment> getMedicalRecords() {
        return patient.Attachments;
    }
    
    private void loadPrmConfig() {
 system.debug('loadPrmConfig');
        PRM_Config__c[] config = [select 
        	Patient_Portal_Banner_Image__c,
        	Patient_Portal_Welcome_Message__c,
        	Facilitator_Name__c, 
        	Patient_Portal_CSS__c 
        	from PRM_Config__c limit 1];
 system.debug('config='+config);
//Fix banner reference        
        prmConfig = config.size()==1? config[0] : new PRM_Config__c();
    }
    
    public PageReference portalTypeRedirect()
    {
    	Logger.info('Checking for redirect.');
    	Profile[] userProfile = [Select Id from Profile Where Name = 'providerPortal'];
    	if (userProfile.size() > 0)
    	{
    		Id profileId = userProfile[0].id;
    		if (UserInfo.getProfileId() == profileId)
    		{
	        PageReference providerPortalPage = new PageReference('/DoctorPortal');
	        providerPortalPage.setRedirect(true);
	        return providerPortalPage;    			
    		}
    	}
      return null;
    }
        
    @isTest (seealldata=true)
    public static void patientPortalTest (){
        User u = new User(
            lastname='test',
            alias='test',
            email='test@test.com',
            username='patientportal@test.com',
            CommunityNickname ='tester',
            timeZoneSidKey='America/Los_Angeles',
            localeSidKey='en_US',
            emailencodingkey='UTF-8',
            profileid=[select id from Profile limit 1].id,
            languagelocalekey='en_US'
            );
        insert u;
        
        Patient__c p = new Patient__c(name='testp');
        insert p;
        
        Travel__c testTravel = new Travel__c();
        insert testTravel;

        Treatment__c treatmentTest = new treatment__c();
        treatmentTest.Travel__c = testTravel.Id;
        insert treatmentTest;
        
        Treatment_Quote__c quoteTest = new Treatment_Quote__c();
        quoteTest.Treatment__c = treatmentTest.id;
        insert quoteTest;
                
        system.runAs(u) {
            Pagereference pg = Page.patientPortal;
            pg.getParameters().put('devPatID',p.id);
            test.setCurrentPage(pg);
            patientPortalController pcont = new patientPortalController();
            pcont.goToHome();
            pcont.goToMedicalRecords();
            pcont.goToYourTravel();
            pcont.goToYourTreatment();
        }
    }
    
}