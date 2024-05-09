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
	public List<CategoryVO> getBoardList(int offset,  int limit, String vi_value) {
		return categoryDAO.getBoardList(offset, limit,vi_value);

	}
	
}
