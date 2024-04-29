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
	
	
	
}