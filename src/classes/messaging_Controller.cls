public without sharing class messaging_Controller {
/*
    a User associated with 1 medical facility should not be able to interact with a user from another medical facility
*/

    private id thisUserCareTeamId;
    
    public ID currentUserId { get; set; }
    
    public Id treatmentId; 
    public void setTreatmentId(Id newId) {
    	if (treatmentId != newId) {
	        treatmentId = newId;
    	    careTeamMemberMap = null;
        	clearFilterBy();
	        mode = 'Text';
    	    setTreatment(treatmentId);
    	}
    }
    
    public Id getTreatmentId() {
        return treatmentId;
    }
    public static Treatment__c treatment;
    public void setTreatment(Id i) {
        treatment = [Select Id, Destination_Facility__c, Assigned_To__c From Treatment__c Where Id = :i ];
    }
    public Treatment__c getTreatment() {
        return treatment;
    }
    
    public messageWrapper newMessage {get;set;}
    List<Care_Team_Member__c> careTeamMembers = new List<Care_Team_Member__c>();
    List<Care_Team_Member__c> careTeamCandidates = new List<Care_Team_Member__c>();
    String[] addedCareTeamMembers = new String[]{};
    String[] removedCareTeamMembers = new String[]{};
    public String[] getaddedCareTeamMembers() {
        return this.addedCareTeamMembers;
    }
    public void setAddedCareTeamMembers(String[] addedMembers) {
        this.addedCareTeamMembers = addedMembers;
    }
    public String[] getremovedCareTeamMembers() {
        return this.removedCareTeamMembers;
    }
    public void setRemovedCareTeamMembers(String[] removedMembers) {
        this.removedCareTeamMembers = removedMembers;
    }
    
    public class commentWrapper {
    	private Private_Message__c parentMsg;
        public Id RelatedRecordId {get;set;}
        public Id ParentId {get;set;}
        public Id InsertedById {get;set;}
        public Id FeedItemId {get;set;}
        public DateTime CreatedDate {get;set;}
        public UILookup__c lu {get; private set;}
        public Id CreatedById {get;set;}
        public String CreatedByName {get;set;}
        public String CommentType {get;set;}
        public String CommentBody {get;set;}
        public Id recordId {get;set;}
        public commentWrapper(){
            
        }
        public commentWrapper(Communication__c c){
            RelatedRecordId = null; 
            ParentId = null;
            InsertedById = c.CreatedById;
            FeedItemId = c.Communication__c;
            CreatedDate = c.CreatedDate;
            lu = new UILookup__c(Timestamp__c=CreatedDate);
            CreatedById = c.CreatedById;
            CreatedByName = c.CreatedBy.Name;
            CommentType = '';
            CommentBody = c.Body__c;
            recordId = c.Id;
        }
        public commentWrapper(Private_Message_Comment__c comment){
            RelatedRecordId = null; 
            ParentId = null;
            InsertedById = comment.CreatedById;
            FeedItemId = comment.Private_Message__c;
            CreatedDate = comment.CreatedDate;
            lu = new UILookup__c(Timestamp__c=CreatedDate);
            CreatedById = comment.CreatedById;
            CreatedByName = comment.CreatedBy.Name;
            CommentType = '';
            CommentBody = comment.Body__c;
            recordId = comment.Id;
        }
        public commentWrapper(Private_Message__c parentMessage){
        	parentMsg = parentMessage;
            ParentId = parentMsg.id;
            lu = new UILookup__c();
        }
        public commentWrapper(Id pId){
            ParentId = pId;
            lu = new UILookup__c();
        }
    }

    public class messageWrapper implements Comparable {
    	public ID tId;
        public Attachment attachment {get;set;}
        public String body {get;set;}
        public List<commentWrapper> comments {get;set;}
        public Id createdById {get;set;}
        public String createdByName {get;set;}
        public DateTime createdDateTime {get;set;}
        public UILookup__c lu {get; private set;}
        public String fileId {get;set;}
        public String fileName {get;set;}
        public String linkURL {get;set;}
        public String linkName {get;set;}
        public String messageType {get;set;}
        public commentWrapper newcomment {get;set;} 
        public Id parentId {get;set;}
        public String parentName {get;set;}
        public Id recordId {get;set;}
        public Boolean showNewComment {get;set;}
        public String title {get;set;}
        public messageWrapper(){
            attachment = new Attachment();
            showNewComment = false;
            lu = new UILookup__c();
        }
		public Integer compareTo(Object compareTo) {
			MessageWrapper compareToMsg = (MessageWrapper)compareTo;
			if (createdDateTime<compareToMsg.createdDateTime) return 1;
			if (createdDateTime==compareToMsg.createdDateTime) return 0;
			return -1;
		}
        public messageWrapper(Communication__c c){
        	tId = c.Treatment__c;
            attachment = new Attachment();
            body = fixNulls(c.Body__c);
            comments = new List<commentWrapper>();
            for ( Communication__c cc : c.Communications__r ){
                comments.add(new commentWrapper(cc));
            }
            createdById = c.CreatedById;
            createdByName = fixNulls(c.CreatedBy.Name);
            createdDateTime = c.CreatedDate;
            lu = new UILookup__c(Timestamp__c=createdDateTime);
            fileId = c.File_Id__c;
            fileName = c.File_Name__c;
            linkName = c.link_Name__c;
            linkURL = c.link_URL__c;
            messageType = c.Type__c;
            if ( c.Topic__c != null ){
                parentId = c.Topic__c;
            }
            newComment = new commentWrapper(c.Id);
//          parentName = nf.Parent.Name;
            recordId = c.Id;
            showNewComment = false;
            title = fixNulls(c.Title__c);
        }

        public messageWrapper(Private_Message__c msg) {
            attachment = new Attachment();
            body = fixNulls(msg.Body__c);
            comments = new List<commentWrapper>();
            for ( Private_Message_Comment__c comment : msg.Private_Message_Comments__r ) {
                comments.add(new commentWrapper(comment));
            }
            createdById = msg.Sender__c;
            createdByName = fixNulls(msg.Sender__r.Name);
            createdDateTime = msg.CreatedDate;
            lu = new UILookup__c(Timestamp__c=createdDateTime);
            messageType = 'Text';
            newComment = new commentWrapper(msg);
            recordId = msg.Id;
            showNewComment = false;
        }

        public PageReference addNewComment(){
            showNewComment = true;
            lu = new UILookup__c();
            return null;
        }

        public PageReference insertNewComment(){
            if ((newComment.ParentId.getSObjectType()+'') == 'Communication__c') {
            	Communication__c comment = new Communication__c();
	            comment.Body__c = newComment.CommentBody;
    	        comment.Communication__c = newComment.ParentId;
        	    comment.Treatment__c = tId;
            	insert comment;
            } else {
            	Private_Message_Comment__c comment = new Private_Message_Comment__c(
            		Private_Message__c = newComment.ParentId,
            		Body__c = newComment.CommentBody,
            		Recipient__c=UserInfo.getUserId()==newComment.parentMsg.Sender__c?newComment.parentMsg.Recipient__c:UserInfo.getUserId());
            	insert comment;
            }
            newComment = new commentWrapper(newComment.ParentId);
            return null;
        }
    } 

    public String mode {get;set;}
    public String topicId {get;set;}
    public String getPostButtonLabel() {
    	if (newMessage==null || newMessage.parentId==null) return 'Share';
    	return (newMessage.ParentId.getSObjectType()+'')=='Topic__c'?'Share':'Send Private Message';
    } 
    public ID memberId {get; set; }
    public Care_Team_Member__c newCareTeamMember {get;set;}
    public Topic__c newTopic {get;set;}
    public Task newTask {get;set;}

        
    public messaging_Controller(){
        clearFilterBy();
        mode = 'Text';
    }

	public PageReference postTopicChanged() {
		return null;
	}
    public PageReference addNewCareTeamMember(){
        newTopic = null;
        newCareTeamMember = new Care_Team_Member__c();
        newCareTeamMember.Treatment__c = treatmentId;
        return null;
    }

    public PageReference addNewTopic(){
        newCareTeamMember = null;
        newTopic = new Topic__c();
      	newTopic.Treatment__c = treatmentId;
        return null;
    }
    
    public PageReference insertNewCareTeamMember(){
        if ( newCareTeamMember.User__c != null && newCareTeamMember.Role__c != null ) {
            CareTeamUtil.addMembersToCareTeam( new List<Care_Team_Member__c>{newCareTeamMember});
            careTeamMemberMap = null;
//          newCareTeamMember = null;
        } else {
            
        }
        return null;
    }

    public PageReference insertNewMessage(){
        if ( newMessage.parentId != null ) {
            String objectType = newMessage.parentId.getSObjectType()+'';
  system.debug('objectType='+objectType+', treatmdntId='+treatmentId); 
            if ( objectType == 'Topic__c' ){
			        Communication__c comm = new Communication__c();
	    	      comm.Treatment__c = treatmentId;
	    		    comm.Body__c = newMessage.Body;
	        		if ( newMessage.linkURL != null ){
	            		if ( newMessage.linkURL.contains('http://') || newMessage.linkURL.contains('https://') ){
	                		comm.Link_URL__c = newMessage.linkURL;
			            } else {
	    		            comm.Link_URL__c = 'http://'+newMessage.linkURL;
	        		    }
		        	}
		    	    if ( newMessage.linkName != null ){
	    	    	    comm.Link_Name__c = newMessage.linkName;
	        		}
			    		comm.Type__c = mode;
			        comm.Topic__c = newMessage.parentId;
					    if (careTeamMembers.isEmpty()) careTeamMembers = getCareTeamMemberList();
			        comm.Notification_Recipients__c = '';
			        for (Care_Team_Member__c ctm : careTeamMembers)
			        {
			        	if (ctm.User__c != userInfo.getUserId() && ctm.Role__c != 'Patient' && ctm.Role__c != 'Doctor')
			        	{
			        		comm.Notification_Recipients__c += (String)ctm.User__c + ',';
			        	}			        	
			        }
			        comm.Notification_Recipients__c = comm.Notification_Recipients__c.subString(0, comm.Notification_Recipients__c.length() - 1); 
			        insert comm;
            } else
            if ( objectType == 'Care_Team_Member__c' ) {
	            ID senderUserId = UserInfo.getUserId();
    	        Care_Team_Member__c crMember = [select User__c, User__r.UserType from Care_Team_Member__c where id=:newMessage.parentId limit 1];
        	    ID recipientUserId = crMember.User__c;
        	    Boolean reassignOwnership = crMember.User__r.UserType=='Standard' && UserInfo.getUserType()=='CSPLitePortal'; 
            	Private_Message__c privateMsg = new Private_Message__c(
            		OwnerId=reassignOwnership?recipientUserId:senderUserId, 
            		Body__c=newMessage.Body, Sender__c=senderUserId, Recipient__c=recipientUserId );
            	insert privateMsg;
            	if (crMember.User__r.UserType=='Standard' && privateMsg.OwnerId!=recipientUserId) PrivateMessageUtil.addSharing(privateMsg);
            }
/*            if ( mode == 'ContentPost' ) {
                newMessage.Attachment.ParentId = comm.Id;
                insert newMessage.Attachment;
                comm.File_Id__c = newMessage.Attachment.Id;
                comm.File_Name__c = newMessage.Attachment.Name;
                update comm;
            }*/
        }
        newMessage = new messageWrapper();
        return null;
    }

    public PageReference insertNewTopic(){
        insert newTopic;
        topicId = newTopic.Id;
        newTopic = null;
        return null;
    }

    public List<SelectOption> getTopicOptions(){
        List<SelectOption> options = new List<SelectOption>();
        if ( treatmentId != null ){
            for ( Topic__c t : [Select Id, Name from Topic__c 
            	where Treatment__c = :treatmentId order by Name]){
                options.add(new SelectOption(t.Id,t.Name));
            }
            for ( Care_Team_Member__c c : getCareTeamMemberList()){
                if (c.User__c != userInfo.getUserId()) {
                    options.add(new SelectOption(c.Id,c.Name));
                }
            }
        }
        return options;
    }

    public List<Topic__c> getTopicList() {
        return [Select Id, Name, Treatment__c, Treatment__r.Treatment_Name__c from Topic__c where Treatment__c = :treatmentId order by Name];
    }

    public String messagingAlert {get;set;}
    public PageReference pollNewsFeed(){
//      queryNewsFeed();
        return null;
    }

    List<messageWrapper> MessageList;
    public List<messageWrapper> getMessageList(){
        if (treatmentId == null) return null;
system.debug('getMessageList called topicId='+topicId+', memberId='+memberId+', thisUserCareTeamId='+thisUserCareTeamId);
        if (thisUserCareTeamId == null) getCareTeamMemberList();
system.debug('thisUserCareTeamId 2='+thisUserCareTeamId);
	    MessageList = new List<messageWrapper>();
	
		if (topicId != null || memberId == null) {
	        String queryString = 'SELECT ';
    	    queryString += 'Id, Treatment__c, Body__c, Communication__c, Communication__r.Name, CreatedById, CreatedBy.Name, CreatedDate, File_Id__c, File_Name__c, Link_Name__c, Link_Url__c, Title__c, Topic__c, Topic__r.Name, Type__c, ';
        	queryString += '(SELECT Id, Body__c, Communication__c, CreatedDate, CreatedBy.Name FROM Communications__r order BY CreatedDate LIMIT 10) ';
	        queryString += ' FROM Communication__c ';
        	queryString += ' where ';
        	if (topicId == null) {
    	        queryString += 'Topic__r.Treatment__c = \''+String.escapeSingleQuotes(treatmentId) +'\' ';
        	} else {
            	queryString += 'Topic__c = \''+String.escapeSingleQuotes(topicId) +'\' ';
        	}
	        queryString += ' order by CreatedDate DESC';
    	    queryString += ' limit 20';
system.debug('qry='+queryString);
	        for ( Communication__c n : database.query(queryString) ){
    	        MessageList.add(new messageWrapper(n));
        	}
		}
		if (topicId==null) {
	        String queryString = 'SELECT ';
    	    queryString += 'Id, Parent__c, Body__c, CreatedDate, Sender__c, Sender__r.Name, Recipient__c, ';
        	queryString += '(SELECT Id, Private_Message__c, Body__c, CreatedDate, CreatedById, CreatedBy.Name  FROM Private_Message_Comments__r order BY CreatedDate LIMIT 10) ';
	        queryString += ' FROM Private_Message__c ';
   	    	queryString += ' where ';
			ID thisUserId = UserInfo.getUserId();
        	if (memberId != null) {
				ID selectedUserId = lookupCareTeamMemberUserId( memberId );
            	if (memberId == this.thisUserCareTeamId) {
                	//Private Message from this User
	                queryString += 'Sender__c = \''+thisUserId +'\' or ';
    	            queryString += 'Recipient__c = \''+thisUserId +'\' ';
        	    } else {
            	    queryString += '(Sender__c = \''+thisUserId +'\' and ';
                	queryString += 'Recipient__c = \''+selectedUserId +'\') or ';
	                queryString += '(Sender__c = \''+selectedUserId +'\' and ';
    	            queryString += 'Recipient__c = \''+thisUserId +'\')  ';
        	    }
        	} else {
                queryString += 'Sender__c = \''+thisUserId +'\' or ';
   	            queryString += 'Recipient__c = \''+thisUserId +'\' ';
        	}
	        queryString += ' order by CreatedDate DESC';
    	    queryString += ' limit 20';
system.debug('qry='+queryString);
	        for ( Private_Message__c n : database.query(queryString) ){
    	        MessageList.add(new messageWrapper(n));
        	}
		}
		MessageList.sort();
        return MessageList;
    }

    
    public PageReference selectTopicFilter(){
system.debug('selectFilterBy action topicId='+topicId);
        newMessage.ParentId = topicId;
        memberId = null;
        newTopic = null;
        newCareTeamMember = null;
        return null;
    }

    public PageReference selectMemberFilter(){
        newMessage.ParentId = memberId;
        topicId = null;
        newTopic = null;
        newCareTeamMember = null;
        return null;
    }

    public PageReference clearFilterBy(){
        topicId = null;
        memberId = null;
        newCareTeamMember = null;
        newMessage = new messageWrapper();
        newTopic = null;
        return null;        
    }

    public PageReference selectTextmode() {
   system.debug('selectTextMode');
        mode = 'Text';
        return null;
    }

    public PageReference selectFileMode(){
        mode = 'Content';
        return null;
    }
    
    public PageReference selectLinkMode(){
        mode = 'Link';
        return null;
    }

    public PageReference selectTaskMode(){
        mode = 'Task';
        return null;
    }

    public static String fixNulls(String s){
        if ( s == null ){
            s = '';
        }
        return s;
    }
    
    public PageReference addCareTeamMembers() {
        Logger.info('addedCareTeamMembers: ' + addedCareTeamMembers);    
        for (String m : addedCareTeamMembers) {
            for (Integer i = 0; i < careTeamCandidates.size(); i++) {
                if (careTeamCandidates[i].User__c == m) {
                    careTeamMembers.add(careTeamCandidates[i]);
                    newCareTeamMember = careTeamCandidates[i];
                    insertNewCareTeamMember();
                    careTeamCandidates.remove(i); 
                }
            }
        }
        return null;
    }
    
    public PageReference closeNewTeamMember()
    {
        newCareTeamMember = null;
        return null;
    }  
  public PageReference removeCareTeamMembers()
  {         
    for (String m : removedCareTeamMembers)
    {
      
      for (Care_Team_Member__c ctm : careTeamMembers)
      {
        if (ctm.Id == m) 
        {      
            Care_Team_Member__c newCareTeamMbr = new Care_Team_Member__c();
            newCareTeamMbr = ctm.clone(false,true);         
            careTeamCandidates.add(newCareTeamMbr);
            delete ctm;             
        }
      }     
      Integer i = 0;
      while (i < careTeamMembers.size())
      {
        if(careTeamMembers.get(i).Id == m) { careTeamMembers.remove(i); }
        else { i++; }       
      } 
    }         
    return null;
  }  
  
    private void addMedicalFacilityUsers() {
    	Logger.info('Treatment(addMedicalFacilityUsers): ' + treatment);
    	if (treatment == null) setTreatment(treatmentId);
        if (treatment.Destination_Facility__c != null) {
            Medical_Facility_User__c[] medFacilityUsers = AccessUtility.getMedicalFacilityUsers(treatment.Destination_Facility__c);
            for (Medical_Facility_User__c u : medFacilityUsers) {
                Care_Team_Member__c careTeamCandidate = new Care_Team_Member__c();
                careTeamCandidate.User__c = u.User__c;
                careTeamCandidate.Role__c = 'PCC';
                careTeamCandidate.Treatment__c = treatmentId;       
                careTeamCandidate.Name = u.User__r.Name;
                careTeamCandidates.add(careTeamCandidate);
            }
        }

    }
     
    private void addPRMConfigUsers() {
        List<Prm_User__c> prmUsers = AccessUtility.getFacilitatorOrgUsers();
        for (Prm_User__c u : prmUsers ) {
            Care_Team_Member__c careTeamCandidate = new Care_Team_Member__c();
            careTeamCandidate.User__c = u.User__c;
            careTeamCandidate.Role__c = 'PCC';
            careTeamCandidate.Treatment__c = treatmentId;       
            careTeamCandidate.Name = u.User__r.Name;
            careTeamCandidates.add(careTeamCandidate);
        }
    }
    
  private void addMedProfessionalUsers()
  {
    List<Medical_Professional__c> doctors = new List<Medical_Professional__c>();  
    if (treatment.Destination_Facility__c != null)
    {
      doctors = [ Select Key_Contact__c 
                  From Medical_Professional__c 
                  Where Medical_Facility__c = :treatment.Destination_Facility__c 
                    And Role__c = 'Doctor'
                    And Key_Contact__c != NULL];
    }
    else
    {
      doctors = [ Select Key_Contact__c 
                  From Medical_Professional__c 
                  Where Role__c = 'Doctor'
                    And Key_Contact__c != NULL];        
    }
    List<Id> contactIds = new List<Id>();
    for (Medical_Professional__c d : doctors)
    {
        contactIds.add(d.Key_Contact__c);
    }
    List<User> doctorUsers = new List<User>();
    doctorUsers = [Select Id, Email, Name from User Where User.ContactId IN : contactIds];
    for (User u : doctorUsers )
      {
        Care_Team_Member__c careTeamCandidate = new Care_Team_Member__c();
        careTeamCandidate.User__c = u.Id;
        careTeamCandidate.Role__c = 'Doctor';  
        careTeamCandidate.Treatment__c = treatmentId;       
        careTeamCandidate.Name = u.Name;
        careTeamCandidates.add(careTeamCandidate);
      }
  }                                           
  
  public List<Care_Team_Member__c> getCareTeamCandidates()
  {
  	Logger.info('Treatment(getCareTeamCandidates): ' + treatment);
    addMedicalFacilityUsers();
    addPRMConfigUsers();
    addMedProfessionalUsers();
//    addInsuranceNetworkUsers();
    Set<Id> userIdSet = new Set<Id>();
    List<Care_Team_Member__c> resultList = new List<Care_Team_Member__c>();
    if (careTeamMembers.isEmpty() == true)
    {
        careTeamMembers = getCareTeamMemberList();
    }
    Logger.info('careTeamMembers: ' + careTeamMembers);
    for (Care_Team_Member__c ctm : careTeamMembers)
    {
        userIdSet.add(ctm.User__c);
    }

    for (Care_Team_Member__c u : careTeamCandidates)
    {
      if (userIdSet.add(u.User__c)) {resultList.add(u);} //to remove duplicates and Users already in care team
    }
    careTeamCandidates.clear();
    Logger.info('resultList: ' + resultList);
    careTeamCandidates = resultList.deepClone(true); 
    Logger.info('careTeamCandidates: ' + careTeamCandidates);
    return careTeamCandidates;
  }  
  public List<SelectOption> getCareTeamCandidateNames()
  {
  	Logger.info('Treatment(getCareTeamCandidateNames): '+treatment);
    if (careTeamCandidates.isEmpty() == true)
    {
        careTeamCandidates = getCareTeamCandidates();
    }
    Logger.info('careTeamCandidates: '+careTeamCandidates);
    List<SelectOption> options = new List<SelectOption>();
    for (Care_Team_Member__c candidate: careTeamCandidates)
    {
      options.add(new SelectOption(candidate.User__c, candidate.Name));
    }   
    return options;
  }
  public List<SelectOption> getCareTeamMemberNames()
  {
   if (careTeamMembers.isEmpty() == true)
    {
      careTeamMembers = getCareTeamMemberList();
    }
    List<SelectOption> options = new List<SelectOption>(); 
    Boolean disabled = false; 
    if (treatment == null) setTreatment(treatmentId);  
    for(Care_Team_Member__c u : careTeamMembers)
    {
        disabled = false;
      if ( (u.Role__c == 'Patient') || (treatment.Assigned_To__c == u.User__c) )
        {
            disabled = true;
            Logger.info('Disabled User: ' + u.Name);
        }       
        options.add(new SelectOption(u.Id, u.Name, disabled));
    }
    return options;
  }
  
  	private Map<ID,Care_Team_Member__c> careTeamMemberMap = null;
  	public List<Care_Team_Member__c> getCareTeamMemberList() {
    	if (treatmentId==null) return null;
 system.debug('getCareTeamMemberList treatmentId='+treatmentId);
    	if (careTeamMemberMap == null) {
        	careTeamMemberMap = new Map<ID,Care_Team_Member__c>([Select Id, Name, User__c, Role__c from Care_Team_Member__c where Treatment__c =:treatmentId order by Name]);
 system.debug('userInfo.getUserId()='+userInfo.getUserId());
 system.debug('careTeamMemberMap='+careTeamMemberMap.values());
        	for (Care_Team_Member__c m : careTeamMemberMap.values()) {
            	if (m.User__c == userInfo.getUserId() || (currentUserId!=null && m.User__c == currentUserId)) {
                	thisUserCareTeamId = m.Id;
            	}
        	}
    	}
    	return careTeamMemberMap.values();
  	}
  
  	private ID lookupCareTeamMemberUserId( ID careTeamMemberId ) {
  		Care_Team_Member__c member = careTeamMemberMap.get(careTeamMemberId);
  		return member==null?null:member.User__c;
  	}
  	
}