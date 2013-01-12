public with sharing class PipelineController {

  public Integer curPageSize {get; set; }
  
  public List<Treatment__c> active {get; set; } 
  public List<Treatment__c> treatments {get; set; }
  public List<Payment__c> Payments {get;set; }    
  public List<Task> tasks{get;set;}    
  public List<Incident__c> incidents { get; set; } 
  public List<Message__c> messages {get; set; }
     
  public List<Treatment__c> allTreatments {get; set; }    
  public List<Payment__c> allPayments {get;set; }
  public List<Task> allTasks{get;set;}    
  public List<Incident__c> allIncidents { get; set; } 
  public List<Message__c> allMessages {get; set; }
      
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
           
  public Pipelinecontroller(){
    twoHoursAgo = system.now().addHours(-2);
    next24Hours = system.now().addhours(24);
    this.curPageSize = 10  ;
    this.active = new List<Treatment__c>();      
    this.allTreatments  = new List<Treatment__c>();
    this.allTasks = new List<Task>();        
    this.allIncidents = new List<Incident__c>(); 
    this.allPayments =   new List<Payment__c>();     
         
    this.treatments = new List<Treatment__c>();        
    this.tasks = new List<Task>();   
    this.incidents = new List<Incident__c>();
    this.payments = new List<Payment__c>();
    this.messages = new List<Message__c>();
    try {
        active = [SELECT Phase__c, Stage__c, LastModifiedDate, Procedure_Category__c, Patient__r.Name, Next_Follow_Up__c, 
        Patient__r.Phone__c, Patient__r.Time_Zone__c, CreatedDate, Patient__r.Last_Communication__c, Treatment_Summary__c, (SELECT Procedure__c FROM Treatment_Quotes__r order by createdDate desc limit 1)
        FROM Treatment__c
        WHERE Phase__c in ('(1) Inquiry', '(2) Interaction') and Stage__c != 'Patient On Hold' and Sub_Stage__c != 'Consult Requested' AND patient__r.ownerid = :userinfo.getUserId() order by Phase__c, Next_Follow_Up__c ];
        
    for (Treatment__c r : active) {
/*      if(p.treatments__r.size()>0) for (Treatment__c t : p.Treatments__r) allTreatments.add(t); 
      if(p.Payments__r.size()>0)   for (Payment__c pay : p.Payments__r) allPayments.add(pay); 
//      if(p.Incidents__r.size()>0)  for (Incident__c i : p.Incidents__r) allIncidents.add(i); 
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
     
    System.debug('incidentslist '+allIncidents);        
    icon = new ApexPages.StandardSetController(allIncidents); 
    icon.setPageSize(this.curPageSize); 
    this.incidents = icon.getRecords();      

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
  
  public void firstIncidents()   { icon.first();    incidents = icon.getRecords();  }
  public void lastIncidents()    { icon.previous(); incidents = icon.getRecords();}
  public void previousIncidents(){ icon.previous(); incidents = icon.getRecords();}  
  public void nextIncidents()    { icon.next();     incidents = icon.getRecords();  }
  
  public void firstTasks()   { taskcon.first();     tasks = taskcon.getRecords(); }
  public void lastTasks()    { taskcon.last();      tasks = taskcon.getRecords(); }
  public void previousTasks(){ taskcon.previous();  tasks = taskcon.getRecords(); }
  public void nextTasks()    { taskcon.next();      tasks = taskcon.getRecords(); }

  public void firstMessages()   { mcon.first();     messages = mcon.getRecords();  }
  public void lastMessages()    { mcon.previous();  messages = mcon.getRecords();}
  public void previousMessages(){ mcon.previous();  messages = mcon.getRecords();}  
  public void nextMessages()    { mcon.next();      messages = mcon.getRecords();  }   
    
   
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