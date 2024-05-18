package com.ict.jeju.ygh.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.common.Paging;
import com.ict.jeju.common.Paging2;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.wyy.dao.AdminVO;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
import com.ict.jeju.ygh.dao.MyreviewVO;
import com.ict.jeju.ygh.dao.ReplyVO;
import com.ict.jeju.ygh.dao.ReportVO;
import com.ict.jeju.ygh.service.JejuService5;

@Controller
public class JejuController5 {
	@Autowired
	private JejuService5 jejuService5;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private Paging paging;
	@Autowired
	private Paging2 paging2;

	// 게시판 이동
	@GetMapping("all_list.do")
	public ModelAndView allList() {
		return new ModelAndView("ygh-view/index");
	}

	// 비밀번호 변경
	@GetMapping("repwd_go.do")
	public ModelAndView rePwd() {
		return new ModelAndView("ygh-view/repwd_page");
	}

	// 관리자 게시판
	@RequestMapping("admin_list.do")
	public ModelAndView adminList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/admin_list");

		// 페이징 미답변 Q&A
		int count = jejuService5.getTotalCount();
		paging.setTotalRecord(count);

		if (paging.getTotalRecord() <= paging.getNumPerPage2()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage2());
			if (paging.getTotalRecord() % paging.getNumPerPage2() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage2() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		// 페이징 신고
		int count2 = jejuService5.getTotalCount2();
		paging2.setTotalRecord(count2);

		if (paging2.getTotalRecord() <= paging2.getNumPerPage2()) {
			paging2.setTotalPage(1);
		} else {
			paging2.setTotalPage(paging2.getTotalRecord() / paging2.getNumPerPage2());
			if (paging2.getTotalRecord() % paging2.getNumPerPage2() != 0) {
				paging2.setTotalPage(paging2.getTotalPage() + 1);
			}
		}

		String cPage2 = request.getParameter("cPage2");
		if (cPage2 == null) {
			paging2.setNowPage2(1);
		} else {
			paging2.setNowPage2(Integer.parseInt(cPage2));
		}

		paging2.setOffset(paging2.getNumPerPage2() * (paging2.getNowPage2() - 1));

		paging2.setBeginBlock(
				(int) ((paging2.getNowPage2() - 1) / paging2.getPagePerBlock()) * paging2.getPagePerBlock() + 1);
		paging2.setEndBlock(paging2.getBeginBlock() + paging2.getPagePerBlock() - 1);

		if (paging2.getEndBlock() > paging2.getTotalPage()) {
			paging2.setEndBlock(paging2.getTotalPage());
		}

		// DB
		List<BoardVO> board_list = jejuService5.adminBoardList(paging.getOffset(), paging.getNumPerPage2());
		List<ReportVO> report_list = jejuService5.adminReportList(paging2.getOffset(), paging2.getNumPerPage2());
		if (board_list != null && report_list != null) {
			mv.addObject("board_list", board_list);
			mv.addObject("paging", paging);
			mv.addObject("report_list", report_list);
			mv.addObject("paging2", paging2);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 관리자 Q&A 상세보기
	@RequestMapping("admin_board_detail.do")
	public ModelAndView adminBoardDetail(@ModelAttribute("cPage") String cPage, String bo_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/admin_board_detail");
		// 상세보기
		BoardVO bovo = jejuService5.boardDetail(bo_idx);

		if (bovo != null) {
			// 댓글 가져오기
			List<CommentVO> com_list = jejuService5.commentList(bo_idx);
			mv.addObject("com_list", com_list);
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 관리자 신고 상세보기
	@RequestMapping("admin_report_detail.do")
	public ModelAndView adminReportDetail(@ModelAttribute("cPage2") String cPage2, String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/admin_report_detail");
		ReportVO revo = jejuService5.reportDetail(report_idx);

		if (revo != null) {
			// 댓글 가져오기
			List<ReplyVO> rep_list = jejuService5.replyList(report_idx);
			mv.addObject("rep_list", rep_list);
			mv.addObject("revo", revo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// Q&A 답글 작성
	@PostMapping("board_ans_write_ok.do")
	public ModelAndView commentInsert(CommentVO comvo, @ModelAttribute("bo_idx") String bo_idx, @ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("redirect:admin_board_detail.do");
		int result = jejuService5.commentInsert(comvo);
		int result2 = jejuService5.commentUpdate(bo_idx);
		return mv;
	}

	// Q&A 답글 삭제
	@PostMapping("comment_delete.do")
	public ModelAndView commentDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("bo_idx") String bo_idx,
			CommentVO comvo) {
		ModelAndView mv = new ModelAndView();
		int result = jejuService5.commentDelete(comvo);
		if (result > 0) {
			mv.setViewName("redirect:admin_board_detail.do");
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 신고 답글 작성
	@PostMapping("report_ans_write_ok.do")
	public ModelAndView replyInsert(ReplyVO repvo, @ModelAttribute("report_idx") String report_idx, @ModelAttribute("cPage2") String cPage2) {
		ModelAndView mv = new ModelAndView("redirect:admin_report_detail.do");
		int result = jejuService5.replyInsert(repvo);
		int result2 = jejuService5.replyUpdate(report_idx);
		return mv;
	}

	// 신고 답글 삭제
	@PostMapping("reply_delete.do")
	public ModelAndView replyDelete(@ModelAttribute("cPage2") String cPage2,
			@ModelAttribute("report_idx") String report_idx, ReplyVO repvo) {
		ModelAndView mv = new ModelAndView();
		int result = jejuService5.replyDelete(repvo);
		if (result > 0) {
			mv.setViewName("redirect:admin_report_detail.do");
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 게시판
	@RequestMapping("board_list.do")
	public ModelAndView boardlist(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/board_list");
		UserVO uvo = (UserVO) session.getAttribute("userVO");

		// 페이징
		int count3 = jejuService5.getTotalCount3(uvo.getU_idx());
		paging.setTotalRecord(count3);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		// DB
		List<BoardVO> board_list = jejuService5.boardList(paging.getOffset(), paging.getNumPerPage(), uvo.getU_idx());
		for (BoardVO k : board_list) {
			k.getBo_idx();
		}
		if (board_list != null) {
			mv.addObject("board_list", board_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 상세보기
	@RequestMapping("board_detail.do")
	public ModelAndView boardDetail(@ModelAttribute("cPage") String cPage, String bo_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/board_detail");
		// 상세보기
		BoardVO bovo = jejuService5.boardDetail(bo_idx);

		if (bovo != null) {
			// 댓글 가져오기
			List<CommentVO> com_list = jejuService5.commentList(bo_idx);
			mv.addObject("com_list", com_list);
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 작성
	@GetMapping("board_write_go.do")
	public ModelAndView boardWriteGo() {
		return new ModelAndView("ygh-view/board_write");
	}

	// 사용자 Q&A 작성
	@PostMapping("board_write_ok.do")
	public ModelAndView boardWriteOk(BoardVO bovo) {
		try {
			ModelAndView mv = new ModelAndView("redirect:board_list.do");

			// 비밀번호 암호화
			bovo.setBo_pwd(passwordEncoder.encode(bovo.getBo_pwd()));

			int result = jejuService5.boardWriteOk(bovo);
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 수정
	@PostMapping("board_update.do")
	public ModelAndView boardUpdate(@ModelAttribute("cPage") String cPage, @ModelAttribute("bo_idx") String bo_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/board_update");
		BoardVO bovo = jejuService5.boardDetail(bo_idx);
		if (bovo != null) {
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 수정
	@PostMapping("board_update_ok.do")
	public ModelAndView boardUpdateOk(@ModelAttribute("cPage") String cPage, @ModelAttribute("bo_idx") String bo_idx,
			BoardVO bovo) {
		ModelAndView mv = new ModelAndView();

		BoardVO bovo2 = jejuService5.boardDetail(bovo.getBo_idx());
		String dpwd = bovo2.getBo_pwd();

		if (!passwordEncoder.matches(bovo.getBo_pwd(), dpwd)) {
			mv.setViewName("ygh-view/board_update");
			mv.addObject("pwdchk", "fail");
			mv.addObject("bovo", bovo);
			return mv;
		} else {
			int result = jejuService5.boardUpdate(bovo);
			if (result > 0) {
				mv.setViewName("redirect:board_detail.do");
				return mv;
			}
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 삭제
	@PostMapping("board_delete.do")
	public ModelAndView getBoardDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("bo_idx") String bo_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/board_delete");
		BoardVO bovo = jejuService5.boardDetail(bo_idx);
		if (bovo != null) {
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 Q&A 삭제
	@PostMapping("board_delete_ok.do")
	public ModelAndView getBoardDeleteOk(@ModelAttribute("cPage") String cPage, @ModelAttribute("bo_idx") String bo_idx,
			BoardVO bovo) {
		ModelAndView mv = new ModelAndView();

		BoardVO bovo2 = jejuService5.boardDetail(bovo.getBo_idx());
		String dpwd = bovo2.getBo_pwd();

		if (!passwordEncoder.matches(bovo.getBo_pwd(), dpwd)) {
			mv.setViewName("ygh-view/board_delete");
			mv.addObject("pwdchk", "fail");
			return mv;
		} else {
			// active 컬럼의 값을 1로 변경하자.
			int result = jejuService5.boardDelete(bovo2);
			if (result > 0) {
				mv.setViewName("redirect:board_list.do");
				return mv;
			}
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 게시판
	@RequestMapping("report_list.do")
	public ModelAndView reportlist(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/report_list");
		UserVO uvo = (UserVO) session.getAttribute("userVO");

		// 페이징
		int count4 = jejuService5.getTotalCount4(uvo.getU_idx());
		paging2.setTotalRecord(count4);

		if (paging2.getTotalRecord() <= paging2.getNumPerPage2()) {
			paging2.setTotalPage(1);
		} else {
			paging2.setTotalPage(paging2.getTotalRecord() / paging2.getNumPerPage2());
			if (paging2.getTotalRecord() % paging2.getNumPerPage2() != 0) {
				paging2.setTotalPage(paging2.getTotalPage() + 1);
			}
		}

		String cPage2 = request.getParameter("cPage2");
		if (cPage2 == null) {
			paging2.setNowPage2(1);
		} else {
			paging2.setNowPage2(Integer.parseInt(cPage2));
		}

		paging2.setOffset(paging2.getNumPerPage2() * (paging2.getNowPage2() - 1));

		paging2.setBeginBlock(
				(int) ((paging2.getNowPage2() - 1) / paging2.getPagePerBlock()) * paging2.getPagePerBlock() + 1);
		paging2.setEndBlock(paging2.getBeginBlock() + paging2.getPagePerBlock() - 1);

		if (paging2.getEndBlock() > paging2.getTotalPage()) {
			paging2.setEndBlock(paging2.getTotalPage());
		}

		// DB
		List<ReportVO> report_list = jejuService5.reportList(paging2.getOffset(), paging2.getNumPerPage2(),
				uvo.getU_idx());
		if (report_list != null) {
			mv.addObject("report_list", report_list);
			mv.addObject("paging2", paging2);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 상세보기
	@RequestMapping("report_detail.do")
	public ModelAndView reportDetail(@ModelAttribute("cPage2") String cPage2, String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/report_detail");
		// 상세보기
		ReportVO revo = jejuService5.reportDetail(report_idx);

		if (revo != null) {
			// 댓글 가져오기
			List<ReplyVO> rep_list = jejuService5.replyList(report_idx);
			mv.addObject("rep_list", rep_list);
			mv.addObject("revo", revo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 작성
	@GetMapping("report_write_go.do")
	public ModelAndView reportWriteGo() {
		return new ModelAndView("ygh-view/report_write");
	}

	// 사용자 신고 작성
	@PostMapping("report_write_ok.do")
	public ModelAndView reportWriteOk(ReportVO revo) {
		try {
			ModelAndView mv = new ModelAndView("redirect:report_list.do");

			revo.setReport_pwd(passwordEncoder.encode(revo.getReport_pwd()));

			int result = jejuService5.reportWriteOk(revo);
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 수정
	@PostMapping("report_update.do")
	public ModelAndView reportUpdate(@ModelAttribute("cPage2") String cPage2,
			@ModelAttribute("report_idx") String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/report_update");
		ReportVO revo = jejuService5.reportDetail(report_idx);
		if (revo != null) {
			mv.addObject("revo", revo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 수정
	@PostMapping("report_update_ok.do")
	public ModelAndView boardUpdateOk(@ModelAttribute("cPage2") String cPage2,
			@ModelAttribute("report_idx") String report_idx, ReportVO revo) {
		ModelAndView mv = new ModelAndView();

		ReportVO revo2 = jejuService5.reportDetail(revo.getReport_idx());
		String dpwd = revo2.getReport_pwd();

		if (!passwordEncoder.matches(revo.getReport_pwd(), dpwd)) {
			mv.setViewName("ygh-view/report_update");
			mv.addObject("pwdchk", "fail");
			mv.addObject("revo", revo);
			return mv;
		} else {
			int result = jejuService5.reportUpdate(revo);
			if (result > 0) {
				mv.setViewName("redirect:report_detail.do");
				return mv;
			}
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 삭제
	@PostMapping("report_delete.do")
	public ModelAndView reportDelete(@ModelAttribute("cPage2") String cPage2,
			@ModelAttribute("report_idx") String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/report_delete");
		ReportVO revo = jejuService5.reportDetail(report_idx);

		if (revo != null) {
			mv.addObject("revo", revo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 사용자 신고 삭제
	@PostMapping("report_delete_ok.do")
	public ModelAndView reportDeleteOk(@ModelAttribute("cPage2") String cPage2,
			@ModelAttribute("report_idx") String report_idx, ReportVO revo) {
		ModelAndView mv = new ModelAndView();

		ReportVO revo2 = jejuService5.reportDetail(revo.getReport_idx());
		String dpwd = revo2.getReport_pwd();

		if (!passwordEncoder.matches(revo.getReport_pwd(), dpwd)) {
			mv.setViewName("ygh-view/report_delete");
			mv.addObject("pwdchk", "fail");
			return mv;
		} else {
			// active 컬럼의 값을 1로 변경하자.
			int result = jejuService5.reportDelete(revo2);
			if (result > 0) {
				mv.setViewName("redirect:report_list.do");
				return mv;
			}
		}
		return new ModelAndView("ygh-view/error");
	}

	// 회원정보수정
	@GetMapping("user_update.do")
	public ModelAndView userUpdate(HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/user_update");

		UserVO uvo = (UserVO) session.getAttribute("userVO");
		UserVO userVO = jejuService5.userDetail(uvo.getU_idx());

		if (userVO != null) {
			mv.addObject("userVO", userVO);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 회원정보수정
	@PostMapping("user_update_ok.do")
	public ModelAndView userUpdate(UserVO userVO, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:myTripPlan");

		UserVO uvo = (UserVO) session.getAttribute("userVO");
		String dpwd = uvo.getU_pwd();

		if (!passwordEncoder.matches(userVO.getU_pwd(), dpwd)) {
			mv.setViewName("ygh-view/user_update");
			mv.addObject("pwdchk", "fail");
			mv.addObject("userVO", userVO);
			return mv;
		} else {
			int result = jejuService5.userUpdate(userVO);
			if (result > 0) {
				return mv;
			}
		}
		return new ModelAndView("ygh-view/error");
	}

	// 비밀번호 변경
	@PostMapping("repwd_go.do")
	public ModelAndView getRePwd(HttpSession session, String re_pwd, String re_pwd2, UserVO userVO) {
		ModelAndView mv = new ModelAndView();

		// 세션에 저장된 user 정보
		UserVO uvo = (UserVO) session.getAttribute("userVO");
		// DB u_pwd
		String dpwd = uvo.getU_pwd();

		if (!passwordEncoder.matches(userVO.getU_pwd(), dpwd) || !re_pwd.equals(re_pwd2)) {
			mv.addObject("userVO", uvo);
			mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("ygh-view/repwd_page");
			return mv;
		} else {
			// 새 비밀번호 암호화
			String repwd = passwordEncoder.encode(re_pwd);
			uvo.setU_pwd(repwd);

			// 새 비밀번호 update
			int result = jejuService5.rePwd(uvo);
			if (result > 0) {
				mv.addObject("userVO", uvo);
				mv.addObject("msg", "비밀번호가 변경되었습니다.");
				mv.setViewName("redirect:myTripPlan");
				return mv;
			}
			return new ModelAndView("ygh-view/error");
		}
	}

	// 관지라 전체 Q&A 게시판
	@RequestMapping("admin_board_list.do")
	public ModelAndView adminBoardlist(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/admin_board_list");
		UserVO uvo = (UserVO) session.getAttribute("userVO");

		// 페이징
		int count5 = jejuService5.getTotalCount5();
		paging.setTotalRecord(count5);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		// DB
		List<BoardVO> board_list = jejuService5.adminBoardlist2(paging.getOffset(), paging.getNumPerPage());
		for (BoardVO k : board_list) {
			k.getBo_idx();
		}
		if (board_list != null) {
			mv.addObject("board_list", board_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 관리자 전체 신고 게시판
	@RequestMapping("admin_report_list.do")
	public ModelAndView adminReportlist(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/admin_report_list");
		UserVO uvo = (UserVO) session.getAttribute("userVO");

		// 페이징
		int count6 = jejuService5.getTotalCount6();
		paging2.setTotalRecord(count6);

		if (paging2.getTotalRecord() <= paging2.getNumPerPage2()) {
			paging2.setTotalPage(1);
		} else {
			paging2.setTotalPage(paging2.getTotalRecord() / paging2.getNumPerPage2());
			if (paging2.getTotalRecord() % paging2.getNumPerPage2() != 0) {
				paging2.setTotalPage(paging2.getTotalPage() + 1);
			}
		}

		String cPage2 = request.getParameter("cPage2");
		if (cPage2 == null) {
			paging2.setNowPage2(1);
		} else {
			paging2.setNowPage2(Integer.parseInt(cPage2));
		}

		paging2.setOffset(paging2.getNumPerPage2() * (paging2.getNowPage2() - 1));

		paging2.setBeginBlock(
				(int) ((paging2.getNowPage2() - 1) / paging2.getPagePerBlock()) * paging2.getPagePerBlock() + 1);
		paging2.setEndBlock(paging2.getBeginBlock() + paging2.getPagePerBlock() - 1);

		if (paging2.getEndBlock() > paging2.getTotalPage()) {
			paging2.setEndBlock(paging2.getTotalPage());
		}

		// DB
		List<ReportVO> report_list = jejuService5.adminReportlist2(paging2.getOffset(), paging2.getNumPerPage2());
		if (report_list != null) {
			mv.addObject("report_list", report_list);
			mv.addObject("paging2", paging2);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	/*
	 * // 회원관리 페이지 이동
	 * 
	 * @GetMapping("user_list.do") public ModelAndView userList() { return new
	 * ModelAndView("ygh-view/user_list"); }
	 */

	// 회원관리
	@RequestMapping("user_list.do")
	public ModelAndView userList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("ygh-view/user_list");

		// 페이징
		int count7 = jejuService5.getTotalCount7();
		paging.setTotalRecord(count7);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		// DB
		List<UserVO> user_list = jejuService5.userList(paging.getOffset(), paging.getNumPerPage());

		if (user_list != null) {
			mv.addObject("user_list", user_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 회원관리 삭제
    @PostMapping("user_del_ok.do")
    public ModelAndView userDelOk(@ModelAttribute("cPage") String cPage,
            AdminVO adminVO, HttpSession session, UserVO userVO) {
        ModelAndView mv = new ModelAndView("redirect:user_list.do");
        
        // 세션에 저장된 관리자 정보
        AdminVO avo = (AdminVO) session.getAttribute("adminVO");
        AdminVO avo2 = jejuService5.adminDetail(avo.getA_idx());
        String dpwd = avo2.getA_pwd();
        
        if (!passwordEncoder.matches(adminVO.getA_pwd(), dpwd)) {
            mv.setViewName("ygh-view/user_list");
            mv.addObject("pwdchk", "fail");
            mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
            mv.addObject("user_list", jejuService5.userList(paging.getOffset(), paging.getNumPerPage()));
            mv.addObject("paging", paging);
            return mv;
        } else {
            // active 컬럼의 값을 1로 변경하자.
            int result = jejuService5.userDelete(userVO);
            if (result > 0) {
                mv.setViewName("ygh-view/user_list");
                mv.addObject("del", "ok");
                mv.addObject("msg", "해당 회원 계정을 삭제했습니다.");
                mv.addObject("user_list", jejuService5.userList(paging.getOffset(), paging.getNumPerPage()));
                mv.addObject("paging", paging);
                return mv;
            }
        }
        return new ModelAndView("ygh-view/error");
    }
    
    // 회원관리 복구
    @PostMapping("user_restore_ok.do")
    public ModelAndView userRestoreOk(@ModelAttribute("cPage") String cPage,
    		AdminVO adminVO, HttpSession session, UserVO userVO) {
    	ModelAndView mv = new ModelAndView("redirect:user_list.do");
    	
    	// 세션에 저장된 관리자 정보
    	AdminVO avo = (AdminVO) session.getAttribute("adminVO");
    	AdminVO avo2 = jejuService5.adminDetail(avo.getA_idx());
    	String dpwd = avo2.getA_pwd();
    	
    	if (!passwordEncoder.matches(adminVO.getA_pwd(), dpwd)) {
    		mv.setViewName("ygh-view/user_list");
    		mv.addObject("pwdchk", "fail");
    		mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
    		mv.addObject("user_list", jejuService5.userList(paging.getOffset(), paging.getNumPerPage()));
    		mv.addObject("paging", paging);
    		return mv;
    	} else {
    		// active 컬럼의 값을 0로 변경하자.
    		int result = jejuService5.userRestore(userVO);
    		if (result > 0) {
    			mv.setViewName("ygh-view/user_list");
    			mv.addObject("restore", "ok");
    			mv.addObject("msg", "해당 회원 계정을 복구했습니다.");
    			mv.addObject("user_list", jejuService5.userList(paging.getOffset(), paging.getNumPerPage()));
    			mv.addObject("paging", paging);
    			return mv;
    		}
    	}
    	return new ModelAndView("ygh-view/error");
    }
    
    @RequestMapping("user_detail.do")
    public ModelAndView userDetail(@ModelAttribute("u_idx") String u_idx) {
    	ModelAndView mv = new ModelAndView("ygh-view/user_detail");
    	
    	System.out.println(u_idx);
    	UserVO uvo = jejuService5.userDetail(u_idx);
    	if (uvo != null) {
			mv.addObject("uvo", uvo);
			return mv;
		}
    	return new ModelAndView("ygh-view/error");
    }
    
    // 나의 리뷰
 	@RequestMapping("myreview_list.do")
 	public ModelAndView myreviewlist(HttpServletRequest request, HttpSession session) {
 		ModelAndView mv = new ModelAndView("chm-view/myreview_list");
 		UserVO myvo = (UserVO) session.getAttribute("userVO");
 		
 		// 페이징
 		int count3 = jejuService5.getTotalCount3(myvo.getU_idx());
 		paging.setTotalRecord(count3);

 		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
 			paging.setTotalPage(1);
 		} else {
 			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
 			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
 				paging.setTotalPage(paging.getTotalPage() + 1);
 			}
 		}

 		String cPage = request.getParameter("cPage");
 		if (cPage == null) {
 			paging.setNowPage(1);
 		} else {
 			paging.setNowPage(Integer.parseInt(cPage));
 		}

 		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

 		paging.setBeginBlock(
 				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
 		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

 		if (paging.getEndBlock() > paging.getTotalPage()) {
 			paging.setEndBlock(paging.getTotalPage());
 		}

 		// DB
 		List<MyreviewVO> myreview_list = jejuService5.myreviewlist(paging.getOffset(), paging.getNumPerPage(), myvo.getU_idx());
 		
 		for (MyreviewVO k : myreview_list) {
 			k.getU_idx();
 			System.out.println(k.getU_idx());
 		}
 		if (myreview_list != null) {
 			mv.addObject("myreview_list", myreview_list);
 			mv.addObject("paging", paging);
 			return mv;
 		}
 		return new ModelAndView("ygh-view/error");
 	}
}
