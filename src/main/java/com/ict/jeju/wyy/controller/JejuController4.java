package com.ict.jeju.wyy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JejuController4 {
	
	@RequestMapping("myTripPlan")
	public ModelAndView myTripPlan() {
		return new ModelAndView("wyy-view/myTripPlan");
	}
}
