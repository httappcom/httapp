trigger AttachmentTrigger on Attachment (before insert, before update) {
	if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
		system.debug('Attachment Trigger'+Trigger.new);
		AttachmentUtil.checkForDupsOnFilename( Trigger.new );
	} 
}