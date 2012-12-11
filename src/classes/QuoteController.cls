public class QuoteController {

  public Treatment_Quote__c q { get; set; }

  public QuoteController(Apexpages.StandardController sc) {         
    this.q = (Treatment_Quote__c)sc.getRecord();
    try {       
      this.q = QuoteUtility.queryQuoteForQuoteDoc(sc.getId());                  
    }
    catch(Exception e) {
      ApexPages.addMessage(new ApexPages.Message(
        ApexPages.SEVERITY.Info, e.getMessage()));
    }      
  }
}