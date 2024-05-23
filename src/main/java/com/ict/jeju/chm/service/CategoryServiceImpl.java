package com.ict.jeju.chm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.chm.dao.CategoryDAO;
import com.ict.jeju.chm.dao.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	public List<CategoryVO> getCategoryList(String vi_value) {
		return categoryDAO.getCategoryList(vi_value);
	}

	@Override
	public int getTotalCount(String vi_value) {
		return categoryDAO.getTotalCount(vi_value);
	}

	@Override
	// , String option_select
	public List<CategoryVO> getBoardList(int offset,  int limit, String vi_value , String option) {
		// ,option_select
		return categoryDAO.getBoardList(offset, limit,vi_value ,option);

	}

	@Override
	public int getTotalCount2(String keyword) {
		return categoryDAO.getTotalCount2(keyword);
	}
	
	@Override
	public List<CategoryVO> searchList(int offset, int limit , String keyword , String option) {
		return categoryDAO.searchList(offset , limit, keyword , option);
		
	}
}
