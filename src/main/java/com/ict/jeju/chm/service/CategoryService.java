package com.ict.jeju.chm.service;

import java.util.List;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.chm.dao.Paging3;

public interface CategoryService {

	List<CategoryVO> getCategoryList(String vi_value);
	
	public int getTotalCount(String vi_value);

	List<CategoryVO> getBoardList(int offset, int numPerPage, String vi_value);

	

}
