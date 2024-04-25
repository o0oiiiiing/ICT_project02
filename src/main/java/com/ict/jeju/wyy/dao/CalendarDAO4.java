package com.ict.jeju.wyy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO4 {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//전체 보기
	public List<CalendarVO4> calList() {
		try {
			return sqlSessionTemplate.selectList("calendar.cal_list");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	// 삭제
	public int calDelete(String c_idx) {
		try {
			return sqlSessionTemplate.delete("calendar.delete",c_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	
}