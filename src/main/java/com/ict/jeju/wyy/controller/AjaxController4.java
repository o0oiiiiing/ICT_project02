package com.ict.jeju.wyy.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.service.CalendarService4;

@RestController
public class AjaxController4 {

	@Autowired
	private CalendarService4 calendarService4;

	@RequestMapping(value = "myTripMap", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String myTripMap() {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		try {
			// 카테코리 c1~c4 지정하는 방법 아직 모르겠음..
			URL url = new URL(
					"https://api.visitjeju.net/vsjApi/contents/searchList?apiKey=2aa87f00298241e49e9873566c735875&locale=kr&category=c1");
			URLConnection conn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String msg = null;
			while ((msg = br.readLine()) != null) {
				sb.append(msg);
			}
			return sb.toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 캘린더 전체 정보 가져오기
	@RequestMapping(value = "calList", produces = "application/json;  charset=utf-8")
	@ResponseBody
	public String calList() {
		List<CalendarVO4> list = calendarService4.calList();
		if (list != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(list);
			return jsonString;
		}
		return null;
	}
	
	// 캘린더 일정 삭제
	@RequestMapping(value = "calDelete", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String calDelete(String c_idx) {
		int result = calendarService4.calDelete(c_idx);
		return String.valueOf(result);
	}

}
