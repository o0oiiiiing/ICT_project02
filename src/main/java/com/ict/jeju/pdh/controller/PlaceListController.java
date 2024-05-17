package com.ict.jeju.pdh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.pdh.dao.QaPaging;
import com.ict.jeju.pdh.dao.QaPagingVO;
import com.ict.jeju.pdh.dao.QaVO;
import com.ict.jeju.pdh.dao.ReviewVO;
import com.ict.jeju.pdh.service.PlaceListService;

@Controller
public class PlaceListController {
	@Autowired
	private PlaceListService placeListService;
	@Autowired
	private HttpSession session;
	@Autowired
	private QaPaging qaPaging;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

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
	public ModelAndView detail(@RequestParam("contentsid") String contentsid, HttpSession session,
			HttpServletRequest request) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		ModelAndView mv = new ModelAndView("pdh-view/detail");

		// 상세정보 가져오기
		PlaceListVO placeDetail = placeListService.placeDetail(contentsid);

		// 좋아요, Q&A, 리뷰 수 가져오기
		int likeNum = placeListService.likeNum(contentsid);
		int qaNum = placeListService.qaNum(contentsid);
		int reviewNum = placeListService.reviewNum(contentsid);

		// 조회수 올리기
		int hitUp = Integer.parseInt(placeDetail.getVi_hit());
		hitUp++;
		placeDetail.setVi_hit(String.valueOf(hitUp));
		placeListService.hitUpdate(contentsid);

		// 페이징
		qaPaging.setTotalRecord(qaNum);

		// 전체 페이지 수 구하기
		if (qaPaging.getTotalRecord() <= qaPaging.getNumPerPage()) {
			qaPaging.setTotalPage(1);
		} else {
			qaPaging.setTotalPage(qaPaging.getTotalRecord() / qaPaging.getNumPerPage());
			if (qaPaging.getTotalRecord() % qaPaging.getNumPerPage() != 0) {
				qaPaging.setTotalPage(qaPaging.getTotalPage() + 1);
			}
		}

		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			qaPaging.setNowPage(1);
		} else {
			qaPaging.setNowPage(Integer.parseInt(cPage));
		}

		// offset 구하기
		qaPaging.setOffset(qaPaging.getNumPerPage() * (qaPaging.getNowPage() - 1));

		// 시작 블록
		qaPaging.setBeginBlock(
				(int) ((qaPaging.getNowPage() - 1) / qaPaging.getPagePerBlock()) * qaPaging.getPagePerBlock() + 1);

		// 끝 블록
		qaPaging.setEndBlock(qaPaging.getBeginBlock() + qaPaging.getPagePerBlock() - 1);

		// 끝 블록이 전체 페이지수보다 큰 경우 (한 블록에 n개의 페이지가 들어가야 하는데 페이지수가 그거에 못미칠 때)
		if (qaPaging.getEndBlock() > qaPaging.getTotalPage()) {
			// 끝 블록을 전체 페이수로 맞춘다.
			qaPaging.setEndBlock(qaPaging.getTotalPage());
		}

		QaPagingVO qaPagingVO = new QaPagingVO();
		qaPagingVO.setContentsid(contentsid);

		qaPagingVO.setLimit(qaPaging.getNumPerPage());
		qaPagingVO.setOffset(qaPaging.getOffset());

		// Q&A 리스트 가져오기
		List<QaVO> qaList = placeListService.qaList(qaPagingVO);

		if (placeDetail != null) {
			mv.addObject("placeDetail", placeDetail);
			mv.addObject("likeNum", likeNum);
			mv.addObject("qaNum", qaNum);
			mv.addObject("reviewNum", reviewNum);
			mv.addObject("qaList", qaList);
			mv.addObject("qaPaging", qaPaging);
			return mv;
		}
		return null;
	}

	@PostMapping("qaWrite")
	public ModelAndView qaWrite(QaVO qaVO, @ModelAttribute("contentsid") String contentsid) {
		System.out.println(contentsid);
		// Q&A 작성 삽입
		// 비밀번호 암호화
		if (qaVO.getBo_pwd() != null) {
			qaVO.setBo_pwd(passwordEncoder.encode(qaVO.getBo_pwd()));
		}
		placeListService.qaWrite(qaVO);
		return new ModelAndView("redirect:detail");
	}
	
	/*
	 * @PostMapping("reviewWrite") public ModelAndView reviewWrite(ReviewVO
	 * reviewVO) { MultipartFile[] images = }
	 */

	// 일정 추가하기
	// 로그인 여부에 따라서 다르게 처리하기
	@GetMapping("addSchedule")
	public ModelAndView addSchedule(String contentsid) {
		return new ModelAndView("wyy-view/calendar_add");
	}

	// 검색하기
//	@PostMapping("search")
//	public ModelAndView search(String keyword) {
//		ModelAndView mv = new ModelAndView("chm-view/searchlist");
//		List<PlaceListVO> searchList = placeListService.searchList(keyword);
//		if (searchList != null) {
//			mv.addObject("searchList", searchList);
//			return mv;
//		}
//		return null;
//	}


}
