package com.ict.jeju.ygh.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.ygh.service.JejuService5;

@RestController
public class APIController {
	@Autowired
	private JejuService5 jejuService5;
	
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
	
	// 회원현황
	@RequestMapping(value = "userTotal.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String userTotal() {
		List<UserVO> user_total = jejuService5.userTotal();
		if (user_total != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(user_total);
			return jsonString;
		}
		return "fail";
	}
	
	// 일일 가입자 수
	@RequestMapping(value = "joinUser.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String joinUser() {
		List<UserVO> user_join = jejuService5.joinUser();
		if (user_join != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(user_join);
			return jsonString;
		}
		return "fail";
	}
	
}
