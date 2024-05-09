package com.ict.jeju.ygh.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.common.Paging;
import com.ict.jeju.common.Paging2;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
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

	// 관리자 게시판
	@RequestMapping("admin_list.do")
	public ModelAndView adminList(HttpServletRequest request) {
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
		List<BoardVO> board_list = jejuService5.boardList(paging.getOffset(), paging.getNumPerPage2());
		List<ReportVO> report_list = jejuService5.reportList(paging2.getOffset(), paging2.getNumPerPage2());
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
	@GetMapping("admin_board_detail.do")
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
	@GetMapping("report_detail.do")
	public ModelAndView reportDetail(@ModelAttribute("cPage") String cPage, String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/report_detail");
		ReportVO revo = jejuService5.reportDetail(report_idx);

		if (revo != null) {
			mv.addObject("revo", revo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	@GetMapping("admin_list_go.do")
	public ModelAndView admin_list_go() {
		return new ModelAndView("ygh-view/admin_list");
	}

	// Q&A 답글 작성
	@PostMapping("board_ans_write_ok.do")
	public ModelAndView commentInsert(CommentVO comvo, @ModelAttribute("bo_idx") String bo_idx) {
		ModelAndView mv = new ModelAndView("redirect:board_detail.do");
		int result = jejuService5.commentInsert(comvo);
		return mv;
	}
	

	// 사용자 Q&A 게시판
	@RequestMapping("board_list.do")
	public ModelAndView boardlist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ygh-view/board_list");

		// 페이징
		int count = jejuService5.getTotalCount();
		paging.setTotalRecord(count);

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
		List<BoardVO> board_list = jejuService5.boardList(paging.getOffset(), paging.getNumPerPage());
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
	public ModelAndView boardWrtieOk(BoardVO bovo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:board_list.do");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile();
			if (file.isEmpty()) {
				bovo.setF_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+file.getOriginalFilename();
				bovo.setF_name(f_name);
				
				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}
			
			// 비밀번호 암호화
			bovo.setBo_pwd(passwordEncoder.encode(bovo.getBo_pwd()));
			
			int result = jejuService5.boardWrtieOk(bovo);
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
	public ModelAndView boardUpdate(@ModelAttribute("cPage")String cPage, @ModelAttribute("bo_idx")String bo_idx) {
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
	public ModelAndView boardUpdateOk(@ModelAttribute("cPage")String cPage, @ModelAttribute("bo_idx")String bo_idx, BoardVO bovo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		BoardVO bovo2 = jejuService5.boardDetail(bovo.getBo_idx());
		String dpwd = bovo2.getBo_pwd();
		/*
		if (! passwordEncoder.matches(bovo.getBo_pwd(), dpwd)) {
			mv.setViewName("ygh-view/board_update");
			mv.addObject("pwdchk", "fail");
			mv.addObject("bovo", bovo);
			return mv;
		} else {
			try {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				MultipartFile file = bovo.getFile();
				if (file.isEmpty()) {
					bovo.setF_name(bovo.getOld_f_name());
				} else {
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString()+"_"+file.getOriginalFilename();
					bovo.setF_name(f_name);
					
					byte[] in = file.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
				}
				*/
				int result = jejuService5.boardUpdate(bovo);
				if (result > 0) {
					mv.setViewName("redirect:board_detail.do");
					return mv;
				}
				/*
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		*/
		return new ModelAndView("ygh-view/error");
	}
	
	
	
	
	
	

}
