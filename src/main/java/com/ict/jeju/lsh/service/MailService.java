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
			sendMail.setSubject("[2조 프로젝트 임시 비밀번호 발송 메일입니다.]");
			sendMail.setText(""
					+ "<p>하단의 변경된 임시 비밀번호로 로그인하세요.</p>"
                    + "<p><font size='16px'>임시 비밀번호 : "+randomNum +"</p>");
			sendMail.setFrom("lsh31739@naver.com", "project");
			sendMail.setTo(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println("mail send err : "+e);
		}
	}
	
}
