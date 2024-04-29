package com.ict.jeju.wyy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.wyy.dao.CalendarDAO4;
import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.VisitJejuVO4;


@Service
public class CalendarService4Impl implements CalendarService4{
	
	@Autowired
	private CalendarDAO4 cdao4;
	
	// 전체 보기
	@Override
	public List<CalendarVO4> calList() {
		return cdao4.calList();
	}
	// 삭제
	@Override
	public int calDelete(String c_idx) {
		return cdao4.calDelete(c_idx);
	}

	//나의여행 리스트
	@Override
	public List<CalendarVO4> myTripPlan(String u_idx) {
		return cdao4.myTripPlan(u_idx);
	}
	
	// 나의 여행 좋아요 리스트
	@Override
	public List<LikeVO> myTripLike(String u_idx) {
		return cdao4.myTripLike(u_idx);
	}
	
	// 지도 보기
	@Override
	public List<VisitJejuVO4> myTripMap() {
		return cdao4.myTripMap();
	}
	
	// 캘린더 일정 추가
	@Override
	public int saveCal(CalendarVO4 cvo4) {
		return cdao4.saveCal(cvo4);
	}


}
