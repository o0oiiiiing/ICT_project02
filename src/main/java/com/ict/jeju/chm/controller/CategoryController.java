package com.ict.jeju.chm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.chm.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	// header에서 카테고리를 클릭했을때 DB에서 vi_value 값으로 해당하는 결과 뽑아오기
	@GetMapping("category_page.do")
	public ModelAndView getCategory(@ModelAttribute("vi_value")String vi_value, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("chm-view/category");
			// vi_value 정상적으로 오나 확인하기
			System.out.println(vi_value);
			List<CategoryVO> cate_list = categoryService.getCategoryList(vi_value);
			mv.addObject("cate_list" , cate_list);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("vi_value 카테고리 컨트롤러에서 에러발생.");
		}
		return null;
		
		
	}
}
