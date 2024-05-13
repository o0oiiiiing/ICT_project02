package com.ict.jeju.pdh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.pdh.dao.QaVO;
import com.ict.jeju.pdh.service.PlaceListService;

@Controller
public class PlaceListController {
	@Autowired
	private PlaceListService placeListService;
	
	@Autowired
	private HttpSession session;

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

	@RequestMapping("detail")
	public ModelAndView detail(@RequestParam("contentsid") String contentsid, HttpSession session, HttpServletRequest request) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		ModelAndView mv = new ModelAndView("pdh-view/detail");
		
		// 상세정보 가져오기
		PlaceListVO placeDetail = placeListService.placeDetail(contentsid);
		
		// Q&A 리스트 가져오기
		List<QaVO> qaList = placeListService.qaList(contentsid);
		
		// 좋아요, 리뷰 수 가져오기
		int likeNum = placeListService.likeNum(contentsid);
		int reviewNum = placeListService.reviewNum(contentsid);

		// 조회수 올리기
		int hitUp = Integer.parseInt(placeDetail.getVi_hit());
		hitUp++;
		placeDetail.setVi_hit(String.valueOf(hitUp));
		placeListService.hitUpdate(contentsid);

		if (placeDetail != null) {
			mv.addObject("placeDetail", placeDetail);
			mv.addObject("likeNum", likeNum);
			mv.addObject("reviewNum", reviewNum);
			mv.addObject("qaList", qaList);
			return mv;
		}
		return null;
	}
	
	@PostMapping("qaWrite")
	public ModelAndView qaWrite(QaVO qaVO, @ModelAttribute("contentsid") String contentsid) {
		System.out.println(contentsid);
		// Q&A 작성 삽입
		int qaWrite = placeListService.qaWrite(qaVO);
		return new ModelAndView("redirect:detail");
	}

	// 일정 추가하기
	// 로그인 여부에 따라서 다르게 처리하기
	@GetMapping("addSchedule")
	public ModelAndView addSchedule(String contentsid) {
		return new ModelAndView("wyy-view/calendar_add");
	}

	// 검색하기
	@PostMapping("search")
	public ModelAndView search(String keyword) {
		ModelAndView mv = new ModelAndView("chm-view/searchlist");
		List<PlaceListVO> searchList = placeListService.searchList(keyword);
		if (searchList != null) {
			mv.addObject("searchList", searchList);
			return mv;
		}
		return null;
	}

}
