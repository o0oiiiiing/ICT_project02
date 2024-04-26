package com.ict.jeju.lsh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String randomNum, String toMail) {
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[2조 프로젝트 임시 비밀번호입니다.]");
			sendMail.setText(""
					+ "<p>비밀번호</p>"
                    + "<p><font size='20px'>확인번호 : "+randomNum +"</p>");
			sendMail.setFrom("gkdldnpdl11@gmail.com", "project");
			sendMail.setTo(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println("mail send err : "+e);
		}
	}
	
}
