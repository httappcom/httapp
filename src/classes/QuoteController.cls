public class QuoteController {

  public Treatment__c treatment { get; set; }

  public QuoteController(Apexpages.StandardController sc) {         
    this.treatment = (Treatment__c)sc.getRecord();
    try {       
      this.treatment = TreatmentUtility.queryTreatmentAll(sc.getId());                  
    }
    catch(Exception e) {
      ApexPages.addMessage(new ApexPages.Message(
        ApexPages.SEVERITY.Info, e.getMessage()));
    }      
  }
}