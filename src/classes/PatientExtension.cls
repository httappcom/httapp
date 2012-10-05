/**
* Name        : PatientExtension
* Description : To display Patient and Related data on Patient Tab
* CreatedBy   : Ramadevi Kanchadapu
*/ 
public class PatientExtension {
  public Patient__c patient { get; set; }
  public Treatment__c treatment { get; set; }    
  public Travel__c travel { get; set; }
  public List<Message__c> messages { get; set; }
  public List<Task> tasks { get; set; }  
  public Payment__c payment { get; set; }   
  public Medical_Profile__c medProfile { get; set; }
  public List<SelectOption> taskOptions { get; set; }
  public String selectedTaskOption { get; set; }
  public String firstName { get; set; }
  public String lastName { get; set; }
  public String phaseCount { get; set; }    
  public Boolean inquiryFlag { get; set; }    
  public Boolean interactionFlag { get; set; }    
  public Boolean travelFlag { get; set; }
  public Boolean postopFlag { get; set; }
            
  public PatientExtension(ApexPages.StandardController sc) {
    this.patient = (Patient__c)sc.getRecord();
    this.inquiryFlag = true;
    this.interactionFlag = false;
    this.travelFlag = false;
    this.postopFlag = false;
    this.selectedTaskOption = 'All Open';
      taskOptions = new List<SelectOption>();
      taskOptions.add(new SelectOption('All Open', 'All Open'));
      taskOptions.add(new SelectOption('All Closed', 'All Closed'));
      taskOptions.add(new SelectOption('My Open', 'My Open'));
      taskOptions.add(new SelectOption('My Closed', 'My Closed'));  
    
    try{
	   this.patient = PatientUtil.queryPatientAll(this.patient.Id);
     
     if (patient != null){
      this.firstName = this.patient.Name.split(' ')[0];   
      this.lastName = this.patient.Name.split(' ')[1]; 

      if  (treatment.Phase__c.contains( 'Post-Op' )) {phaseCount = '4';}   
      if  (treatment.Phase__c.contains( 'Inquiry' )) {phaseCount = '1';}  
      if (treatment.Phase__c.contains( 'Interaction' )) {phaseCount = '2';}  
      if  (treatment.Phase__c.contains( 'Travel' )) {phaseCount = '3';}   
                                                        
                                                          
      }          
    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
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
  static testMethod void testPatientExtension(){
    Patient__c pat = new Patient__c();
    pat.name = 'Test';
    insert pat;
        
    Treatment__c t = new Treatment__c();
    t.Patient__c = pat.id;
    insert t;
    Task task = new Task();
    task.subject ='Test';
    task.Status = 'Completed';
    insert task ;
    
    PatientExtension pe = new PatientExtension( new ApexPages.StandardController(pat));
    pe.displayInquiry();    
    pe.displayInteraction();
    pe.displayTravel();
    pe.displayPostOp();
    pe.selectedTaskOption = 'All Closed';
    pe.searchTask();    
  }        
}