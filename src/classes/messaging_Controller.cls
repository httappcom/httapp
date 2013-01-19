public without sharing class messaging_Controller {
/*
	a User associated with 1 medical facility should not be able to interact with a user from another medical facility
*/

	public Id patientId;
	public void setPatientId(Id i){
		patientId = i;
	}
	public Id getPatientId(){
		return patientId;
	}

	public Id treatmentId {
		get;
		set{
			treatmentId = value;
//			if ( patientId == null && treatmentId != null ){
//				List<Treatment__c> t = [Select Id, Patient__c from Treatment__c where Id =:treatmentId limit 1];
//				patientId = t[0].Patient__c;
//			}
		}
	}

	public messageWrapper newMessage {get;set;}

	public class commentWrapper{
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
			} else
			if ( c.Patient__c != null ){
				parentId = c.Patient__c;
			}
			newComment = new commentWrapper(c.Id);
//			parentName = nf.Parent.Name;
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
	public String selectedFilterBy {get;set;}
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
		newTopic.Patient__c = patientId;
//		newTopic.Treatment__c = treatmentId;
		return null;
	}
	
	public PageReference insertNewCareTeamMember(){
		if ( newCareTeamMember.User__c != null && newCareTeamMember.Role__c != null ){
			insert newCareTeamMember;
			newCareTeamMember = null;
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
		if ( newMessage.parentId != null ){
			if ( string.valueOf(newMessage.parentId).subString(0,3) == 'a0T' ){
				c.Topic__c = newMessage.parentId;
			} else
			if ( string.valueOf(newMessage.parentId).subString(0,3) == 'a08' ){
				c.Patient__c = newMessage.parentId;
			} else
			if ( string.valueOf(newMessage.parentId).subString(0,3) == 'a0F' ){
				c.Treatment__c = newMessage.parentId;
			} else
			if ( string.valueOf(newMessage.parentId).subString(0,3) == 'a03' ){
				c.Care_Team_Member__c = newMessage.parentId;
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
		selectedFilterBy = newTopic.Id;
		newTopic = null;
		return null;
	}

	public List<SelectOption> getTopicOptions(){
		List<SelectOption> options = new List<SelectOption>();
		if ( patientId != null ){
			for ( Topic__c t : [Select Id, Name, Patient__c from Topic__c where Patient__c = :patientId order by Name]){
				options.add(new SelectOption(t.Id,t.Name));
			}
			for ( Care_Team_Member__c c : [Select Id, Name from Care_Team_Member__c where Treatment__c =:treatmentId order by Name]){
				options.add(new SelectOption(c.Id,c.Name));
			}
		}
		return options;
	}

	public List<Topic__c> getTopicList() {
		return [Select Id, Name, Treatment__c, Treatment__r.Treatment_Name__c, Patient__c from Topic__c where Patient__c = :patientId order by Name];
	}

	public List<Care_Team_Member__c> getCareTeamMemberList() {
		return [Select Id, Name from Care_Team_Member__c where Treatment__c =:treatmentId order by Name];
	}

	public String messagingAlert {get;set;}
	public PageReference pollNewsFeed(){
//		queryNewsFeed();
		return null;
	}

	List<messageWrapper> MessageList;
	public List<messageWrapper> getMessageList(){
		String queryString = 'SELECT ';
		queryString += 'Id, Body__c, Communication__c, Communication__r.Name, CreatedById, CreatedBy.Name, CreatedDate, File_Id__c, File_Name__c, Link_Name__c, Link_Url__c, Patient__c, Patient__r.Name, Title__c, Topic__c, Topic__r.Name, Type__c, ';
		queryString += '(SELECT Id, Body__c, Communication__c, CreatedDate, CreatedBy.Name FROM Communications__r order BY CreatedDate LIMIT 10) ';
		queryString += ' FROM Communication__c ';
		queryString += ' where ';
		if ( selectedFilterBy != null && selectedFilterBy instanceOf Id){
			queryString += 'Topic__c = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' or ';
			queryString += 'Treatment__c = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' or ';
			queryString += 'Care_Team_Member__c = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' or ';
			queryString += 'Patient__c = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' or ';
			queryString += 'CreatedById = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' ';
		} else 
		if ( patientId != null ){
			queryString += 'Patient__c = \''+String.escapeSingleQuotes(patientId) +'\' or ';
			queryString += 'Treatment__r.Patient__c = \''+String.escapeSingleQuotes(patientId) +'\' or ';
			queryString += 'Topic__r.Treatment__r.Patient__c = \''+String.escapeSingleQuotes(patientId) +'\' or ';
			queryString += 'Care_Team_Member__r.Treatment__r.Patient__c = \''+String.escapeSingleQuotes(patientId) +'\' ';
		} else {
			queryString += 'CreatedById = \''+ userInfo.getUserId() + '\' ';
		}
		queryString += ' order by CreatedDate DESC';
		queryString += ' limit 20';
		MessageList = new List<messageWrapper>();
		for ( Communication__c n : database.query(queryString) ){
			MessageList.add(new messageWrapper(n));
		}
		return MessageList;
	}

	
	public PageReference selectFilterBy(){
		if ( selectedFilterBy == null && apexPages.currentPage().getParameters().get('selectedFilterBy') != null ){
			selectedFilterBy = apexPages.currentPage().getParameters().get('selectedFilterBy');
		}
		newMessage.ParentId = selectedFilterBy;
		newTopic = null;
		newCareTeamMember = null;
		return null;
	}

	public PageReference clearFilterBy(){
		selectedFilterBy = patientId;
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

}