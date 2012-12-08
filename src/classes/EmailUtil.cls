public with sharing class EmailUtil {

    public void sendEmailExample () {
        if (StringUtil.isEmpty(email)) {
            addError('Please enter an email address.');
            return null;
        }
        Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage(); 

        // Reference the attachment page and pass in the account ID
        if (pdfURL==null) initURL();
        if (pdfURL == null) // May still be null if no template defined
        {
            addError('Document cannot be prepared, email not sent.');
        	return null;
        }
        PageReference pdf =  new PageReference(pdfURL);
        pdf.getParameters().put('id', someRecId);
        //etc...
        pdf.setRedirect(true);
        Blob b = pdf.getContentAsPDF();
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName(pdfFileName);
        attachment.setBody(b);
        String[] toAddresses = new String[]{email};
    	String subject = 'some subject';
        emailMsg.setSubject(subject);
        emailMsg.setToAddresses( toAddresses );
        emailMsg.setPlainTextBody( 'This is the body - something is attached.');
        emailMsg.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});
        Messaging.SendEmailResult [] emailResult =  
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {emailMsg});
        return null;
    }
}