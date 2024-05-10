package com.ict.jeju.wyy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.wyy.dao.CalendarDAO4;
import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.UserVO4;
import com.ict.jeju.wyy.dao.VisitJejuVO4;


@Service
public class CalendarService4Impl implements CalendarService4{
	
	@Autowired
	private CalendarDAO4 cdao4;
	
	// 전체 보기
	@Override
	public List<CalendarVO4> calList(String u_idx) {
		return cdao4.calList(u_idx);
	}
	// 삭제
	@Override
	public int calDelete(String c_idx) {
		return cdao4.calDelete(c_idx);
	}
	
	// 나의 여행 좋아요 리스트
	@Override
	public List<LikeVO> myTripLike(int offset, int limit,String u_idx) {
		return cdao4.myTripLike(offset, limit, u_idx);
	}
	
	// 나의 여행 유저 리스트
	@Override
	public List<UserVO4> myTripUser(String u_idx) {
		return cdao4.myTripUser(u_idx);
	}

	// 지도 보기
	@Override
	public List<VisitJejuVO4> myTripMap(String u_idx) {
		return cdao4.myTripMap(u_idx);
	}
	
	// 좋아요 지도보기
	@Override
	public List<VisitJejuVO4> myTripMapLike(String u_idx) {
		// TODO Auto-generated method stub
		return cdao4.myTripMapLike(u_idx);
	}
	
	// 캘린더 일정 추가
	@Override
	public int saveCal(CalendarVO4 cvo4, String u_idx) {
		return cdao4.saveCal(cvo4, u_idx);
	}
	
	// 첫화면 임시 세션
	@Override
	public UserVO4 wyyHome(String u_idx) {
		
		return cdao4.wyyHome(u_idx);
	}
	
	// 페이징 기법
	@Override
	public int getTotalCount(String u_idx) {
		return cdao4.getTotalCount(u_idx);
	}
	
	// 좋아요 삭제
	@Override
	public int removeHeart(String like_idx) {
		return cdao4.removeHeart(like_idx);
	}
	
	// 관리자 일정 추가
	@Override
	public int adminInsert(VisitJejuVO4 vo4) {
		return cdao4.adminInsert(vo4);
	}


}