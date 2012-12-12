public with sharing class EmailUtil {

    public void sendEmailExample (String email) {
        Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage(); 

        PageReference pdf =  new PageReference('some url');
        pdf.getParameters().put('id', 'someRecId');
        //etc...
        pdf.setRedirect(true);
        Blob b = pdf.getContentAsPDF();
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('some pdfFileName');
        attachment.setBody(b);
        String[] toAddresses = new String[]{email};
    	String subject = 'some subject';
        emailMsg.setSubject(subject);
        emailMsg.setToAddresses( toAddresses );
        emailMsg.setPlainTextBody( 'This is the body - something is attached.');
        emailMsg.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});
        Messaging.SendEmailResult [] emailResult =  
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {emailMsg});
    }
}