public without sharing class travelItineraryPDF_Controller {

    public Treatment_Quote__c treatmentQuote {get;set;}
    public string language {get;set;}
    public String travelConciergeName {get; private set; }
    public String travelConciergePhone {get; private set; }
    public String travelConciergeMobilePhone {get; private set; }
    public String travelConciergeEmail {get; private set; }

    public String onsiteCoordinatorName {get; private set; }
    public String onsiteCoordinatorPhone {get; private set; }
    public String onsiteCoordinatorMobilePhone {get; private set; }
    public String onsiteCoordinatorEmail {get; private set; }

    public String ownerName {get; private set; }
    public String ownerPhone {get; private set; }
    public String ownerEmail {get; private set; }
    
    public travelItineraryPDF_Controller(Apexpages.standardcontroller cont) {
        
        if (cont.getRecord() instanceof Treatment_Quote__c){
            treatmentQuote = getTreatmentQuote (cont.getId());
            onsiteCoordinatorName = treatmentQuote.treatment__r.onsite_Coordinator__r.name;
            onsiteCoordinatorPhone = treatmentQuote.treatment__r.onsite_Coordinator__r.phone;
            onsiteCoordinatorMobilePhone = treatmentQuote.treatment__r.onsite_Coordinator__r.mobilePhone;
            onsiteCoordinatorEmail = treatmentQuote.treatment__r.onsite_Coordinator__r.email;
            ownerName = treatmentQuote.treatment__r.patient__r.createdby.name;
            ownerPhone = treatmentQuote.treatment__r.patient__r.createdby.phone;
            ownerEmail = treatmentQuote.treatment__r.patient__r.createdby.email;
            getTravelConcierge();
            if(apexpages.currentPage().getparameters().get('lang')!=null){
                language = apexpages.currentPage().getparameters().get('lang');
            }
            else {
                try {
                    // get from user
                }
                catch (exception e){
                    
                }
                finally {
                    language = 'English';
                }
            }
             
        }
        else {
            //Apexpages.addMessage(new apexpages.message(Apexpages.severity.error,'Invalid Treatment Quote'));
        }
    }
    
    public Treatment_Quote__c getTreatmentQuote (id treatmentid) { //selective fields
        return  [Select t.id,
                        t.total_price__c,
                            t.procedure__r.name,
                            t.procedure__r.doctor__r.name,
                            t.procedure__r.facility__r.name,
                            t.procedure__r.facility__r.city__C,
                            t.procedure__r.facility__r.country__c,
                            t.treatment__r.onsite_Coordinator__r.name,
                            t.treatment__r.onsite_coordinator__r.phone,
                            t.treatment__r.onsite_coordinator__r.mobilephone,
                            t.treatment__r.onsite_coordinator__r.email,
                            t.treatment__r.patient__r.name,
                            t.treatment__r.patient__r.createdby.name,
                            t.treatment__r.patient__r.createdby.phone,
                            t.treatment__r.patient__r.createdby.email,
                            t.treatment__r.patient__r.phone__c,
                            t.treatment__r.procedure_date__c,
                            t.treatment__r.travel__r.companion__c,
                            t.treatment__r.travel__r.travel_start__c,
                            t.treatment__r.travel__r.travel_end__c,
                            t.treatment__r.travel__r.Arrival_Airport_Code__c,
                            t.treatment__r.travel__r.Departure_Airport_Code__c,
                            t.treatment__r.travel__r.Arrival_Airline__c,
                            t.treatment__r.travel__r.Departure_Airline__c,
                            t.treatment__r.travel__r.Arrival_Flight_No__c,
                            t.treatment__r.travel__r.Departure_Flight_No__c,
                            t.treatment__r.travel__r.Notes__c,      
                            t.treatment__r.travel__r.hotel__r.name,
                            t.treatment__r.travel__r.hotel__r.address__c, 
                            t.treatment__r.travel__r.hotel__r.phone__c,
                            t.treatment__r.travel__r.hotel_checkin__c,
                            t.treatment__r.travel__r.hotel_checkout__c
                    From Treatment_Quote__c t 
                    where id = :treatmentid];
}
    
    public void getTravelConcierge() { //all fields
    	User[] travelConcierges = [Select u.Name,
                        u.Phone,
                        u.MobilePhone,
                        u.Email
                   From User u 
                    where Travel_Concierge__c = true 
                    limit 1];
    	if (travelConcierges.size()>0) {
            travelConciergeName = travelConcierges[0].Name;
    		travelConciergePhone = travelConcierges[0].Phone;
    		travelConciergeMobilePhone = travelConcierges[0].MobilePhone;
    		travelConciergeEmail = travelConcierges[0].Email;
        }
    }
}