//Generated by wsdl2apex

public class dto15ApiEchosign {
    public class DocumentInfoList {
        public dto15ApiEchosign.ArrayOfDocumentInfo documentInfos;
        public String errorCode;
        public String errorMessage;
        public Boolean success;
        private String[] documentInfos_type_info = new String[]{'documentInfos','http://dto15.api.echosign','ArrayOfDocumentInfo','0','1','true'};
        private String[] errorCode_type_info = new String[]{'errorCode','http://dto11.api.echosign','DocumentInfoListErrorCode','0','1','true'};
        private String[] errorMessage_type_info = new String[]{'errorMessage','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] success_type_info = new String[]{'success','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://dto15.api.echosign','true','true'};
        private String[] field_order_type_info = new String[]{'documentInfos','errorCode','errorMessage','success'};
    }
    public class ArrayOfDocumentInfo {
        public dto15ApiEchosign.DocumentInfo[] DocumentInfo;
        private String[] DocumentInfo_type_info = new String[]{'DocumentInfo','http://dto15.api.echosign','DocumentInfo','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://dto15.api.echosign','true','true'};
        private String[] field_order_type_info = new String[]{'DocumentInfo'};
    }
    public class ArrayOfDocumentHistoryEvent {
        public dto15ApiEchosign.DocumentHistoryEvent[] DocumentHistoryEvent;
        private String[] DocumentHistoryEvent_type_info = new String[]{'DocumentHistoryEvent','http://dto15.api.echosign','DocumentHistoryEvent','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://dto15.api.echosign','true','true'};
        private String[] field_order_type_info = new String[]{'DocumentHistoryEvent'};
    }
    public class DocumentHistoryEvent {
        public String type_x;
        public String actingUserIpAddress;
        public String actingUserEmail;
        public String comment;
        public String participantEmail;
        public DateTime date_x;
        public String description;
        public String documentVersionKey;
        private String[] type_x_type_info = new String[]{'type','http://dto15.api.echosign','AgreementEventType','0','1','true'};
        private String[] actingUserIpAddress_type_info = new String[]{'actingUserIpAddress','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] actingUserEmail_type_info = new String[]{'actingUserEmail','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] comment_type_info = new String[]{'comment','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] participantEmail_type_info = new String[]{'participantEmail','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] date_x_type_info = new String[]{'date','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
        private String[] description_type_info = new String[]{'description','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] documentVersionKey_type_info = new String[]{'documentVersionKey','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://dto15.api.echosign','true','true'};
        private String[] field_order_type_info = new String[]{'type_x','actingUserIpAddress','actingUserEmail','comment','participantEmail','date_x','description','documentVersionKey'};
    }
    public class DocumentInfo {
        public dto15ApiEchosign.ArrayOfDocumentHistoryEvent events;
        public String latestDocumentKey;
        public DateTime expiration;
        public String locale;
        public String message;
        public String name;
        public dto9ApiEchosign.ArrayOfNextParticipantInfo nextParticipantInfos;
        public String documentKey;
        public dto13ApiEchosign.ArrayOfSecurityOption securityOptions;
        public dto14ApiEchosign.ArrayOfParticipantInfo participants;
        public String status;
        private String[] events_type_info = new String[]{'events','http://dto15.api.echosign','ArrayOfDocumentHistoryEvent','0','1','true'};
        private String[] latestDocumentKey_type_info = new String[]{'latestDocumentKey','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] expiration_type_info = new String[]{'expiration','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
        private String[] locale_type_info = new String[]{'locale','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] message_type_info = new String[]{'message','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] nextParticipantInfos_type_info = new String[]{'nextParticipantInfos','http://dto9.api.echosign','ArrayOfNextParticipantInfo','0','1','true'};
        private String[] documentKey_type_info = new String[]{'documentKey','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        private String[] securityOptions_type_info = new String[]{'securityOptions','http://dto13.api.echosign','ArrayOfSecurityOption','0','1','true'};
        private String[] participants_type_info = new String[]{'participants','http://dto14.api.echosign','ArrayOfParticipantInfo','0','1','true'};
        private String[] status_type_info = new String[]{'status','http://dto14.api.echosign','AgreementStatus','0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://dto15.api.echosign','true','true'};
        private String[] field_order_type_info = new String[]{'events','latestDocumentKey','expiration','locale','message','name','nextParticipantInfos','documentKey','securityOptions','participants','status'};
    }
}