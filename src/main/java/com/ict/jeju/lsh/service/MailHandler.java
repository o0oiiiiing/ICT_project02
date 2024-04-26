package com.ict.jeju.lsh.service;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailHandler(JavaMailSender mailSender) throws Exception {
		this.mailSender =mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	public void setSubject(String subject) throws Exception {
		messageHelper.setSubject(subject);
	}
	
	public void setText(String text) throws Exception {
		messageHelper.setText(text, true);
	}
	
	public void setFrom(String email, String name) throws Exception {
		messageHelper.setFrom(email, name);
	}
	
	public void setTo(String u_email) throws Exception {
		messageHelper.setTo(u_email);
	}
	
	public void send() {
		mailSender.send(message);
	}
	
}
