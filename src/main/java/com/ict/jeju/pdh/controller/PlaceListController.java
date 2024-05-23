package com.ict.jeju.pdh.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.pdh.dao.QaPaging;
import com.ict.jeju.pdh.dao.ImagesVO;
import com.ict.jeju.pdh.dao.PagingVO;
import com.ict.jeju.pdh.dao.QaVO;
import com.ict.jeju.pdh.dao.ReportVO;
import com.ict.jeju.pdh.dao.ReviewPaging;
import com.ict.jeju.pdh.dao.ReviewVO;
import com.ict.jeju.pdh.dao.WishVO;
import com.ict.jeju.pdh.service.PlaceListService;
import com.ict.jeju.wyy.dao.CalendarVO;
import com.ict.jeju.wyy.service.MytripService;

@Controller
public class PlaceListController {
	@Autowired
	private PlaceListService placeListService;
	@Autowired
	private MytripService calendarService4;
	@Autowired
	private HttpSession session;
	@Autowired
	private QaPaging qaPaging;
	@Autowired
	private ReviewPaging rPaging;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/")
	public String rootRedirect() {
		return "redirect:home";
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		List<PlaceListVO> popularList = placeListService.popularList();
		List<PlaceListVO> allList = placeListService.allList();
		if (popularList != null && allList != null) {
			Random random = new Random();

			// 관광지 목록과 음식점 목록을 따로 분리
			List<PlaceListVO> touristSpots = new ArrayList<>();
			List<PlaceListVO> restaurants = new ArrayList<>();
			for (PlaceListVO place : allList) {
				if ("관광지".equals(place.getVi_value())) {
					touristSpots.add(place);
				} else if ("음식점".equals(place.getVi_value())) {
					restaurants.add(place);
				}
			}

			PlaceListVO randomTour = touristSpots.get(random.nextInt(touristSpots.size()));
			PlaceListVO randomRestaurant = restaurants.get(random.nextInt(restaurants.size()));

			mv.addObject("popularList", popularList);
			mv.addObject("allList", allList);
			mv.addObject("randomTour", randomTour);
			mv.addObject("randomRestaurant", randomRestaurant);

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

		// Q&A 페이징
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
			mv.addObject("cPage", cPage);
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

		PagingVO qaPagingVO = new PagingVO();
		qaPagingVO.setContentsid(contentsid);

		qaPagingVO.setLimit(qaPaging.getNumPerPage());
		qaPagingVO.setOffset(qaPaging.getOffset());

		// Q&A 리스트 가져오기
		List<QaVO> qaList = placeListService.qaList(qaPagingVO);

		// 리뷰 페이징
		rPaging.setTotalRecord(reviewNum);

		// 전체 페이지 수 구하기
		if (rPaging.getTotalRecord() <= rPaging.getNumPerPage()) {
			rPaging.setTotalPage(1);
		} else {
			rPaging.setTotalPage(rPaging.getTotalRecord() / rPaging.getNumPerPage());
			if (rPaging.getTotalRecord() % rPaging.getNumPerPage() != 0) {
				rPaging.setTotalPage(rPaging.getTotalPage() + 1);
			}
		}

		// 현재 페이지 구하기
		String rCPage = request.getParameter("rCPage");
		if (rCPage == null) {
			rPaging.setNowPage(1);
		} else {
			rPaging.setNowPage(Integer.parseInt(rCPage));
			mv.addObject("rCPage", rCPage);
		}

		// offset 구하기
		rPaging.setOffset(rPaging.getNumPerPage() * (rPaging.getNowPage() - 1));

		// 시작 블록
		rPaging.setBeginBlock(
				(int) ((rPaging.getNowPage() - 1) / rPaging.getPagePerBlock()) * rPaging.getPagePerBlock() + 1);

		// 끝 블록
		rPaging.setEndBlock(rPaging.getBeginBlock() + rPaging.getPagePerBlock() - 1);

		// 끝 블록이 전체 페이지수보다 큰 경우 (한 블록에 n개의 페이지가 들어가야 하는데 페이지수가 그거에 못미칠 때)
		if (rPaging.getEndBlock() > rPaging.getTotalPage()) {
			// 끝 블록을 전체 페이수로 맞춘다.
			rPaging.setEndBlock(rPaging.getTotalPage());
		}

		PagingVO rPagingVO = new PagingVO();
		rPagingVO.setContentsid(contentsid);

		rPagingVO.setLimit(rPaging.getNumPerPage());
		rPagingVO.setOffset(rPaging.getOffset());

		// 리뷰 리스트 가져오기
		List<ReviewVO> reviewList = placeListService.reviewList(rPagingVO);

		if (placeDetail != null) {
			mv.addObject("placeDetail", placeDetail);
			mv.addObject("likeNum", likeNum);
			mv.addObject("qaNum", qaNum);
			mv.addObject("reviewNum", reviewNum);
			mv.addObject("qaList", qaList);
			mv.addObject("reviewList", reviewList);
			mv.addObject("qaPaging", qaPaging);
			mv.addObject("rPaging", rPaging);
			if (!reviewList.isEmpty()) {
				// 평균 별점
				double reviewAvg = (int) (placeListService.reviewAvg(contentsid) * 10) / 10.0;
				mv.addObject("reviewAvg", reviewAvg);
			}
			return mv;
		}
		return null;
	}

	@PostMapping("qaWrite")
	public ModelAndView qaWrite(QaVO qaVO, @ModelAttribute("contentsid") String contentsid) {
		// 비밀번호 암호화
		if (qaVO.getBo_pwd() != null) {
			qaVO.setBo_pwd(passwordEncoder.encode(qaVO.getBo_pwd()));
		}

		// Q&A 작성 삽입
		placeListService.qaWrite(qaVO);
		return new ModelAndView("redirect:detail");
	}
	
	// 리뷰 작성하기
	@PostMapping("reviewWrite")
	public ModelAndView reviewWrite(HttpServletRequest request, ReviewVO reviewVO, ImagesVO imagesVO,
			@ModelAttribute("contentsid") String contentsid, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		reviewVO.setU_profile_img(userVO.getU_profile_img());
		reviewVO.setU_name(userVO.getU_name());
		// review 작성 삽입
		placeListService.reviewWrite(reviewVO);
		MultipartFile[] images = imagesVO.getImages();
		String path = request.getSession().getServletContext().getRealPath("resources/upload");
		for (MultipartFile k : images) {
			System.out.println(k);
		}
		try {
			if (!images[0].isEmpty()) {
				for (MultipartFile k : images) {
					// 파일 이름 지정
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString() + "_" + k.getOriginalFilename();
					imagesVO.setPic_file(f_name);

					// 파일 업로드(복사)
					byte[] in = k.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
					placeListService.imageInsert(imagesVO);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("redirect:detail");
	}
	
	// 신고 작성하기
	@PostMapping("reportWrite")
	public ModelAndView reportWrite(ReportVO reportVO, @ModelAttribute("contentsid") String contentsid) {
		// 신고 작성 삽입
		placeListService.reportWrite(reportVO);

		return new ModelAndView("redirect:detail");
	}

	// 캘린더 일정 추가하기
	@RequestMapping("addSchedule")
	public ModelAndView saveCal(CalendarVO cvo4, HttpServletRequest request, @ModelAttribute("contentsid") String contentsid) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int result = calendarService4.saveCal(cvo4, userVO.getU_idx());
		if (result > 0) {
			return new ModelAndView("redirect:detail");
		}
		return new ModelAndView("wyy-view/error");
	}
	
	// 좋아요한 여행지에 추가하기
	@RequestMapping("addWish")
	public ModelAndView addWish(@ModelAttribute("contentsid") String contentsid, WishVO wishVO) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		wishVO.setU_idx(userVO.getU_idx());
		wishVO.setContentsid(contentsid);
		int result = placeListService.addWish(wishVO);
		
		if (result > 0) {
			return new ModelAndView("redirect:detail");
		}
		return new ModelAndView("wyy-view/error");
	}
	
	// 좋아요한 여행지에서 제거하기
	@RequestMapping("removeWish")
	public ModelAndView removeWish(@ModelAttribute("contentsid") String contentsid, WishVO wishVO) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		wishVO.setU_idx(userVO.getU_idx());
		wishVO.setContentsid(contentsid);
		int result = placeListService.removeWish(wishVO);
		
		if (result > 0) {
			return new ModelAndView("redirect:detail");
		}
		return new ModelAndView("wyy-view/error");
	}

}
