package com.ict.jeju.wyy.service;

import java.util.List;

import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;

public interface CalendarService4 {
	
	// 전체 보기
	public List<CalendarVO4> calList();
	
	// 삭제
	public int calDelete(String c_idx);
	
	// 저장
//	public int calSave(String u_idx, String contentsid);
	
	// 나의여행 리스트
	public List<CalendarVO4> myTripPlan(String u_idx);
	
	//나의여행 좋아요 리스트
	public List<LikeVO> myTripLike(String u_idx);

	
}
