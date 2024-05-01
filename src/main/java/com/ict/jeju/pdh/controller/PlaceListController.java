package com.ict.jeju.pdh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.pdh.service.PlaceListService;

@Controller
public class PlaceListController {
	@Autowired
	private PlaceListService placeListService;

	@RequestMapping("home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		List<PlaceListVO> popularList = placeListService.popularList();
		if (popularList != null) {
			mv.addObject("popularList", popularList);
			return mv;
		}
		return null;
	}

	@GetMapping("detail")
	public ModelAndView detail(@RequestParam("contentsid") String contentsid) {
		ModelAndView mv = new ModelAndView("pdh-view/detail");
		PlaceListVO placeDetail = placeListService.placeDetail(contentsid);
		int likeNum = placeListService.likeNum(contentsid);
		int reviewNum = placeListService.reviewNum(contentsid);
		System.out.println();
		if (placeDetail != null) {
			mv.addObject("placeDetail", placeDetail);
			mv.addObject("likeNum", likeNum);
			mv.addObject("reviewNum", reviewNum);
			return mv;
		}
		return null;
	}

}