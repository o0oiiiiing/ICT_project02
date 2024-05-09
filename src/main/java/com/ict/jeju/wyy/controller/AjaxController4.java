package com.ict.jeju.wyy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.VisitJejuVO4;
import com.ict.jeju.wyy.service.CalendarService4;

@RestController
public class AjaxController4 {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private CalendarService4 calendarService4;
	
	// 캘린더 지도 정보
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
	
	// 좋아요 지도정보
	@RequestMapping(value = "myTripMapLike", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String myTripMapLike(HttpSession session) {
		String u_idx = (String) session.getAttribute("u_idx");
		List<VisitJejuVO4> vi_list = calendarService4.myTripMapLike(u_idx);
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
	
	// 좋아요한 페이지에서 삭제
	@RequestMapping(value = "removeHeart", produces ="text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxHeartRemove(@RequestParam("like_idx")String like_idx) {
	        int result = calendarService4.removeHeart(like_idx) ;
	        return String.valueOf(result);
	    }

}
