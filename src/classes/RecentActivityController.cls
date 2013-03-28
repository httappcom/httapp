public with sharing class RecentActivityController {
	private List<RecentActivity> recentList = null;
	public Integer lastXDays {get; set; }
	public ID appendId {get; set;}
	public List<SelectOption>  getDaysList() {
		List<String> dl = new List<String>{'1','2','3','4'};
		List<SelectOption> opts = new List<SelectOption>();
		for (String option : dl) {
			opts.add(new SelectOption(option,option));
		}
		return opts;
	}
	public List<RecentActivity> getSidebarRecentActivity() {
		if (recentList == null) recentList = new List<RecentActivity>();
		return recentList;
	}
	public List<RecentActivity> getRecentActivity() {
		if (recentList==null) loadActivity();
		return recentList;
	}
	public class RecentActivity implements Comparable {
		public String activityType {get; private set; }
		public UILookup__c lu {get; private set; }
		public String description {get; private set; }
		public String alertTag {get; private set; }
		public String alertContent {get; private set; }
		public Datetime timestamp {get; private set;}
		public String source {get; private set;}
		public RecentActivity( Treatment__c treatment ) {
			activityType = 'Treatment';
			lu = new UILookup__c(Treatment__c=treatment.id, Timestamp__c=treatment.Assigned_Timestamp__c);
			description = 'Treatment assignment: '+treatment.Procedure_Subcategory__c+' for '+treatment.Patient__r.Name;
			timestamp = treatment.Assigned_Timestamp__c;
			alertTag = treatment.Procedure_Subcategory__c;
	system.debug('timestamp='+timestamp);
		}
		public RecentActivity( Communication__c comm) {
			activityType = 'TopicPost';
			lu = new UILookup__c(Treatment__c=comm.Treatment__c, Communication__c=comm.id, Timestamp__c=comm.CreatedDate);
			description = comm.Topic__r.Name + ' post: '+comm.Body__c;
			timestamp = comm.CreatedDate;
			source = comm.CreatedBy.Name;
			alertTag = comm.Topic__c;
			alertContent = comm.Body__c;
		}
		public RecentActivity( Private_Message__c msg) {
			activityType='PrivateMessage';
			lu = new UILookup__c(Timestamp__c=msg.CreatedDate, Private_Message__c=msg.id);
			description = 'Private Message: '+msg.Body__c;
			timestamp = msg.CreatedDate;
			source = msg.Sender__r.Name;
			alertTag = source;
			alertContent = msg.Body__c;
		}
		public RecentActivity( Private_Message_Comment__c msg) {
			activityType='PrivateMessageComment';
			lu = new UILookup__c(Timestamp__c=msg.CreatedDate, Comment__c=msg.id);
			description = 'Private Message (comment): '+msg.Body__c;
			timestamp = msg.CreatedDate;
			source = msg.CreatedBy.Name;
			alertTag = source;
			alertContent = msg.Body__c;
		}
		public Integer compareTo( Object compareTo ) {
			if (((RecentActivity)compareTo).timestamp>this.timestamp) return 1;
			if (((RecentActivity)compareTo).timestamp==this.timestamp) return 0;
			return -1;
		}
	}
	
	public RecentActivityController() {
		lastXDays = 1;
	}
	
	public PageReference changeDaysFilter() {
		system.debug('changeDaysFilter lastXDays='+lastXDays);
		loadActivity();
		return null;
	}
	
	private void loadActivity() {
		recentList = new List<RecentActivity>();
		Datetime threshold = Datetime.now().addHours(-(lastXDays*24));
		Treatment__c[] recentTreatmentAssignedments = [SELECT Id, Assigned_Timestamp__c, Procedure_Category__c, Procedure_Subcategory__c, 
			Patient__r.Name from Treatment__c where Assigned_To__c=:UserInfo.getUserId() and Assigned_Timestamp__c>:threshold];
		for (Treatment__c treatment : recentTreatmentAssignedments) {
			recentList.add(new RecentActivity(treatment));
		}
		Communication__c[] comms = [Select Id, Body__c, CreatedBy.Name, Topic__r.Name, Treatment__c, CreatedDate from Communication__c
			where CreatedDate>:threshold];
		for (Communication__c comm : comms) {
			recentList.add(new RecentActivity(comm));
		}
		Private_Message__c[] msgs = [Select Id, Sender__r.Name, Body__c, CreatedDate from Private_Message__c
			where CreatedDate>:threshold];
		for (Private_Message__c comm : msgs) {
			recentList.add(new RecentActivity(comm));
		}
		Private_Message_Comment__c[] comments = [Select Id, CreatedBy.Name, Body__c, CreatedDate from Private_Message_Comment__c
			where CreatedDate>:threshold];
		for (Private_Message_Comment__c comm : comments) {
			recentList.add(new RecentActivity(comm));
		}
		recentList.sort();
	}
	
	public PageReference appendObject() {
		if (appendId == null) return null;
		String objType = appendId.getSObjectType()+'';
		if (objType == 'Treatment__c') {
			Treatment__c[] treatments = [SELECT Id, Assigned_Timestamp__c, Procedure_Category__c, Procedure_Subcategory__c, 
				Patient__r.Name from Treatment__c where Assigned_To__c=:UserInfo.getUserId() and id=:appendId];
			if (treatments.size()>0) {
				recentList.add(new RecentActivity(treatments[0]));
			}
		} else if (objType == 'Communication__c') {
			Communication__c[] comms = [Select Id, Body__c, CreatedBy.Name, Topic__r.Name, Treatment__c, CreatedDate from Communication__c
				where id=:appendId];
			if (comms.size()>0) {
				recentList.add(new RecentActivity(comms[0]));
			}
		} else if (objType == 'Private_Message__c') {
			Private_Message__c[] msgs = [Select Id, Sender__r.Name, Body__c, CreatedDate from Private_Message__c
				where id=:appendId];
			if (msgs.size()>0) {
				Logger.info('Message: ' + msgs[0]);
				recentList.add(new RecentActivity(msgs[0]));
			}
		} else if (objType == 'Private_Message_Comment__c') {
			Private_Message_Comment__c[] comments = [Select Id, CreatedBy.Name, Body__c, CreatedDate from Private_Message_Comment__c
				where id=:appendId];
			if (comments.size()>0) {
				recentList.add(new RecentActivity(comments[0]));
			}
		}
		return null;
	}
	
}