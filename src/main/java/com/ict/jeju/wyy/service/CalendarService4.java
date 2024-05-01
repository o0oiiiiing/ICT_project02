package com.ict.jeju.wyy.service;

import java.util.List;

import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.UserVO4;
import com.ict.jeju.wyy.dao.VisitJejuVO4;

public interface CalendarService4 {
	
	// 첫화면 임시 세션
	UserVO4 wyyHome(String u_idx);
	
	// 캘린더 리스트 전체 보기
	public List<CalendarVO4> calList();
	
	// 삭제
	public int calDelete(String c_idx);
	
	//나의여행 좋아요 리스트
	public List<LikeVO> myTripLike(int offset, int limit,String u_idx);
	
	// 나의 여행 유저 리스트
	public List<UserVO4> myTripUser(String u_idx);
	
	// 캘린더 지도 전체보기
	public List<VisitJejuVO4> myTripMap();
	
	// 좋아요 지도 전체보기
	public List<VisitJejuVO4> myTripMapLike();
	
	// 캘린더 일정 추가
	public int saveCal(CalendarVO4 cvo4);
	
	// 페이징 처리 - 전체 게시물의 수
		public int getTotalCount();

	
}
