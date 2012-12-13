public with sharing class QuoteUtility {
    public static Treatment_Quote__c queryQuoteForQuoteDoc(Id pQuoteId) { 
      if(pQuoteId == null) {          
        return null;
      } else {           
        return [Select id, 
                        Total_Price__c,
                        Treatment__r.Name,
                        Treatment__r.Amount__c,                      
                        Treatment__r.Procedure__c, 
                        Treatment__r.Patient__r.Name,
                        Treatment__r.Patient__r.Owner.Name,                        
                        Arrival_Date__c,
                        Departure_Date__c,
                        Number_of_Hospital_Nights__c,
                        Hotel_Nights_Included__c,
                        Hotel_Nights_Needed__c,
                        Ground_Transportation_Included__c,
                        Procedure__r.Facility__r.Name,
                        Procedure__r.Doctor__r.Name,
                        Procedure__r.Price__c
                    from Treatment_Quote__c 
                    where id = :pQuoteId];               
      }  
   }
}