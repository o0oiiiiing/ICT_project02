package com.ict.jeju.chm.dao;

import java.util.List;
import java.util.Locale.Category;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;

	public List<CategoryVO> getCategoryList(String vi_value) {
		try {
			System.out.println(vi_value+"dao");
			return sqlsessionTemplate.selectList("category.selectList",vi_value);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("categoryDAO에서 에러 발생");
		}
		return null;
	}
	
}
