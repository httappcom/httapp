public with sharing class messaging_Controller {
	
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
	public FeedItem newMessage {
		get{
			if (newMessage == null){
				newMessage = new FeedItem();
			}
			return newMessage;
		}
		set;
	}
	
	public List<messageWrapper> messageList {get;set;}
	public String selectedTopic {get;set;}
	public Topic__c newTopic {get;set;}

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
	
	public messaging_Controller(){
		newTopic = new Topic__c();
	}

	public PageReference insertNewMessage(){
		if ( selectedTopic == 'New Topic' && newTopic.Name != null ){
			insertNewTopic();
		}
		newMessage.ParentId = selectedTopic;
		insert newMessage;
		system.debug(newMessage.id);
		newMessage = new FeedItem();
		messageList = queryNewsFeed();
		return null;
	}

	public PageReference insertNewTopic(){
		newTopic.Patient__c = parentId;
		insert newTopic;
		selectedTopic = newTopic.Id;
		newTopic = new Topic__c(Patient__c=parentId);
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
		options.add(new SelectOption('New Topic','New Topic'));
		return options;
	}

	public PageReference queryMessages(){
		messageList = queryTopicFeed();
		return null;
	}

	public List<messageWrapper> queryTopicFeed(){
		String queryString = 'SELECT Id, Type, CreatedById, CreatedBy.Name, CreatedDate, ParentId, Parent.Name, Body, Title, LinkUrl, ContentData, ContentFileName,';
		queryString += '(SELECT Id, FieldName, OldValue, NewValue FROM FeedTrackedChanges order by Id DESC),';
		queryString += '(SELECT Id, CommentBody, CreatedDate, CreatedBy.Name FROM FeedComments order BY CreatedDate LIMIT 10),';
		queryString += '(SELECT CreatedBy.FirstName, CreatedBy.LastName FROM FeedLikes)';
		queryString += ' FROM Topic__Feed ';
		if ( selectedTopic instanceof Id ){
			queryString += 'where ParentId = \''+selectedTopic +'\'';
		} else {
			queryString += 'where ParentId in (Select Id from Topic__c where Patient__c = \''+parentId +'\')';
		}
		queryString += ' order by CreatedDate DESC, Id DESC';
		queryString += ' limit 20';
		List<messageWrapper> results = new List<messageWrapper>();
		for ( Topic__Feed n : database.query(queryString) ){
			results.add(new messageWrapper(n));
		}
		return results;
	}

	public List<messageWrapper> queryNewsFeed(){
		List<messageWrapper> results = new List<messageWrapper>();
		String queryString = 'SELECT Id, Type, CreatedById, CreatedBy.Name, CreatedDate, ParentId, Parent.Name, Body, Title, LinkUrl, ContentData, ContentFileName,';
		queryString += '(SELECT Id, FieldName, OldValue, NewValue FROM FeedTrackedChanges order by Id DESC),';
		queryString += '(SELECT Id, CommentBody, CreatedDate, CreatedBy.Name FROM FeedComments order BY CreatedDate LIMIT 10),';
		queryString += '(SELECT CreatedBy.FirstName, CreatedBy.LastName FROM FeedLikes)';
		queryString += ' FROM NewsFeed ';
		if ( parentId != null && parentId != userInfo.getUserId() ){
			system.debug(parentId);
			queryString += 'where ParentId = \''+parentId +'\'';
		}
		queryString += ' order by CreatedDate DESC, Id DESC';
		queryString += ' limit 20';
		
		for ( NewsFeed n : database.query(queryString) ){
			results.add(new messageWrapper(n));
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
	
	public static String fixNulls(String s){
		if ( s == null ){
			s = '';
		}
		return s;
	}

}