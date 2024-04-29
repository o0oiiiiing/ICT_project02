package com.ict.jeju.wyy.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.VisitJejuVO4;
import com.ict.jeju.wyy.service.CalendarService4;

@RestController
public class AjaxController4 {

	@Autowired
	private CalendarService4 calendarService4;
	
	// 지도 정보
	@RequestMapping(value = "myTripMap", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String myTripMap() {
		List<VisitJejuVO4> vi_list = calendarService4.myTripMap();
		if(vi_list != null) {
			// pom.xml 에서 gson 추가
			Gson gson = new Gson();
			String jsonString = gson.toJson(vi_list);
			return jsonString;
		}
		return "fail";
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
