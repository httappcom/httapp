public with sharing class AttachmentUtil {
	public static void checkForDupsOnFilename( List<Attachment> allAttachments ) {
		Set<ID> patientIds = new Set<ID>();
		Set<ID> attachmentIds = new Set<ID>();
		List<attachment> attachments = new List<attachment>();
		for (Attachment attachment : allAttachments) {
			ID parentId = attachment.ParentId;
system.debug('objectType='+(parentId.getSObjectType()+''));
			if ((parentId.getSObjectType()+'') != 'Patient__c') continue;
			patientIds.add(parentId);
			if (attachment.id != null) {
				attachmentIds.add(attachment.id);
			}
			attachments.add(attachment);
		}
		Map<String, ID> existingFilenames = new Map<String, ID>();
		Patient__c[] patients = [SELECT Patient_Id__c, Id,
			(SELECT ParentId,Name FROM Attachments) 
				FROM Patient__c where id in :patientIds for update]; //Lock on Parent Patient record!
system.debug('patients='+patients);
		For (Patient__c patient : patients) {
			for (Attachment attachment : patient.Attachments) {
				String key = patient.id + '+' + attachment.Name;
system.debug('putting existingFileNames '+key);
				existingFileNames.put( key, attachment.id);
			}
		}
		for (Attachment attachment : attachments) {
			String key = attachment.ParentId + '+' + attachment.Name;
	system.debug('attachment Keyt='+key);
			Id existing = existingFileNames.get(key);
	system.debug('existing='+existing);
			if (existing!=null && existing!=attachment.id) {
				attachment.addError('Duplicate attachment name '+attachment.Name);
			}
		}
	}
}