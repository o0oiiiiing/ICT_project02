package com.ict.jeju.pdh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.pdh.dao.VO;

@Controller
public class WowController {

	@GetMapping("home")
	public ModelAndView home() {
		return new ModelAndView("pdh-view/home");
	}

	@GetMapping("detail")
	public ModelAndView detail() {
		return new ModelAndView("pdh-view/detail");
	}

	/*
	 * @GetMapping("join") public ModelAndView join(VO vo) { ModelAndView mv = new
	 * ModelAndView("pdh-view/pdh"); mv.addObject("70만원 키보드", 사고싶은 키보드) return mv; }
	 */
}
