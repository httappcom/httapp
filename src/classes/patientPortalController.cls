public with sharing class patientPortalController {

    public string currentPage {get;set;}
    public Patient__c patient {get;set;}
    public boolean showDetailBox {get;set;}
    public string showDetailID {get;set;}
    public string patientid {get;set;}
    public map<id,sObject> detailMap {get;set;}
    public sObject showDetailRecord{get;set;}
    public string showDetailRecordType{get;set;}

    public Treatment__c detailTreatment {get;set;}
    public Id treatmentId {get;set;}
    public Task detailTask {get;set;}
    public Travel__c detailTravel {get;set;}
    public Payment__c detailPayment {get;set;}
//    public Medical_Profile__c detailMedicalRecord {get;set;}
    public Incident__c detailIncident {get;set;}
    public Treatment_Quote__c detailTreatmentQuote {get;set;}

    public string tempstring {get;set;} // placeholder string to be deleted once portal built out more
    public Attachment tempfile {get;set;} // placeholder file to be deleted once portal built out more
    
    public list<recentActivity> recentActivities {get;set;}
    public list<Travel__c> travelList {get;set;}
    public list<Treatment__c> treatmentList {get;set;}
    public list<Treatment_Quote__c> treatmentQuoteList {get;set;}
    
    public string selectedItinerary {get;set;}
    
    public class recentActivity {
        public string subject {get;set;}
        public string reference {get;set;}
        public string status {get;set;}
        public string dateCreated {get;set;}
        public datetime lastModified {get;set;}
        public string index {get;set;}
        public string relatedTreatment {get;set;}
         
        public recentActivity () {}
    }
    
    public patientPortalController () {
        recentActivities  = new list<recentActivity>();
//        medicalRecords = new list<Medical_Profile__c>();
        travelList = new list<Travel__c>();
        treatmentList = new list<Treatment__c>();
        treatmentQuoteList = new list<Treatment_Quote__c>();
 
system.debug('USERID:' +userinfo.getUserId());    
        User u = [select id, contactid from User where id = :userinfo.getUserId()];
        
        list<Patient__c> plist = [select id 
                            from Patient__c 
                            where key_contact__c = :u.contactid
                            limit 1]; 
        
        currentPage='Home';
        if (apexPages.currentPage().getparameters().get('devPatID') != null) {
            patientid = apexPages.currentPage().getparameters().get('devPatID');
            load();
        }
        else if (plist != null && plist.size() > 0) {
            patientid = plist[0].id;
            load();
        }
        else currentPage ='Portal User Error'; 
        showDetailBox = false;
    }
    
    public pagereference load() {
    	Logger.info('load, patientId: '+patientid);
        patient = queryPatientRelatedDesc(patientid);
		if ( patient.Treatments__r.size() > 0 ){
	        treatmentId = patient.Treatments__r[0].Id;
		}
		system.debug('PATIENT: ' +patient);
        detailMap = new map<id,sobject>();
        buildRecentActivity();
        return null;
    }
    
    public pagereference buildRecentActivity() {
        recentActivities = new list<recentActivity>();
/*        for (Medical_Profile__c mp : patient.Medical_Profiles__r) {
            recentActivity r = new recentActivity();
            r.lastModified = mp.LastModifiedDate;
            r.subject = 'Medical Profile';
            r.reference = mp.name;
            r.status = '';
            r.dateCreated = string.valueof(mp.CreatedDate);
            sortInsertRecentActivity(r);
            r.index = mp.id;
            r.relatedTreatment ='';
            detailMap.put(mp.id,mp);
        }
 */       
        for (Task t : patient.tasks) {
            recentActivity r = new recentActivity();
            r.lastModified = t.LastModifiedDate;
            r.subject = 'Task';
            r.reference = t.subject;
            r.status = '';
            r.dateCreated = string.valueof(t.CreatedDate);          
            sortInsertRecentActivity(r);
            r.index = t.id;
            r.relatedTreatment ='';
            detailMap.put(t.id,t);
        }
        
        for (Payment__c p : patient.payments__r) {
            recentActivity r = new recentActivity();
            r.lastModified = p.LastModifiedDate;
            r.subject = 'Payment';
            r.reference = p.name;
            r.status = '';
            r.dateCreated = string.valueof(p.CreatedDate);
            sortInsertRecentActivity(r);
            r.index = p.id;
            r.relatedTreatment ='';
            detailMap.put(p.id,p);
        }
        
        set<id> treatmentIds = new set<id>();
        for (Treatment__c t : patient.treatments__r) {
            recentActivity r = new recentActivity();
            r.lastModified = t.LastModifiedDate;
            r.subject = 'Treatment';
            r.reference = t.name;
            r.status = '';
            r.dateCreated = string.valueof(t.CreatedDate);
            sortInsertRecentActivity(r);
            r.index = t.id;
            r.relatedTreatment ='';
            detailMap.put(t.id,t);
            treatmentIds.add(t.id);
        } 
        
        treatmentList = queryTreatmentRelatedDesc(treatmentIDs);
        map<id,Treatment__c> treatmentMap = new map<id,Treatment__c>();
        for (Treatment__c t : treatmentList) {
            treatmentMap.put(t.id,t);
        }
        
        for (string s : treatmentMap.keySet()) {
            recentActivity r = new recentActivity();
           
            for (Incident__c i : treatmentMap.get(s).Incidents__r) {
                r = new recentActivity();
                r.lastModified = i.LastModifiedDate;
                r.subject = 'Incident';
                r.reference = i.name;
                r.status = '';
                r.dateCreated = string.valueof(i.CreatedDate);
                sortInsertRecentActivity(r);
                r.index = i.id;
                r.relatedTreatment = i.name;
                detailMap.put(i.id,i);
            }
            
            for (Treatment_Quote__c tq : treatmentMap.get(s).Treatment_Quotes__r) {
                r = new recentActivity();
                r.lastModified = tq.LastModifiedDate;
                r.subject = 'Treatment Quote';
                r.reference = tq.name;
                r.status = '';
                r.dateCreated = string.valueof(tq.CreatedDate);
                sortInsertRecentActivity(r);
                r.index = tq.id;
                r.relatedTreatment = tq.name;
                detailMap.put(tq.id,tq);
                /*NEED TO DO LAST 10 TQ INTO TQ LIST FOR ITINERARY DISPLAY*/
                
            }
        }
        return null;
    }
    
    public pagereference sortInsertRecentActivity (recentActivity r) {
        if (recentActivities.size() > 0) {
            recentActivities.add(r);
            for (integer i = recentActivities.size()-1; i >=0 ; i--) { //reverse
                if (r.lastModified > recentActivities[i].lastModified) {
                    for (integer j = recentActivities.size()-1; j> i+1; j--) {
                        recentActivities[j] = recentActivities[j-1];
                    }
                    break;
                }
                else break; //if not more recent than last element in list, leave at end
            }
        }
        else recentActivities.add(r);
        
        if (recentActivities.size() > 10) {
            recentActivities.remove(10); //10th index is 11th item
        }
        return null;
    }
    
    public pagereference goToHome(){ 
        currentPage='Home';
        return null;
    }
    
    public pagereference goToMessaging(){
        currentPage = 'Messaging';
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
    
    public pagereference goToHaveAQuestion() {
        currentPage = 'Have a Question?';
        return null;
    }
    
    public pagereference goToYourTreatment (){
        currentPage = 'Your Treatment'; 
        return null;
    }

    public pagereference showDetails(){
        if (showDetailBox==false) {
            if (apexpages.currentpage().getparameters().get('showDetailID')!= null){
                showDetailID = apexpages.currentpage().getparameters().get('showDetailID');
            }
            showDetailRecord = detailMap.get(showDetailId);

            if (showDetailRecord instanceof Treatment__c){
                showDetailRecordType = 'Treatment';
                detailTreatment = (Treatment__c)showDetailRecord;
            }   
            else if (showDetailRecord instanceof Task){
                showDetailRecordType = 'Task';
                detailTask = (Task)showDetailRecord;
            }
            else if (showDetailRecord instanceof Travel__c){
                showDetailRecordType = 'Travel';
                detailTravel = (Travel__c)showDetailRecord;
            }
            else if (showDetailRecord instanceof Payment__c){
                showDetailRecordType = 'Payment';
                detailPayment = (Payment__c)showDetailRecord;
            }
/*            else if (showDetailRecord instanceof Medical_Profile__c){
                showDetailRecordType = 'Medical Record';
                detailMedicalRecord = (Medical_Profile__c)showDetailRecord;
            }*/
            else if (showDetailRecord instanceof Incident__c){
                showDetailRecordType = 'Incident';
                detailIncident = (Incident__c)showDetailRecord;
            }
            else if (showDetailRecord instanceof Treatment_Quote__c){
                showDetailRecordType = 'Treatment Quote';
                detailTreatmentQuote = (Treatment_Quote__c)showDetailRecord;
            }
            else showDetailRecordType = 'Undefined';
            
            showDetailBox = true;
        }
        else showDetailBox = false;
        return null;
    }
    
    public pagereference getItineraryPDF() {
        if (apexpages.currentpage().getParameters().get('selectedItinerary') != null) {
            selectedItinerary = apexpages.currentpage().getParameters().get('selectedItinerary');       
        }
        
        Pagereference p = Page.travelItineraryPDF;
        p.getParameters().put('id',selectedItinerary);
        p.setRedirect(true);
        return p;
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
        
        Task taskTest = new Task();
        taskTest.Subject = 'test';
        taskTest.Status = 'None';
        taskTest.WhatId = p.id;
        insert taskTest;
        
        
        Payment__c paymentTest = new Payment__c();
        paymentTest.Patient__c = p.id;
        paymentTest.Treatment__c = treatmentTest.id;
        insert paymentTest;

/*        Medical_Profile__c MRTest = new Medical_Profile__c();
        MRTest.Patient__c = p.id;
        MRTest.Treatment__c = treatmentTest.id;
        insert MRTest;
*/        
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
            pcont.goToHaveAQuestion();
            pcont.goToYourTreatment();
            pcont.showDetails();
        }
    }
    
    public Patient__c queryPatientRelatedDesc(string patientId) {
        return  [Select id, 
                       Name,
                       CreatedBy.Name,
                       CreatedDate,
                       LastModifiedBy.Name,
                       LastModifiedDate,
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
                               CreatedBy.Name,
                               CreatedDate,                                                             
                               LastModifiedBy.Name,
                               LastModifiedDate,
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
                               CreatedBy.Name,
                               CreatedDate,
                               ActivityDate,
                               LastModifiedBy.Name,
                               LastModifiedDate,
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
                              CreatedBy.Name,
                              CreatedDate, 
                              Deductible__c,
                              IsDeleted,
                              Dependent_Coverage__c,
                              Effective_Date__c, 
                              Fax_Number_Medical_Reviews__c,
                              Group__c,
                              Insurance_Contact__c,
                              LastModifiedBy.Name, 
                              LastModifiedDate,
                              Name_of_Insurance__c,
                              Patient__c,
                              Payment_Type__c,
                              Policy_ID__c, 
                              SystemModstamp,
                              Treatment__c,
                              Verification_Date__c,
                              Verification_Phone_Number__c 
                      from Payments__r
                      order by lastModifiedDate desc),
                      (SELECT Name, Id, S3_Doc_Key__c, Content_Type__c, File_Name__c FROM Medical_Records__r order by Name)
                from Patient__c 
                where id = :patientId];
    }
    
    public list<Treatment__c> queryTreatmentRelatedDesc(set<id> treatmentIds) {
        return 
            [ Select    t.Treatment_Summary__c,
                        t.Travel__c,
                        t.SystemModstamp,
                        t.Sub_Stage__c,
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
                        t.Phase__c,
                        t.Payment_Type__c,
                        t.Patient__c,
                        t.Patient_Pipeline_Color__c,
                        t.Patient_Not_Committed_Reason__c,
                        t.Patient_Email__c,
                        t.Patient_Email_Formula__c,
                        t.On_Site_Recovery_Period__c,
                        t.On_Hold__c,
                        t.Next_Follow_Up__c,
                        t.Name,
                        t.LastModifiedDate,
                        t.LastModifiedById,
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
                        t.CreatedDate,
                        t.CreatedById,
                        t.Close_Date__c,
                        t.Case_Manager_s_Feel__c,
                        t.Best_Time_to_Contact__c,
                        t.Arrival_Time__c,
                        t.Amount__c,
                        t.Additional_Amount__c,
                            (Select tq.echosignDocKey__c,
                                    tq.Treatment__c,
                                    tq.Total_Price__c,
                                    tq.SystemModstamp,
                                    tq.Syncing__c,
                                    tq.Sub_Total__c,
                                    tq.Status__c,
                                    tq.Procedure__c,
                                    tq.Number_of_Hospital_Nights__c,
                                    tq.Name,
                                    tq.LastModifiedDate,
                                    tq.LastModifiedById,
                                    tq.IsDeleted,
                                    tq.Id,
                                    tq.Hotel_Nights_Needed__c,
                                    tq.Hotel_Nights_Included__c,
                                    tq.Ground_Transportation_Included__c,
                                    tq.Expiration_Date__c,
                                    tq.Discount_Amount__c,
                                    tq.Description__c,
                                    tq.Departure_Date__c,
                                    tq.CreatedDate,
                                    tq.CreatedById,
                                    tq.Arrival_Date__c,
                                    tq.procedure__r.doctor__c,
                                    tq.procedure__r.facility__c 
                                From Treatment_Quotes__r tq
                                order by tq.lastmodifieddate desc),
                            (Select i.Type__c,
                                    i.Treatment__c,
                                    i.SystemModstamp,
                                    i.Subject__c,
                                    i.Sub_Category__c,
                                    i.Status__c,
                                    i.Name,
                                    i.LastModifiedDate,
                                    i.LastModifiedById,
                                    i.LastActivityDate,
                                    i.IsDeleted,
                                    i.Id,
                                    i.Due_Date__c,
                                    i.Date_Time_Opened__c,
                                    i.Date_Time_Closed__c,
                                    i.CreatedDate,
                                    i.CreatedById,
                                    i.Contact__c,
                                    i.Contact_Phone__c,
                                    i.Contact_Email__c,
                                    i.Category__c,
                                    i.Account__c 
                                From Incidents__r i
                                order by i.lastmodifieddate desc)    
                    From Treatment__c t
                    where id
                    IN :treatmentIds
                    order by t.Procedure_Date__c desc
            ];
    }
    public PageReference uploadDicom()
    {
    	return null;
    }
    public PageReference uploadDocument()
    {
    	return null;
    }
    
    public List<Medical_Record__c> getMedicalRecords() {
    	return patient.Medical_Records__r;
    }
}