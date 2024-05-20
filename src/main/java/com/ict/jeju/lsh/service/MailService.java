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
			sendMail.setSubject("[Jeju_travel | 임시 비밀번호 발송 메일입니다.]");
			sendMail.setText(""
					+"<table><tbody>"
					+"<tr><td><h2>Jeju_travel 메일 인증입니다.</h2></td></tr>"
					+"<tr><td>임시 비밀번호 입니다.</td></tr>"
					+"<tr><td>변경된 인증번호 6자리를 이용하여 로그인하세요.</td></tr>"
					+ "<tr><td></td></tr>"
                    + "<tr><td><h3>발급된 임시 비밀번호 : "+randomNum +"</h3></td></tr>"
                    + "<tr><td></td></tr>"
                    +"</tbody></table>");
			sendMail.setFrom("lsh31739@naver.com", "Jeju_travel");
			sendMail.setTo(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println("mail send err : "+e);
		}
	}
	
}
