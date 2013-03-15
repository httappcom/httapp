public without sharing class ProviderPortalController {

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
    public ID uploadPatientId { get; set; }
    public String patientName { get; private set; }
    
    public Id doctorUserId {get; private set; }
    public Id patientid {get;set;}
    public Id treatmentId {get;set;}

    public Id commPatientId {get;set;}
    public Id commTreatmentId {get;set;}

    public list<TreatmentRow> treatmentList {get; private set;}
    public List<SelectOption> patientSelectList { get; private set; }
    private Map <ID, List<SelectOption>> patientToTreatmentSelectListMap = null;
    public List<SelectOption> treatmentSelectList { get; private set; }
    public Medical_Facility__c destinationFacility {get; private set; }
    private User user = null;
    public Treatment__c currentTreatment { get; private set; }
    public ID surveyId { get; set; }
    public Boolean displaySurveyResults { get; private set; }
    public Boolean displayUploadPanel { get; private set; }
    
    /*
Patient,
Treatment,
Collaboration,
View Med Profile,
View Medical Records,
Upload Medical Record,
Treatment Approval,
Stage or Sub Stage 
*/
    
    public class TreatmentRow {
    	public Treatment__c treatment { get; private set; }
    	public Patient__c patient {get; private set; }
    	public List<Medical_Record__c> records { get; private set; }
    	public TreatmentRow( Treatment__c treatment, Patient__c patient/*, List<Medical_Record__c> records*/ ) {
    		this.treatment = treatment;
    		this.patient = patient;
  system.debug('headers='+patient.Survey_Headers__r);
   system.debug('TreatmentRow constr Treatment='+treatment);
//    		this.records = records;
    	}
    }

    public ProviderPortalController () {
    	displaySurveyResults = false;
 system.debug('ProviderPortalController');
//        medicalRecords = new list<Medical_Profile__c>();
        loadPrmConfig();
 
        if (apexPages.currentPage().getparameters().get('docUserID') != null) {
            doctorUserId = apexPages.currentPage().getparameters().get('docUserID');
        } else {
        	doctorUserId = userinfo.getUserId();
        }
        user = [select id, contactid from User where id = :doctorUserId];
  system.debug('user='+user);
        
        list<Medical_Professional__c> medProfList = [select id,
        					Medical_Facility__r.Provider_Portal_Banner_Image__c,
	        				Medical_Facility__r.Doctor_Portal_Welcome_Msg__c 
                            from Medical_Professional__c 
                            where key_contact__c = :user.contactid
                            limit 1]; 
        
        currentPage='Home';
        if (medProfList != null && medProfList.size() > 0) {
        	destinationFacility = medProfList[0].Medical_Facility__r;
  system.debug('med prof='+medProfList[0]);
        } else currentPage ='Portal User Error'; 
        
    }
    
    public pagereference load() {
  system.debug('load');
  		try {
        	loadTreatmentList();
  		} catch (Exception e) {
  			system.debug('Exception='+e);
  			system.debug(e.getStackTraceString());
  		}
        return null;
    }
    
    public PageReference showUploadPanel() {
    	displayUploadPanel = true;
    	try {
    		patientName = patientMap.get(uploadPatientId).Name;
    	} catch (Exception ex) {}
    	return null;
    }
    public PageReference hideUploadPanel() {
    	displayUploadPanel = false;
    	return null;
    }
  	public PageReference upload() {
 system.debug('upload...');
 
	    attachment.OwnerId = UserInfo.getUserId();
    	attachment.ParentId = uploadPatientId; // the record the file is attached to
    	attachment.IsPrivate = false;
 
    	try {
  system.debug('attachment='+attachment);
      		insert attachment;
      		displayUploadPanel = false;
    	} catch (DMLException ex) {
      		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment:'+ex.getMessage()));
      		return null;
    	} catch (Exception e) {
      		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,e.getMessage()));
      		return null;
    	} finally {
      		attachment = new Attachment(); 
    	}
 
    	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    	load();
    	return null;
  	}
  	
    public PageReference commPatientChanged() {
    	treatmentSelectList = patientToTreatmentSelectListMap.get(commPatientId);
    	commTreatmentId = treatmentSelectList.size()>0?treatmentSelectList[0].getValue():null;
    	return null;
    }
    
    public PageReference commTreatmentChanged() {
    	return null;
    }
    public void loadTreatmentList() {
    	patientToTreatmentSelectListMap = new Map <ID, List<SelectOption>>();
        treatmentList = new list<TreatmentRow>();
  system.debug('loadTreatmentList user.id='+user.id);
  		Care_Team_Member__c[] members = [select 
  			Treatment__r.Name,
  			Treatment__r.Patient__c,
  			Treatment__r.Patient__r.Name,
  			Treatment__r.Engagement_Type__c,
  			Treatment__r.Onsite_Coordinator__r.Name,
  			Treatment__r.Insurance_Network_Contact__r.Name,
  			Treatment__r.Procedure_Date__c,
  			Treatment__r.Procedure_Category__c,
  			Treatment__r.Procedure__c,
  			Treatment__r.Approval_State__c,
  			Treatment__r.Stage__c,
  			Treatment__r.Sub_Stage__c
  			from Care_Team_Member__c where User__c = :user.id order by Treatment__r.CreatedDate desc];
  		if (members.size()>0) {
  			currentTreatment = members[0].Treatment__r;
  		}
  system.debug('# of treatments '+members.size());
  		Set<ID> patientIds = new Set<ID>();
  		patientSelectList = new List<SelectOption>();
  		treatmentSelectList = new List<SelectOption>();
  		for (Care_Team_Member__c member : members) {
  system.debug('loadTreatment ApprovalStatus='+member.Treatment__r.Approval_State__c);
  			patientIds.add(member.Treatment__r.Patient__c);
  			patientSelectList.add(new SelectOption(member.Treatment__r.Patient__c, member.Treatment__r.Patient__r.Name));
  			List<SelectOption> tList = patientToTreatmentSelectListMap.get(member.Treatment__r.Patient__c);
  			if (tList == null) {
  				tList = new List<SelectOption>();
  				patientToTreatmentSelectListMap.put(member.Treatment__r.Patient__c, tList);
  			}
  			tList.add(new SelectOption(member.Treatment__c, member.Treatment__r.Name));
  		}
  		patientSelectList = SelectOptionUtil.sort(patientSelectList);
  		for (ID patientId : patientToTreatmentSelectListMap.keySet()) {
  			List<SelectOption> tList = patientToTreatmentSelectListMap.get(patientId);
	  		patientToTreatmentSelectListMap.put(patientId, SelectOptionUtil.sort(tList));
  		}
  system.debug('patientIds='+patientIds);
  		loadPatientMap( patientIds );
  		for (Care_Team_Member__c member : members) {
  			Patient__c patient = patientMap.get(member.Treatment__r.Patient__c);
  system.debug('survey headers='+patient.Survey_Headers__r);
  			TreatmentRow row = new TreatmentRow( member.Treatment__r, patient );
  			treatmentList.add(row);
  		}
       	if (treatmentList != null && treatmentList.size()>0) {
       		commPatientId = treatmentList[0].treatment.Patient__c;
       		commPatientChanged();
       		commTreatmentId = treatmentList[0].treatment.id;
       	}
  system.debug('loadTreatmentInfo 2 list='+treatmentList);
    }
    
    public PageReference uploadDocument()
    {
        return null;
    }
    
    public PageReference showSurveyResults() {
    	displaySurveyResults = true;
    	return null;
    }
    public PageReference hideSurveyResults() {
    	displaySurveyResults = false;
    	return null;
    }
    public List<Medical_Record__c> getMedicalRecords() {
        return patient.Medical_Records__r;
    }
    
    public PageReference approveTreatment() {
 system.debug('approveTreatment');
    	Treatment__c treatment = [select Approval_State__c, Stage__c from Treatment__c where id = :treatmentId for update];
    	treatment.Approval_State__c = 'Approved';
 system.debug('stage='+treatment.Stage__c);
    	if (treatment.Stage__c == PickListDefines.Stage.TreatmentApproval) {
    		treatment.Stage__c = PickListDefines.Stage.Quoting;
	    	update treatment;
    		loadTreatmentList();
    	}
    	return null;
    }
    
    public PageReference denyTreatment() {
 system.debug('denyTreatment for id='+treatmentId);
    	Treatment__c treatment = [select Approval_State__c, Stage__c from Treatment__c where id = :treatmentId for update];
 system.debug('stage='+treatment.Stage__c);
    	if (treatment.Stage__c == PickListDefines.Stage.TreatmentApproval) {
 system.debug('setting to denied...');
		   	treatment.Approval_State__c = 'Denied';
	    	update treatment;
    		loadTreatmentList();
    	}
    	return null;
    }

    private void loadPrmConfig() {
 system.debug('loadPrmConfig');
        PRM_Config__c[] config = [select 
        	Provider_Portal_Banner_Image__c,
        	Doctor_Portal_Welcome_Msg__c,
        	Facilitator_Name__c, 
        	Patient_Portal_CSS__c 
        	from PRM_Config__c limit 1];
 system.debug('config='+config);
//Fix banner reference        
        prmConfig = config.size()==1? config[0] : new PRM_Config__c();
    }
    
    @isTest (seealldata=true)
    public static void providerPortalTest (){
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
/*            Pagereference pg = Page.patientPortal;
            pg.getParameters().put('devPatID',p.id);
            test.setCurrentPage(pg);
            patientPortalController pcont = new patientPortalController();
            pcont.goToHome();
            pcont.goToMedicalRecords();
            pcont.goToYourTravel();
            pcont.goToYourTreatment();*/
        }
    }
    
    private Map<ID, Patient__c> patientMap = null;
    private Map<ID, ID> patientUserIdMap = null;
    private void loadPatientMap( Set<ID> patientIds ) {
    	patientMap = new Map<ID, Patient__c>([select id,
    				Gender__c,
    				Date_of_Birth__c,
    				Name, 
    				Email__c,
    				Phone__c,
    				Mobile__c,
    				Key_Contact__c,
    				Insurance_Network__r.Name,
    				(select Id,
                              Name,
                              Patient__c,
                              Survey_Id__c
                      from Survey_Headers__r),
//                      (SELECT Name,S3_Doc_Key__c,ObjectType__c,File_Name__c FROM Medical_Records__r)
					  (SELECT Id, Description, Name, CreatedDate FROM Attachments order by name)
                      from Patient__c where id in :patientIds]);
 	
/* 		patientUserIdMap = new Map<ID, ID>();
 		Set<ID> contactIds = new Set<ID>();
 		for (Patient__c patient : patientMap.values()) {
 			//FIXME - when completed will be able to make Patient owner of uploaded attachments.
 		}*/
    }
}