package kh.com.medi.service.impl;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.com.medi.service.MailService;

@Service
public class MailServiceImpl implements MailService {

	// org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    @Autowired
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

	
	@Override
	public boolean send(String subject, String text, String from, String to) {
		// javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper!
        	System.out.println("send쪽 결과-- " +subject + " " + text + " " + from + " " + to + " ");
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
	}

}