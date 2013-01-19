trigger TopicTrigger on Topic__c (after update) {

	if ( trigger.isAfter && trigger.isUpdate ){
		List<FeedItem> feedItemInserts = new List<FeedItem>();
		for ( Integer i=0;i<trigger.size;i++ ){
			if ( trigger.new[i].FeedItem_Body__c != null && trigger.new[i].FeedItem_Body__c != trigger.old[i].FeedItem_Body__c ){
				FeedItem f = new FeedItem();
				f.ParentId = trigger.new[i].Id;
				f.Body = trigger.new[i].FeedItem_Body__c;
				feedItemInserts.add(f);	
			}
		}
		if ( feedItemInserts.size() > 0 ){
			insert feedItemInserts;
		}
	}

}