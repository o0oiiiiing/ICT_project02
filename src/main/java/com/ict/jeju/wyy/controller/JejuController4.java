package com.ict.jeju.wyy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JejuController4 {
	
	@RequestMapping("wyyhome")
	public ModelAndView wyyHome() {
		return new ModelAndView("wyy-view/index");
	}
	@RequestMapping("myTripPlan")
	public ModelAndView myTripPlan() {
		return new ModelAndView("wyy-view/myTripPlan");
	}
	@RequestMapping("calendar")
	public ModelAndView getPlanner() {
		return new ModelAndView("wyy-view/calendar");
	}
}
