package com.ict.jeju.ygh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.common.Paging;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.ReportVO;
import com.ict.jeju.ygh.service.JejuService5;

@Controller
public class JejuController5 {
	@Autowired
	private JejuService5 jejuService5;
	@Autowired
	private Paging paging;

	// 회원정보수정
	@GetMapping("user_update.do")
	public ModelAndView userUpdate() {
		return new ModelAndView("ygh-view/user_update");
	}

	// 비밀번호 변경
	@GetMapping("repwd_go.do")
	public ModelAndView rePwd() {
		return new ModelAndView("ygh-view/repwd_page");
	}
	/*
	 * @GetMapping("admin.do") public ModelAndView admin() { return new
	 * ModelAndView("ygh-view/board_list"); }
	 */

	@GetMapping("board_list_go.do")
	public ModelAndView boardListGo() {
		return new ModelAndView("ygh-view/board_list");
	}

	@GetMapping("report_list_go.do")
	public ModelAndView reportListGo() {
		return new ModelAndView("ygh-view/report_list");
	}

	// 관리자페이지 Q&A
	@RequestMapping("board_list.do")
	public ModelAndView boardList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ygh-view/board_list");

		// 전체 게시물의 수
		int count = jejuService5.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수를 구하자.
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// offset = limit * (현재 페이지 -1)
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<BoardVO> board_list = jejuService5.getBoardList(paging.getOffset(), paging.getNumPerPage());
		if (board_list != null) {
			mv.addObject("board_list", board_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("board/error");
	}

	// 관리자페이지 Q&A
	@GetMapping("board_detail.do")
	public ModelAndView boardDetail(@ModelAttribute("cPage") String cPage, String bo_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/board_detail");
		BoardVO bovo = jejuService5.getBoardDetail(bo_idx);

		if (bovo != null) {
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("board/error");
	}

	// 관리자페이지 신고
	@RequestMapping("report_list.do")
	public ModelAndView reportList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ygh-view/board_list");

		// 전체 게시물의 수
		int count = jejuService5.getTotalCount2();
		paging.setTotalRecord(count);

		// 전체 페이지의 수를 구하자.
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// offset = limit * (현재 페이지 -1)
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<ReportVO> report_list = jejuService5.getReportList(paging.getOffset(), paging.getNumPerPage());
		if (report_list != null) {
			mv.addObject("report_list", report_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("board/error");
	}

	// 관리자페이지 신고
	@GetMapping("report_detail.do")
	public ModelAndView reportDetail(@ModelAttribute("cPage") String cPage, String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/report_detail");
		ReportVO revo = jejuService5.getReportDetail(report_idx);

		if (revo != null) {
			mv.addObject("revo", revo);
			return mv;
		}
		return new ModelAndView("board/error");
	}

}
