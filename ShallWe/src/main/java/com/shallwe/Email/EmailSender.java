package com.shallwe.Email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailSender {

	@Autowired
    protected JavaMailSender  mailSender;
	 
    public void SendEmail(Email email) throws Exception {
    	
    	MimeMessage msg = mailSender.createMimeMessage();
       
	    try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
			
	        msg.setSubject(email.getSubject());
	        msg.setText(email.getContent());
	        msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
	
	    }catch(MessagingException e) {
	        e.printStackTrace();
	    }
	
	    try {
	        mailSender.send(msg);
	    }catch(MailException e) {
	        e.printStackTrace();
	
	    }

    }

}
