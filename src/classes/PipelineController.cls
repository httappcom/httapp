public with sharing class PipelineController {

  public Integer curPageSize {get; set; }
  public Boolean showAllPCCs {get; set; }
  public Boolean allowShowAllPCCs {get; set; }
  
  public List<Treatment__c> active {get; set; }
  public List<Treatment__c> myActive {get; set; }
  public Integer activeNumber {get; set; }
  public Integer myActiveNumber {get; set; }  
  public List<AggregateResult> closesResult {get; set; }

  public List<closesData> getClosesResults()
  {
  	 List<closesData> resultList = new List<closesData>();
  	 for (AggregateResult ar: closesResult)
  	 {
  	 	closesData closesResultObj = new closesData(ar);
  	 	resultList.add(closesResultObj);
  	 }
  	 return resultList;
  }

  class closesData
  {
  	public String PCC {get; set; }
    public Integer numberOfCloses {get; set; }
    public Decimal sumOfClosedValue {get; set; }
    public Integer avgDaysToClose {get; set; }
    public closesData(AggregateResult ar)
    {
    	PCC = (String)ar.get('PCC');
    	numberOfCloses = (Integer)ar.get('numberOfCloses');
    	sumOfClosedValue = (Decimal)ar.get('sumOfClosedValue');
    	avgDaysToClose = (Integer)ar.get('avgDaysToClose');
    }
  }
  public PageReference toggleAllPCCs()
  {
  	showAllPCCs = !showAllPCCs;
  	return null;
  }
  public String toggleAllPCCsLabel 
  {
  	get 
  	{
  		    if (showAllPCCs) return 'Show My Records Only';
           else return 'Show All Records';
  	} 
  	set;
  }
  public List<Treatment_Quote__c> travel_In_Progress {get; set; }
  public Integer travel_In_ProgressNumber {get; set; }  
  public List<Treatment_Quote__c> myTravel_In_Progress {get; set; }
  public Integer myTravel_In_ProgressNumber {get; set; }  
  public List<Treatment_Quote__c> post_Travel {get; set; }
  public Integer post_TravelNumber {get; set; }
  public List<Treatment_Quote__c> myPost_Travel {get; set; }
  public Integer myPost_TravelNumber {get; set; }    
  public List<Treatment__c> on_Hold {get; set; }
  public Integer on_HoldNumber {get; set; }
  public List<Treatment__c> myOn_Hold {get; set; }
  public Integer myOn_HoldNumber {get; set; } 
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
  	PatientLeadUtil.execute();
  	showAllPCCs = false;
  	allowShowAllPCCs = false;
  	User[] currentUsers = [SELECT ProfileId, PCC_Manager__c FROM User WHERE Id = : userinfo.getUserId()];
    if (currentUsers.size() == 1)
    {
    	if (currentUsers[0].PCC_Manager__c = true) 
    	{
    		showAllPCCs = true;
    		allowShowAllPCCs = true;
    	}
    	else 
    	{
    		Profile[] enabledProfiles = [SELECT ID FROM Profile Where Name = 'System Administrator'];
    		if (enabledProfiles.size() > 0)
    		{
    			for(Profile p : enabledProfiles)
    			{
    			   if (currentUsers[0].ProfileId == p.Id) 
    			   {
    			     showAllPCCs = true;
    			     allowShowAllPCCs = true;
    			   }
    		  }
    		}
      }
    }
    twoHoursAgo = system.now().addHours(-2);
    next24Hours = system.now().addhours(24);
    this.curPageSize = 10  ;
    this.active = new List<Treatment__c>();
    this.on_hold = new List<Treatment__c>();      
    this.allTreatments  = new List<Treatment__c>();
    this.allTasks = new List<Task>();        
    this.allPayments =   new List<Payment__c>();     
         
    this.treatments = new List<Treatment__c>();        
    this.tasks = new List<Task>();
    this.payments = new List<Payment__c>();
    try {
        active = [SELECT Name, Phase__c, Stage__c, LastModifiedDate, Procedure_Category__c, Patient__r.Name, Next_Follow_Up__c, Procedure__c,
        Patient__r.Phone__c, Patient__r.Time_Zone__c, CreatedDate, Treatment_Summary__c, Patient_Pipeline_RowStyle__c, Destination_Facility__c, Ownerid, Owner.Name
        FROM Treatment__c
        WHERE Phase__c in :(new List<String>{PickListDefines.Phase.Inquiry, PickListDefines.Phase.Interaction}) and 
            Active_Status__c IN :(new List<String>{PickListDefines.ActiveStatus.Active, PickListDefines.ActiveStatus.NotResponding})
            and Engagement_Type__c = :PickListDefines.EngagementType.Treatment 
          order by Phase__c, Next_Follow_Up__c ];
        myActive = new List<Treatment__c>();
        for (Treatment__c r : active) 
        {
          Logger.info('Active treatment: ' + r.Name);
          if (r.Phase__c == PickListDefines.Phase.Inquiry && r.Stage__c == PickListDefines.Stage.Initial && r.LastModifiedDate < twoHoursAgo ) 
          {
            r.Patient_Pipeline_RowStyle__c = 'redRow';
          }
          else if (r.Next_Follow_Up__c != null) 
          { 
            if(r.Next_Follow_Up__c.date() < Date.today())
            {
               r.Patient_Pipeline_RowStyle__c = 'redRow';
            }
            else if (r.Next_Follow_Up__c < next24Hours) 
            {
              r.Patient_Pipeline_RowStyle__c = 'blueRow';
            }
          }         
          else 
          {
            r.Patient_Pipeline_RowStyle__c = 'whiteRow';
          }
	      	if ( r.OwnerId == UserInfo.getUserId() )
	      	{
	      		 myActive.add(r);
	      	   Logger.info('Adding ' + r.Name + ' to myActive.');
	      	}        
        }    
        activeNumber = active.size();
        myActiveNumber = myActive.size();
        
        closesResult = [Select Treatment__r.Owner.Name PCC, COUNT(Treatment__r.Id) numberOfCloses, SUM(Total_Price__c) sumOfClosedValue, AVG(Treatment__r.Days_to_Close__c) avgDaysToClose 
                  From Treatment_Quote__c 
                  Where Treatment__r.Phase__c = : PickListDefines.Phase.Travel 
                    And Treatment__r.Active_Status__c = : PickListDefines.ActiveStatus.Active
                    And Treatment__r.Engagement_Type__c = :PickListDefines.EngagementType.Treatment
                  Group By Treatment__r.Owner.Name];
              
        travel_In_Progress = [Select Treatment__r.Phase__c, Treatment__r.Stage__c, Treatment__r.Patient__r.Name, Procedure__r.Name, Treatment__r.Travel__r.Travel_End__c,
                              Procedure__r.Doctor__r.Name, Procedure__r.Facility__r.Name, Treatment__r.Patient__r.Phone__c, Treatment__r.LastModifiedDate, Treatment__r.OwnerId
                              From Treatment_Quote__c 
                              Where Treatment__r.Phase__c = : PickListDefines.Phase.Travel 
                                    And Treatment__r.Active_Status__c = : PickListDefines.ActiveStatus.Active
                                    And Treatment__r.Engagement_Type__c = :PickListDefines.EngagementType.Treatment 
                              Order By Treatment__r.Travel__r.Travel_End__c];
        myTravel_In_Progress = new List<Treatment_Quote__c>();
        for (Treatment_Quote__c q : travel_In_Progress)
        {
          if ( q.Treatment__r.OwnerId == UserInfo.getUserId() )
          {
             myTravel_In_Progress.add(q);
          }         	
        }                               
        travel_In_ProgressNumber = travel_In_Progress.size();
        myTravel_In_ProgressNumber = myTravel_In_Progress.size();      
        post_Travel = [Select Treatment__r.Phase__c, Treatment__r.Stage__c, Treatment__r.Patient__r.Name, Procedure__r.Name, Treatment__r.Travel__r.Travel_End__c,
                              Procedure__r.Doctor__r.Name, Procedure__r.Facility__r.Name, Treatment__r.Patient__r.Phone__c, Treatment__r.LastModifiedDate, 
                              Treatment__r.Patient__r.Last_Communication__c, Treatment__r.OwnerId 
                              From Treatment_Quote__c 
                              Where Treatment__r.Phase__c = : PickListDefines.Phase.PostOp 
                                    And Treatment__r.Active_Status__c = : PickListDefines.ActiveStatus.Active
                                    And Treatment__r.Engagement_Type__c = :PickListDefines.EngagementType.Treatment 
                                    And Treatment__r.OwnerId = :userinfo.getUserId()
                              Order By Treatment__r.Travel__r.Travel_End__c];                              
        post_TravelNumber = post_Travel.size();
        myPost_Travel = new List<Treatment_Quote__c>();
        for (Treatment_Quote__c q : post_Travel)
        {
          if ( q.Treatment__r.OwnerId == UserInfo.getUserId() )
          {
             myPost_Travel.add(q);
          }           
        }  
        myPost_TravelNumber = myPost_Travel.size();          
        on_hold = [Select Patient__r.Name, Patient__r.Phone__c, LastModifiedDate, Next_Follow_Up__c, Procedure_Category__c, Procedure__c, Patient__r.Last_Communication__c,
                          OwnerId 
                              From Treatment__c 
                              Where Phase__c = : PickListDefines.Phase.Interaction 
                                    And Active_Status__c = : PickListDefines.ActiveStatus.OnHold
                                    And Engagement_Type__c = :PickListDefines.EngagementType.Treatment 
                                    And OwnerId = :userinfo.getUserId()
                              Order By Next_Follow_Up__c];
        on_holdNumber = on_hold.size();
        myOn_hold = new List<Treatment__c>(); 
        for (Treatment__c t : on_hold)
        {
          if ( t.OwnerId == UserInfo.getUserId() )
          {
             myOn_hold.add(t);
          }           
        }
        myOn_holdNumber = myOn_hold.size();                                                                    
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
       Logger.info('Exception: ' + e);
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