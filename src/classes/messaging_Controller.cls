public with sharing class messaging_Controller {
/*
	a User associated with 1 medical facility should not be able to interact with a user from another medical facility
*/

	public Id parentId {
		get;
		set{
			parentId = value;
			if ( parentId != null ){
				newMessage.parentId = parentId;
				queryMessages();
			}
		}
	}
	public Id treatmentId {
		get;
		set{
			treatmentId = value;
		}
	}
	public FeedItem newMessage {
		get{
			if (newMessage == null){
				newMessage = new FeedItem();
			}
			return newMessage;
		}
		set;
	}
	
	public class messageWrapper {
		public String body {get;set;}
		public Id createdById {get;set;}
		public String createdByName {get;set;}
		public DateTime createdDateTime {get;set;}
		public String linkURL {get;set;}
		public String contentData {get;set;}
		public String contentFileName {get;set;}
		public Id parentId {get;set;}
		public String parentName {get;set;}
		public Id recordId {get;set;}
		public String title {get;set;}
		public FeedComment newComment {get;set;}
		public List<FeedComment> comments {get;set;}
		
		public messageWrapper(NewsFeed nf){
			body = fixNulls(nf.Body);
			comments = nf.FeedComments;
			createdById = nf.CreatedById;
			createdByName = fixNulls(nf.CreatedBy.Name);
			createdDateTime = nf.CreatedDate;
			linkURL = nf.linkURL;
			newComment = new FeedComment(FeedItemId=nf.Id);
			parentId = nf.Parent.Id;
			parentName = nf.Parent.Name;
			recordId = nf.Id;
			title = fixNulls(nf.Title);
		}

		public messageWrapper(Topic__Feed f){
			body = fixNulls(f.Body);
			comments = f.FeedComments;
			createdById = f.CreatedById;
			createdByName = fixNulls(f.CreatedBy.Name);
			createdDateTime = f.CreatedDate;
			linkURL = f.linkURL;
			newComment = new FeedComment(FeedItemId=f.Id);
			parentId = f.Parent.Id;
			parentName = f.Parent.Name;
			recordId = f.Id;
			title = fixNulls(f.Title);
		}
		
		public PageReference insertNewComment(){
			insert newComment;
			return page.Message.setRedirect(true);
		}
	} 

	public String mode {get;set;}
	public String selectedFilterBy {get;set;}
	public Care_Team_Member__c newCareTeamMember {get;set;}
	public Topic__c newTopic {get;set;}
	public List<messageWrapper> messageList {get;set;}
	public Task newTask {get;set;}
		
	public messaging_Controller(){
		newTask = new Task();
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
		newTopic.Patient__c = parentId;
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
		newMessage.ParentId = selectedFilterBy;
		insert newMessage;
		newMessage = new FeedItem();
		messageList = queryNewsFeed();
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
		options.add(new SelectOption('','Recent'));
		if ( parentId != null ){
			for ( Topic__c t : [Select Id, Name, Patient__c from Topic__c where Patient__c = :parentId order by Name]){
				options.add(new SelectOption(t.Id,t.Name));
			}
		}
		return options;
	}

	public List<Topic__c> getTopicList() {
		return [Select Id, Name, Patient__c from Topic__c where Patient__c = :parentId order by Name];
	}

	public List<Care_Team_Member__c> getCareTeamMemberList() {
		return [Select Id, Name from Care_Team_Member__c where Treatment__c =:treatmentId order by Name];
	}


	public PageReference queryMessages(){
		messageList = queryTopicFeed();
		return null;
	}

	/*
		Need to query Newsfeed for 
			topics on this Treatment
			on this Treatment
			on this Patient
	*/ 
	public List<messageWrapper> queryTopicFeed(){
		String queryString = 'SELECT Id, Type, CreatedById, CreatedBy.Name, CreatedDate, ParentId, Parent.Name, Body, Title, LinkUrl, ContentData, ContentFileName,';
		queryString += '(SELECT Id, FieldName, OldValue, NewValue FROM FeedTrackedChanges order by Id DESC),';
		queryString += '(SELECT Id, CommentBody, CreatedDate, CreatedBy.Name FROM FeedComments order BY CreatedDate LIMIT 10),';
		queryString += '(SELECT CreatedBy.FirstName, CreatedBy.LastName FROM FeedLikes)';
		queryString += ' FROM Topic__Feed ';
		//RV: Added String.escapeSingleQuotes() to pass Security Scanner
		if ( selectedFilterBy instanceof Id ){
			queryString += 'where ParentId = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' or ';
			queryString += ' CreatedById = \''+String.escapeSingleQuotes(selectedFilterBy) +'\' ';
		} else {
			queryString += 'where ParentId in (Select Id from Topic__c where Patient__c = \''+String.escapeSingleQuotes(parentId) +'\')';
		}
		queryString += ' order by CreatedDate DESC, Id DESC';
		queryString += ' limit 20';
		List<messageWrapper> results = new List<messageWrapper>();
		for ( Topic__Feed n : database.query(queryString) ){
			results.add(new messageWrapper(n));
		}
		return results;
	}

	public String messagingAlert {get;set;}
	public PageReference pollNewsFeed(){
		queryNewsFeed();
		return null;
	}

	public List<messageWrapper> queryNewsFeed(){
		List<messageWrapper> results = new List<messageWrapper>();
		String queryString = 'SELECT Id, Type, CreatedById, CreatedBy.Name, CreatedDate, ParentId, Parent.Name, Body, Title, LinkUrl, ContentData, ContentFileName,';
		queryString += '(SELECT Id, FieldName, OldValue, NewValue FROM FeedTrackedChanges order by Id DESC),';
		queryString += '(SELECT Id, CommentBody, CreatedDate, CreatedBy.Name FROM FeedComments order BY CreatedDate LIMIT 10),';
		queryString += '(SELECT CreatedBy.FirstName, CreatedBy.LastName FROM FeedLikes)';
		queryString += ' FROM NewsFeed ';
		if ( parentId != null && parentId != userInfo.getUserId() ){
			queryString += 'where ParentId = \''+parentId +'\'';
		}
		queryString += ' order by CreatedDate DESC, Id DESC';
		queryString += ' limit 20';
		
		for ( NewsFeed n : database.query(queryString) ){
			results.add(new messageWrapper(n));
		}
		if  ( results.size() > 0 ){
			if ( results[0].createdDateTime.addMinutes(5) >= system.now() ){
				messagingAlert = results[0].body;
			} else {
				messagingAlert = '';
			}
		}
		return results;
	}

	public class followeeWrapper{
		public Id recordId {get;set;}
		public String name {get;set;}
	}

	public List<followeeWrapper> getRecommendations(){
		List<followeeWrapper> results = new List<followeeWrapper>();
		return results;
	}
	
	public PageReference selectFilterBy(){
		if ( selectedFilterBy == null && apexPages.currentPage().getParameters().get('selectedFilterBy') != null ){
			selectedFilterBy = apexPages.currentPage().getParameters().get('selectedFilterBy');
		}
		messageList = queryTopicFeed();
		return null;
	}

	public PageReference clearFilterBy(){
		selectedFilterBy = null;
		messageList = queryTopicFeed();
		return null;		
	}

	public PageReference selectTextmode(){
		mode = 'TextPost';
		return null;
	}

	public PageReference selectFileMode(){
		mode = 'ContentPost';
		return null;
	}
	
	public PageReference selectLinkMode(){
		mode = 'LinkPost';
		return null;
	}

	public PageReference selectPollMode(){
		mode = 'PollPost';
		return null;
	}

	public PageReference selectTaskMode(){
		mode = 'TaskPost';
		return null;
	}

	public static String fixNulls(String s){
		if ( s == null ){
			s = '';
		}
		return s;
	}

}