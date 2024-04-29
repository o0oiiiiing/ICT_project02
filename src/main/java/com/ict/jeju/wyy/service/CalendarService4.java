package com.ict.jeju.wyy.service;

import java.util.List;

import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.VisitJejuVO4;

public interface CalendarService4 {
	
	// 캘린더 리스트 전체 보기
	public List<CalendarVO4> calList();
	
	// 삭제
	public int calDelete(String c_idx);
	
	// 나의여행 추가한 리스트
	public List<CalendarVO4> myTripPlan(String u_idx);
	
	//나의여행 좋아요 리스트
	public List<LikeVO> myTripLike(String u_idx);
	
	// 지도 전체보기
	public List<VisitJejuVO4> myTripMap();
	
	// 캘린더 일정 추가
	public int saveCal(CalendarVO4 cvo4);

	
}
