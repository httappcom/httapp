public with sharing class PipelineController {

  public Integer curPageSize {get; set; }
  
  public List<Treatment__c> active {get; set; }
  public List<Treatment__c> treatments {get; set; }
  public List<Payment__c> Payments {get;set; }    
  public List<Task> tasks{get;set;}
     
  public List<Treatment__c> allTreatments {get; set; }    
  public List<Payment__c> allPayments {get;set; }
  public List<Task> allTasks{get;set;}    
      
  public ApexPages.StandardSetController pcon{get;set;} 
  public ApexPages.StandardSetController tcon{get;set;} 
  public ApexPages.StandardSetController taskcon{get;set;} 
  public ApexPages.StandardSetController icon{get;set;}     
  public ApexPages.StandardSetController mcon{get;set;}
           
  public List<SelectOption> taskOptions{get;set;} 
  public String filterMyAll{get; set;}  
  public String filterStatus{get; set;}  
  public String selectedTaskOption{get;set;}  
           
  public datetime twoHoursAgo {get;set;} 
  public datetime next24Hours {get;set;}        

	public String getInquiryPhase() {
		return PickListDefines.Phase.Inquiry;
	}           
	public String getNewStage() {
		return PickListDefines.Stage.Initial;
	}           
  public Pipelinecontroller(){
    twoHoursAgo = system.now().addHours(-2);
    next24Hours = system.now().addhours(24);
    this.curPageSize = 10  ;
    this.active = new List<Treatment__c>();      
    this.allTreatments  = new List<Treatment__c>();
    this.allTasks = new List<Task>();        
    this.allPayments =   new List<Payment__c>();     
         
    this.treatments = new List<Treatment__c>();        
    this.tasks = new List<Task>();
    this.payments = new List<Payment__c>();
    try {
        active = [SELECT Phase__c, Stage__c, LastModifiedDate, Procedure_Category__c, Patient__r.Name, Next_Follow_Up__c, Procedure__c,
        Patient__r.Phone__c, Patient__r.Time_Zone__c, CreatedDate, Patient__r.Last_Communication__c, Treatment_Summary__c
        FROM Treatment__c
        WHERE Phase__c in :(new List<String>{PickListDefines.Phase.Inquiry, PickListDefines.Phase.Interaction}) and 
            Active_Status__c IN :(new List<String>{PickListDefines.ActiveStatus.Active, PickListDefines.ActiveStatus.NotResponding})
            and Engagement_Type__c = :PickListDefines.EngagementType.Treatment AND patient__r.ownerid = :userinfo.getUserId() 
        	order by Phase__c, Next_Follow_Up__c ];
        
    for (Treatment__c r : active) {
/*      if(p.treatments__r.size()>0) for (Treatment__c t : p.Treatments__r) allTreatments.add(t); 
      if(p.Payments__r.size()>0)   for (Payment__c pay : p.Payments__r) allPayments.add(pay); 
      if(p.Tasks.size()>0)         for (Task task : p.Tasks) allTasks.add(task);*/       
    }                 
    System.debug('treatments list '+alltreatments);  
    tcon = new ApexPages.StandardSetController(allTreatments); 
    tcon.setPageSize(this.curPageSize); 
    this.treatments = tcon.getRecords();

    System.debug('payments list '+allPayments);        
    pcon = new ApexPages.StandardSetController(allPayments); 
    pcon.setPageSize(this.curPageSize); 
    this.payments= pcon.getRecords();      
     

   /* System.debug('Tasks List'+allTasks);        
    taskcon = new ApexPages.StandardSetController(allTasks); 
    taskcon.setPageSize(1); 
    this.tasks = taskcon.getRecords();  
    System.debug('Tasks controller'+ taskcon.getRecords()); */  
                  
    selectedTaskOption = 'All Open';
    taskOptions = new List<SelectOption>();            
    taskOptions.add(new SelectOption('All Open', 'All Open'));            
    taskOptions.add(new SelectOption('All Closed', 'All Closed'));            
    taskOptions.add(new SelectOption('My Open', 'My Open'));            
    taskOptions.add(new SelectOption('My Closed', 'My Closed'));
                            
    this.tasks = allTasks;      
    searchTask()   ; 
    
    }catch (Exception e) {
       //ApexPages.addMessages(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.Message));
    }                                                                 
  }   
      
  public Boolean hasNextTreatment {
    get { return tcon != null && tcon.getHasNext();}
    set;
  }
  public Boolean hasPreviousTreatment {
    get { return tcon != null && tcon.getHasPrevious(); }
    set;
  }
  public Integer pageNumberTreatment {
    get { return tcon != null? tcon.getPageNumber(): null;   }
    set;
  } 
   public Boolean hasNextMessage {
    get { return mcon != null && mcon.getHasNext();}
    set;
  }
  public Boolean hasPreviousMessage {
    get { return mcon != null && mcon.getHasPrevious(); }
    set;
  }
  public Integer pageNumberMessage {
    get { return mcon != null ? mcon.getPageNumber() : null;   }
    set;
  }
  public Boolean hasNextIncident {
    get { return icon != null && icon.getHasNext();}
    set;
  }
  public Boolean hasPreviousIncident {
    get { return icon != null && icon.getHasPrevious(); }
    set;
  }
  public Integer pageNumberIncident {
    get { return icon != null ? icon.getPageNumber() : null;   }
    set;
  }
  public Boolean hasNextPayment {
    get { return pcon != null && pcon.getHasNext();}
    set;
  }
  public Boolean hasPreviousPayment {
    get { return pcon != null && pcon.getHasPrevious(); }
    set;
  }
  public Integer pageNumberPayment {
    get { return pcon != null ? pcon.getPageNumber() : null;   }
    set;
  }      
  public void firstTreatments()   { tcon.first();   treatments = tcon.getRecords();  }
  public void lastTreatments()    { tcon.last();    treatments = tcon.getRecords();  }
  public void previousTreatments(){ tcon.previous();treatments = tcon.getRecords();}
  public void nextTreatments()    { tcon.next();    treatments = tcon.getRecords();  }

  public void firstPayments()   { pcon.first();     payments= pcon.getRecords();  }
  public void lastPayments()    { pcon.last();      payments= pcon.getRecords();  }
  public void previousPayments(){ pcon.previous();  payments= pcon.getRecords();}
  public void nextPayments()    { pcon.next();      payments= pcon.getRecords();  }
  
  
  public void firstTasks()   { taskcon.first();     tasks = taskcon.getRecords(); }
  public void lastTasks()    { taskcon.last();      tasks = taskcon.getRecords(); }
  public void previousTasks(){ taskcon.previous();  tasks = taskcon.getRecords(); }
  public void nextTasks()    { taskcon.next();      tasks = taskcon.getRecords(); }

   
  public void searchTask(){
    Id currentUserId =   UserInfo.getUserId();
    this.tasks = new List<Task>();
     System.debug('##############'+allTasks);   
    try {
         
      if (selectedTaskOption == 'All Open') {
        for (Task t : allTasks) {
          if (t.Status != 'Completed') {     
              this.tasks.add(t);
          }
        }
      } else if (selectedTaskOption == 'My Open') {
        for (Task t : allTasks) {
          if (t.Status !='Completed' && t.Ownerid == currentUserId) {
            this.tasks.add(t);
          }
        }
      } else if (selectedTaskOption == 'All Closed') {
        for (Task t : allTasks) {
            if (t.Status == 'Completed') {
                this.tasks.add(t);
            }
        }
      } else if (selectedTaskOption == 'My Closed') {
        for (Task t : this.allTasks) {
            if (t.Status !='Completed' && t.Ownerid == currentUserId) {
                this.tasks.add(t);
            }
        }
      } 
     System.debug('%%%%%%%%%%%%%%%%%%%   '+Tasks);                                                                       
    }catch(Exception e){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.Info, e.getMessage()));
    }
  }   
}