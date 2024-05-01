package com.ict.jeju.wyy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.UserVO4;
import com.ict.jeju.wyy.service.CalendarService4;

@Controller
public class JejuController4 {
	
	@Autowired
	private CalendarService4 calendarService4;
	
	
	@RequestMapping("wyyhome")
	public ModelAndView wyyHome() {
		return new ModelAndView("wyy-view/index");
	}
	
	// 나의여행일정 추가한 리스트 / 좋아요한 리스트
	@RequestMapping("myTripPlan")
	public ModelAndView myTripPlan(String u_idx) {
		ModelAndView mv = new ModelAndView("wyy-view/myTripPlan");
		List<LikeVO> like_list = calendarService4.myTripLike(u_idx);
		List<UserVO4> u_list = calendarService4.myTripUser(u_idx);
		if (like_list != null) {
			mv.addObject("u_idx", u_idx);
			mv.addObject("like_list", like_list);
			mv.addObject("u_list", u_list);
			return mv;
		}
		return null;
	}
	
	// 캘린더 일정 추가하기
	@RequestMapping("calSave")
	public ModelAndView saveCal(CalendarVO4 cvo4){
		int result = calendarService4.saveCal(cvo4);
		System.out.println(result);
		if (result>0) {
			return new ModelAndView("redirect:myTripPlan");
		}
		return new ModelAndView("wyy-view/error");
	}
	
	@RequestMapping("calendar")
	public ModelAndView getPlanner() {
		return new ModelAndView("wyy-view/calendar");
	}
	@RequestMapping("test01")
	public ModelAndView test01() {
		return new ModelAndView("wyy-view/lightbox");
	}
	
	@RequestMapping("calendar_add")
	public ModelAndView calendar_add(@RequestParam("contentsid") String contentsid) {
		return new ModelAndView("wyy-view/calendar_add");
	}
}