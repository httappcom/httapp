public without sharing class messaging_Controller {
/*
    a User associated with 1 medical facility should not be able to interact with a user from another medical facility
*/

    private id thisUserCareTeamId;
    
    public Id treatmentId; 
    public void setTreatmentId(Id i) {
        treatmentId = i;
system.debug('setting treatment to '+i);
        careTeamMemberCache = null;
        clearFilterBy();
        mode = 'TextPost';
        setTreatment(treatmentId);
    }
    
    public Id getTreatmentId() {
        return treatmentId;
    }
    public static Treatment__c treatment;
    public void setTreatment(Id i) {
        treatment = [Select Id, Destination_Facility__c, OwnerId From Treatment__c Where Id = :i ];
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
        public Id RelatedRecordId {get;set;}
        public Id ParentId {get;set;}
        public Id InsertedById {get;set;}
        public Id FeedItemId {get;set;}
        public DateTime CreatedDate {get;set;}
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
            CreatedById = c.CreatedById;
            CreatedByName = c.CreatedBy.Name;
            CommentType = '';
            CommentBody = c.Body__c;
            recordId = c.Id;
        }
        public commentWrapper(id pId){
            ParentId = pId;
        }
    }

    public class messageWrapper {
        public Attachment attachment {get;set;}
        public String body {get;set;}
        public List<commentWrapper> comments {get;set;}
        public Id createdById {get;set;}
        public String createdByName {get;set;}
        public DateTime createdDateTime {get;set;}
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
        }
        public messageWrapper(Communication__c c){
            attachment = new Attachment();
            body = fixNulls(c.Body__c);
            comments = new List<commentWrapper>();
            for ( Communication__c cc : c.Communications__r ){
                comments.add(new commentWrapper(cc));
            }
            createdById = c.CreatedById;
            createdByName = fixNulls(c.CreatedBy.Name);
            createdDateTime = c.CreatedDate;
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

        public PageReference addNewComment(){
            showNewComment = true;
            return null;
        }

        public PageReference insertNewComment(){
            Communication__c comment = new Communication__c();
            comment.Body__c = newComment.CommentBody;
            comment.Communication__c = newComment.ParentId;
            insert comment;
            
            newComment = new commentWrapper(newComment.ParentId);
            return null;
        }
    } 

    public String mode {get;set;}
    public String topicId {get;set;}
    public ID memberId {get; set; }
    public Care_Team_Member__c newCareTeamMember {get;set;}
    public Topic__c newTopic {get;set;}
    public Task newTask {get;set;}

        
    public messaging_Controller(){
        clearFilterBy();
        mode = 'TextPost';
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
            careTeamMemberCache = null;
//          newCareTeamMember = null;
        } else {
            
        }
        return null;
    }

    public PageReference insertNewMessage(){
        Communication__c c = new Communication__c();
        c.Body__c = newMessage.Body;
        if ( newMessage.linkURL != null ){
            if ( newMessage.linkURL.contains('http://') || newMessage.linkURL.contains('https://') ){
                c.Link_URL__c = newMessage.linkURL;
            } else {
                c.Link_URL__c = 'http://'+newMessage.linkURL;
            }
        }
        if ( newMessage.linkName != null ){
            c.Link_Name__c = newMessage.linkName;
        }
        c.Type__c = mode;
        if ( newMessage.parentId != null ) {
            String objectType = newMessage.parentId.getSObjectType()+''; 
            if ( objectType == 'Topic__c' ){
                c.Topic__c = newMessage.parentId;
            } else
            if ( objectType == 'Treatment__c' ){
                c.Treatment__c = newMessage.parentId;
            } else
            if ( objectType == 'Care_Team_Member__c' ){
                c.Care_Team_Member__c = newMessage.parentId;
                c.From_User__c = thisUserCareTeamId;
            }
            insert c;
            if ( mode == 'ContentPost' ){
                newMessage.Attachment.ParentId = c.Id;
                insert newMessage.Attachment;
                c.File_Id__c = newMessage.Attachment.Id;
                c.File_Name__c = newMessage.Attachment.Name;
                update c;
            }
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
        String queryString = 'SELECT ';
        queryString += 'Id, Body__c, Communication__c, Communication__r.Name, CreatedById, CreatedBy.Name, CreatedDate, File_Id__c, File_Name__c, Link_Name__c, Link_Url__c, Title__c, Topic__c, Topic__r.Name, Type__c, ';
        queryString += '(SELECT Id, Body__c, Communication__c, CreatedDate, CreatedBy.Name FROM Communications__r order BY CreatedDate LIMIT 10) ';
        queryString += ' FROM Communication__c ';
        queryString += ' where ';
        if (memberId != null && topicId == null) {
            if (memberId == this.thisUserCareTeamId) {
                //Private Message from this User
                queryString += 'From_User__c = \''+String.escapeSingleQuotes(thisUserCareTeamId) +'\' or ';
                queryString += 'Care_Team_Member__c = \''+String.escapeSingleQuotes(thisUserCareTeamId) +'\' ';
            } else {
                queryString += '(From_User__c = \''+String.escapeSingleQuotes(thisUserCareTeamId) +'\' and ';
                queryString += 'Care_Team_Member__c = \''+String.escapeSingleQuotes(memberId) +'\') or ';
                queryString += '(From_User__c = \''+String.escapeSingleQuotes(memberId) +'\' and ';
                queryString += 'Care_Team_Member__c = \''+String.escapeSingleQuotes(thisUserCareTeamId) +'\')  ';
            }
        } else if (memberId == null && topicId == null) {
            queryString += 'From_User__c = \''+String.escapeSingleQuotes(thisUserCareTeamId) +'\' or ';
            queryString += 'Care_Team_Member__c = \''+String.escapeSingleQuotes(thisUserCareTeamId) +'\' or ';
            queryString += 'Topic__r.Treatment__c = \''+String.escapeSingleQuotes(treatmentId) +'\' ';
        } else {
            queryString += 'Topic__c = \''+String.escapeSingleQuotes(topicId) +'\' ';
        }
        queryString += ' order by CreatedDate DESC';
        queryString += ' limit 20';
        MessageList = new List<messageWrapper>();
system.debug('qry='+queryString);
        for ( Communication__c n : database.query(queryString) ){
            MessageList.add(new messageWrapper(n));
        }
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

    public PageReference selectTextmode(){
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
        if (treatment.Destination_Facility__c != null) {
            User[] medFacilityUsers = AccessUtil.getMedicalFacilityUsers(treatment.Destination_Facility__c);
            for (User u : medFacilityUsers) {
                Care_Team_Member__c careTeamCandidate = new Care_Team_Member__c();
                careTeamCandidate.User__c = u.Id;
                careTeamCandidate.Role__c = 'PCC';
                careTeamCandidate.Treatment__c = treatmentId;       
                careTeamCandidate.Name = u.Name;
                careTeamCandidates.add(careTeamCandidate);
            }
        }

    }
     
    private void addPRMConfigUsers() {
        List<User> prmUsers = AccessUtil.getFacilitatorOrgUsers();
        for (User u : prmUsers ) {
            Care_Team_Member__c careTeamCandidate = new Care_Team_Member__c();
            careTeamCandidate.User__c = u.Id;
            careTeamCandidate.Role__c = 'PCC';
            careTeamCandidate.Treatment__c = treatmentId;       
            careTeamCandidate.Name = u.Name;
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
    for(Care_Team_Member__c u : careTeamMembers)
    {
        disabled = false;
      if ( (u.Role__c == 'Patient') || (treatment.OwnerId == u.User__c) )
        {
            disabled = true;
            Logger.info('Disabled User: ' + u.Name);
        }       
        options.add(new SelectOption(u.Id, u.Name, disabled));
    }
    return options;
  }
  
  private List<Care_Team_Member__c> careTeamMemberCache = null;
  public List<Care_Team_Member__c> getCareTeamMemberList() {
    if (treatmentId==null) return null;
 system.debug('getCareTeamMemberList treatmentId='+treatmentId);
    if (careTeamMemberCache == null) {
        careTeamMemberCache = [Select Id, Name, User__c, Role__c from Care_Team_Member__c where Treatment__c =:treatmentId order by Name];
 system.debug('userInfo.getUserId()='+userInfo.getUserId());
 system.debug('careTeamMemberCache='+careTeamMemberCache);
        for (Care_Team_Member__c m : careTeamMemberCache) {
            if (m.User__c == userInfo.getUserId()) {
                thisUserCareTeamId = m.Id;
            }
        }
    }
    return careTeamMemberCache;
  }
}