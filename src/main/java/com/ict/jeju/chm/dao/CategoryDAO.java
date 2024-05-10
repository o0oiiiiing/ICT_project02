package com.ict.jeju.chm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

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
			System.out.println(1);
			return sqlsessionTemplate.selectList("category.selectList",vi_value);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("categoryDAO에서 에러 발생");
		}
		return null;
	}

	public int getTotalCount(String vi_value) {
		try {
			return sqlsessionTemplate.selectOne("category.count" , vi_value);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	// , String option_select
	public List<CategoryVO> getBoardList(int offset, int limit, String vi_value) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("vi_value", vi_value);
			/* map.put("option_select", option_select); */
			System.out.println(offset);
			System.out.println(limit);
		return sqlsessionTemplate.selectList("category.board_list" , map);
		}catch (Exception e) {
		System.out.println(e);
	}
		return null;
	}
	
}
