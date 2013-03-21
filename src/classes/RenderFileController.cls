public without sharing class RenderFileController {

	private Attachment attachment = null;
	private static Map<String, String> extnToMimeTypeMap = new Map<String, String>{
		'gif' => 'image/gif',
		'jpeg' => 'image/jpeg',
		'jpg' => 'image/jpeg',
		'png' => 'image/png',
		'tif' => 'image/tiff',
		'tiff' => 'image/tiff',
		'html' => 'text/html',
		'htm' => 'text/html',
		'txt' => 'text/plain',
		'pdf' => 'application/pdf',
		'rtf' => 'application/rtf',
		'doc' => 'application/msword',
		'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
	};
	private void loadAttachment() {
		if (attachment == null) {
	    	String id = ApexPages.currentPage().getParameters().get('AttachmentID');
    	    attachment = [SELECT Body, ContentType, Name FROM Attachment WHERE ID = :id];
  system.debug('ContentType='+attachment.ContentType);
		}
	}
	public String contentType {
		get {
			loadAttachment();
			String extn = attachment.Name.substringAfterLast('.');
			return attachment.ContentType!=null?attachment.ContentType:extnToMimeTypeMap.get(extn);
		}
	}
	
    public String data {
        get {
        	loadAttachment();
            return EncodingUtil.Base64Encode(attachment.body);
        }
    }
}