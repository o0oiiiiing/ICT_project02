package com.ict.jeju.ygh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.common.Paging;
import com.ict.jeju.common.Paging2;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.ReportVO;
import com.ict.jeju.ygh.service.JejuService5;

@Controller
public class JejuController5 {
	@Autowired
	private JejuService5 jejuService5;
	@Autowired
	private Paging paging;
	@Autowired
	private Paging2 paging2;

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

	// 관리자페이지
	@RequestMapping("admin_list.do")
	public ModelAndView boardList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ygh-view/admin_list");
		
		// 페이징 미답변 Q&A 
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

		// 페이징 신고
		int count2 = jejuService5.getTotalCount2();
		paging2.setTotalRecord(count2);

		if (paging2.getTotalRecord() <= paging2.getNumPerPage()) {
			paging2.setTotalPage(1);
		} else {
			paging2.setTotalPage(paging2.getTotalRecord() / paging2.getNumPerPage());
			if (paging2.getTotalRecord() % paging2.getNumPerPage() != 0) {
				paging2.setTotalPage(paging2.getTotalPage() + 1);
			}
		}

		String cPage2 = request.getParameter("cPage2");
		if (cPage2 == null) {
			paging2.setNowPage2(1);
		} else {
			paging2.setNowPage2(Integer.parseInt(cPage2));
		}

		paging2.setOffset(paging2.getNumPerPage() * (paging2.getNowPage2() - 1));

		paging2.setBeginBlock(
				(int) ((paging2.getNowPage2() - 1) / paging2.getPagePerBlock()) * paging2.getPagePerBlock() + 1);
		paging2.setEndBlock(paging2.getBeginBlock() + paging2.getPagePerBlock() - 1);

		if (paging2.getEndBlock() > paging2.getTotalPage()) {
			paging2.setEndBlock(paging2.getTotalPage());
		}

		List<BoardVO> board_list = jejuService5.getBoardList(paging.getOffset(), paging.getNumPerPage());
		List<ReportVO> report_list = jejuService5.getReportList(paging2.getOffset(), paging2.getNumPerPage());
		if (board_list != null && report_list != null) {
			mv.addObject("board_list", board_list);
			mv.addObject("paging", paging);
			mv.addObject("report_list", report_list);
			mv.addObject("paging2", paging2);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}


	// 관리자페이지 Q&A 상세보기
	@GetMapping("board_detail.do")
	public ModelAndView boardDetail(@ModelAttribute("cPage") String cPage, String bo_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/board_detail");
		BoardVO bovo = jejuService5.getBoardDetail(bo_idx);

		if (bovo != null) {
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("ygh-view/error");
	}

	// 관리자페이지 신고 상세보기
	@GetMapping("report_detail.do")
	public ModelAndView reportDetail(@ModelAttribute("cPage") String cPage, String report_idx) {
		ModelAndView mv = new ModelAndView("ygh-view/report_detail");
		ReportVO revo = jejuService5.getReportDetail(report_idx);

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
	
	@PostMapping("board_ans_write.do")
	public ModelAndView getBoardAnsWrite(@ModelAttribute("cPage")String cPage, @ModelAttribute("bo_idx")String bo_idx) {
		return new ModelAndView("ygh-view/board_ans");
	}
	
	
	@PostMapping("board_ans_write_ok.do")
	public ModelAndView getBoardAnsWriteOk(@ModelAttribute("cPage")String cPage, BoardVO bovo, HttpServletRequest request) {
		try {
			System.out.println("cPage-3 : " +cPage.length());
			// 답글에서만 처리할 일
			// 원글의 groups, step, lev 를 가져와라
			BoardVO bovo2 = jejuService5.getBoardDetail(bovo.getBo_idx());
			
			
			int groups = Integer.parseInt(bovo2.getGroups());
			int step = Integer.parseInt(bovo2.getStep());
			int lev = Integer.parseInt(bovo2.getLev());
			
			// step, lev 를 하나씩 올리자
			step++;
			lev++;
			
			// DB에서 lev를 업데이트 하자
			// ** groups이 같은 글을 찾아서 기존 데이터의 lev이 같거나 크면 기존 데이터의 lev 증가
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("groups", groups);
			map.put("lev", lev);
		
			
			int result = jejuService5.getLevUpdate(map);
			
			bovo.setGroups(String.valueOf(groups));
			bovo.setStep(String.valueOf(step));
			bovo.setLev(String.valueOf(lev));
			
			
			ModelAndView mv = new ModelAndView("redirect:admin_list.do");
//			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//			MultipartFile file = bovo.getFile();
//			if (file.isEmpty()) {
//				bovo.setF_name("");
//			} else {
//				UUID uuid = UUID.randomUUID();
//				String f_name = uuid.toString()+"_"+file.getOriginalFilename();
//				bovo.setF_name(f_name);
//				
//				byte[] in = file.getBytes();
//				File out = new File(path, f_name);
//				FileCopyUtils.copy(in, out);
//			}
//			bovo.setPwd(passwordEncoder.encode(bovo.getPwd()));
			
			int result2 = jejuService5.getAnsInsert(bovo);
			if (result2 > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("ygh-view/error");
	}

}
