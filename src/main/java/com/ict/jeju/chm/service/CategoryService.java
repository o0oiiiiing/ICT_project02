package com.ict.jeju.chm.service;

import java.util.List;

import com.ict.jeju.chm.dao.CategoryVO;

public interface CategoryService {

	List<CategoryVO> getCategoryList(String vi_value);
	
}
