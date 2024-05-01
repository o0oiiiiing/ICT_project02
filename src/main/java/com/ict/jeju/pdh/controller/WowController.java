package com.ict.jeju.pdh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.pdh.dao.PlaceListVO;

@Controller
public class WowController {

	@GetMapping("map_practice")
	public ModelAndView map_practice() {
		return new ModelAndView("pdh-view/map_practice");
	}

	/*
	 * @GetMapping("join") public ModelAndView join(VO vo) { ModelAndView mv = new
	 * ModelAndView("pdh-view/pdh"); mv.addObject("70만원 키보드", 사고싶은 키보드) return mv; }
	 */
}
