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
			sendMail.setSubject("[2�� ������Ʈ �ӽ� ��й�ȣ�Դϴ�.]");
			sendMail.setText(""
					+ "<p>��й�ȣ</p>"
                    + "<p><font size='20px'>Ȯ�ι�ȣ : "+randomNum +"</p>");
			sendMail.setFrom("gkdldnpdl11@gmail.com", "project");
			sendMail.setTo(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println("mail send err : "+e);
		}
	}
	
}
