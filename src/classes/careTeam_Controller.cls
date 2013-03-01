public with sharing class careTeam_Controller {

	public class careTeamMemberWrapper {
		public Id parentTreatmentId {get;set;}
		public Id userId {get;set;}
		public String name {get;set;}
		public String role {get;set;}
		public String imageURL {get;set;}
		public FeedItem newMessage {get;set;}
		public Task newTask {get;set;}
		public Boolean showMessage {get;set;}
		public Boolean showTask {get;set;}

		public careTeamMemberWrapper(Care_Team_Member__c c){
			parentTreatmentId = c.Treatment__c;
			userId = c.User__c;
			name = c.User__r.Name;
			role = c.Role__c;
			if ( c.User__r.FullPhotoUrl != null ){
				imageUrl = c.User__r.FullPhotoUrl;
			}
			cancel();
		}

		public PageReference composeMessage(){
			showMessage = true;
			newMessage = new FeedItem();
			newMessage.ParentId = userId;
			return null;
		}

		public PageReference insertMessage(){
			insert newMessage;
			cancel();
			return null;
		}

		public PageReference composeTask(){
			newTask = new Task();
			newTask.OwnerId = userId;
			newTask.Subject = 'Treatment Task';
			newTask.Status = 'Not Started';
			newTask.WhatId = parentTreatmentId;
			showTask = true;
			return null;
		}

		public PageReference insertTask(){
			insert newTask;
			cancel();
			return null;
		}
	
		public PageReference cancel(){
			showMessage = false;
			showTask = false;
			return null;
		}

	}

	public Id treatmentId {get;set;}
	public List<careTeamMemberWrapper> careTeamMemberList {
		get {
			if ( careTeamMemberList == null || careTeamMemberList.size() == 0){
				careTeamMemberList = new List<careTeamMemberWrapper>();
				for ( Care_Team_Member__c c : [Select Id, Treatment__c, Role__c, User__c, User__r.FullPhotoUrl, User__r.Name from Care_Team_Member__c where Treatment__c = :treatmentId order by Name]){
					careTeamMemberList.add(new careTeamMemberWrapper(c));
				}
			}
			return careTeamMemberList;
		}
		set;
	}

	public Care_Team_Member__c newCareTeamMember {get;set;}
	public PageReference addCareTeamMember(){
		newCareTeamMember = new Care_Team_Member__c();
		newCareTeamMember.Treatment__c = treatmentId;
		return null;
	}

	public PageReference insertNewCareTeamMember(){
		if ( newCareTeamMember.User__c != null /* && newCareTeamMember.Role__c != null*/ ) {
			CareTeamUtil.addMembersToCareTeam( new List<Care_Team_Member__c>{newCareTeamMember});
		} else {
			
		}
		return null;
	}

	public careTeam_Controller(){

		
	}	

}