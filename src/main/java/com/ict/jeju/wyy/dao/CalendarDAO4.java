package com.ict.jeju.wyy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
/*	
	//저장
	public int calSave(String u_idx, String contentsid) {
		try {
			Map<String, String> map = new HashMap<>();
			map.put("u_idx", u_idx);
			map.put("contentsid", contentsid);
			return sqlSessionTemplate.insert("calendar.insert", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
*/	
	// 리스트
	public List<CalendarVO4> myTripPlan(String u_idx) {
		try {
			return sqlSessionTemplate.selectList("calendar.tripList", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 나의여행 좋아요 리스트
	public List<LikeVO> myTripLike(String u_idx) {
		try {
			return sqlSessionTemplate.selectList("calendar.likeList",u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	
}