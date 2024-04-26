package com.ict.jeju.wyy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.service.CalendarService4;

@Controller
public class JejuController4 {
	
	@Autowired
	private CalendarService4 calendarService4;
	
	
	@RequestMapping("wyyhome")
	public ModelAndView wyyHome() {
		return new ModelAndView("wyy-view/index");
	}
	@RequestMapping("myTripPlan")
	public ModelAndView myTripPlan(String u_idx) {
		ModelAndView mv = new ModelAndView("wyy-view/myTripPlan");
		List<CalendarVO4> list = calendarService4.myTripPlan(u_idx);
		List<LikeVO> like_list = calendarService4.myTripLike(u_idx);
		if (list != null) {
			mv.addObject("u_idx", u_idx);
			mv.addObject("list", list);
			mv.addObject("like_list", like_list);
			return mv;
		}
		return null;
	}
	@RequestMapping("calendar")
	public ModelAndView getPlanner() {
		return new ModelAndView("wyy-view/calendar");
	}
	@RequestMapping("addCalList")
	public ModelAndView modal() {
		return new ModelAndView("wyy-view/calendar_modal");
	}
}
