package com.ict.jeju.ygh.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class APIController {

	@RequestMapping(value = "weather.do", produces="text/xml; charset=utf-8")
	@ResponseBody
	public String Xml_Exam05() {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		try {
			URL url = new URL("http://www.kma.go.kr/XML/weather/sfc_web_map.xml");
			URLConnection conn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			String msg = null;
			while ((msg=br.readLine()) != null) {
				sb.append(msg);
			}
			return sb.toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
