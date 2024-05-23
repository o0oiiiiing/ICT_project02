package com.ict.jeju.chm.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.chm.dao.Paging3;
import com.ict.jeju.chm.service.CategoryService;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private Paging3 paging3;
	
	
	// header에서 카테고리를 클릭했을때 DB에서 vi_value 값으로 해당하는 결과 뽑아오기
	// ,@ModelAttribute("option_select")String 
	@RequestMapping("category_page.do")
	public ModelAndView getCategory(@ModelAttribute("vi_value")String vi_value, HttpSession session 
			, HttpServletRequest request ,@ModelAttribute("option")String option) {
		
			ModelAndView mv = new ModelAndView("chm-view/category");
			// vi_value 정상적으로 오나 확인하기

		// 페이징 기법
        // 전체 게시물의 수
        int count = categoryService.getTotalCount(vi_value);
        paging3.setTotalRecord(count);

        // 전체 페이지의 수
        if (paging3.getTotalRecord() <= paging3.getNumPerPage()) {
            paging3.setTotalPage(1);
        } else {
            paging3.setTotalPage(paging3.getTotalRecord() / paging3.getNumPerPage());
            if (paging3.getTotalRecord() % paging3.getNumPerPage() != 0) {
                paging3.setTotalPage(paging3.getTotalPage() + 1);
            }
        }
        // 현재 페이지 구함
        String cPage = request.getParameter("cPage");
        if (cPage == null) {
            paging3.setNowPage(1);
        } else {
            paging3.setNowPage(Integer.parseInt(cPage));
        }

        paging3.setOffset(paging3.getNumPerPage() * (paging3.getNowPage() - 1));

        // 시작 블록 // 끝블록
        paging3.setBeginBlock(
                (int) ((paging3.getNowPage() - 1) / paging3.getPagePerBlock()) * paging3.getPagePerBlock() + 1);
        paging3.setEndBlock(paging3.getBeginBlock() + paging3.getPagePerBlock() - 1);

        if (paging3.getEndBlock() > paging3.getTotalPage()) {
            paging3.setEndBlock(paging3.getTotalPage());
        }
        
        List<CategoryVO> cate_list = categoryService.getCategoryList(vi_value);
        
        // ,option_select
        List<CategoryVO> category_list = categoryService.getBoardList(paging3.getOffset(), paging3.getNumPerPage(),vi_value,option);
         
        if (category_list != null) {
            mv.addObject("category_list", category_list);
            mv.addObject("paging3", paging3);
            mv.addObject("cate_list" , cate_list);
            return mv;
        }
		return null;
	}
	
	@RequestMapping("search")
	public ModelAndView search(HttpSession session 
			, HttpServletRequest request ,@ModelAttribute("keyword")String keyword,@ModelAttribute("option")String option) {
		ModelAndView mv = new ModelAndView("chm-view/searchlist");
		int count = categoryService.getTotalCount2(keyword);
        paging3.setTotalRecord(count);

        // 전체 페이지의 수
        if (paging3.getTotalRecord() <= paging3.getNumPerPage()) {
            paging3.setTotalPage(1);
        } else {
            paging3.setTotalPage(paging3.getTotalRecord() / paging3.getNumPerPage());
            if (paging3.getTotalRecord() % paging3.getNumPerPage() != 0) {
                paging3.setTotalPage(paging3.getTotalPage() + 1);
            }
        }
        
		// 현재 페이지 구함
        String cPage = request.getParameter("cPage");
        if (cPage == null) {
            paging3.setNowPage(1);
        } else {
            paging3.setNowPage(Integer.parseInt(cPage));
        }
        
        paging3.setOffset(paging3.getNumPerPage() * (paging3.getNowPage() - 1));

        paging3.setBeginBlock(
                (int) ((paging3.getNowPage() - 1) / paging3.getPagePerBlock()) * paging3.getPagePerBlock() + 1);
        paging3.setEndBlock(paging3.getBeginBlock() + paging3.getPagePerBlock() - 1);

        if (paging3.getEndBlock() > paging3.getTotalPage()) {
            paging3.setEndBlock(paging3.getTotalPage());
        }
        
        // ,option_select
        List<CategoryVO> searchList = categoryService.searchList(paging3.getOffset(), paging3.getNumPerPage(),keyword, option);
        if (searchList != null) {
            mv.addObject("paging3", paging3);
            mv.addObject("searchList", searchList);
            return mv;
        }
        
		return null;
	}
	
}
