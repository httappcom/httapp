@RestResource(urlMapping='/messaging/*')
global class webservice_Methods {

	webservice static void feedItem_Insert(Id parentId, String body){
		FeedItem newRecord = new FeedItem();
		newRecord.parentId = parentId;
		newRecord.body = body;
		insert newrecord;
	}


    @HttpGet
    global static void insertFeedItem() {
		FeedItem f = new FeedItem();	
		f.parentId = 'a08d000000JTigD';
		f.body = 'This is a test at 7pm';
		insert f;
    }

}