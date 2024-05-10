package com.ict.jeju.chm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.chm.dao.Paging3;
import com.ict.jeju.chm.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private Paging3 paging3;
	
	
	// header에서 카테고리를 클릭했을때 DB에서 vi_value 값으로 해당하는 결과 뽑아오기
	// ,@ModelAttribute("option_select")String option_select
	@GetMapping("category_page.do")
	public ModelAndView getCategory(@ModelAttribute("vi_value")String vi_value, HttpSession session , HttpServletRequest request ) {
		
			ModelAndView mv = new ModelAndView("chm-view/category");
			// vi_value 정상적으로 오나 확인하기
//			List<CategoryVO> cate_list = categoryService.getCategoryList(vi_value);
//			mv.addObject("cate_list" , cate_list);
//			return mv;

		// 페이징 기법
        // 전체 게시물의 수
        int count = categoryService.getTotalCount(vi_value);
        System.out.println(count);
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
        System.out.println(paging3.getTotalPage());    
        System.out.println(paging3.getNumPerPage());
        System.out.println(paging3.getTotalRecord());
        // 현재 페이지 구함
        String cPage = request.getParameter("cPage");
        System.out.println(cPage);
        if (cPage == null) {
            paging3.setNowPage(1);
        } else {
            paging3.setNowPage(Integer.parseInt(cPage));
        }

        // begin, end 구하기 (Oracle)
        // offset 구하기
        // offset = limit * (현재페이지-1);
        // db에서 시작되는 위치라고 보면 편하다.
        paging3.setOffset(paging3.getNumPerPage() * (paging3.getNowPage() - 1));

        // 시작 블록 // 끝블록
        //
        paging3.setBeginBlock(
                (int) ((paging3.getNowPage() - 1) / paging3.getPagePerBlock()) * paging3.getPagePerBlock() + 1);
        paging3.setEndBlock(paging3.getBeginBlock() + paging3.getPagePerBlock() - 1);

        if (paging3.getEndBlock() > paging3.getTotalPage()) {
            paging3.setEndBlock(paging3.getTotalPage());
        }
        
        List<CategoryVO> cate_list = categoryService.getCategoryList(vi_value);
        
        // ,option_select
        List<CategoryVO> category_list = categoryService.getBoardList(paging3.getOffset(), paging3.getNumPerPage(),vi_value );
        
        if (category_list != null) {
            mv.addObject("category_list", category_list);
            mv.addObject("paging3", paging3);
            mv.addObject("cate_list" , cate_list);
            return mv;
        }
		return null;
	}
	
}
