package com.ict.jeju.wyy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.wyy.dao.MytripDAO;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.wyy.dao.CalendarVO;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.VisitJejuVO;


@Service
public class MytripServiceImpl implements MytripService{
	
	@Autowired
	private MytripDAO mdao;
	
	// 캘린더 전체 보기
	@Override
	public List<CalendarVO> calList(String u_idx) {
		return mdao.calList(u_idx);
	}
	// 캘린더 일정 삭제
	@Override
	public int calDelete(String c_idx) {
		return mdao.calDelete(c_idx);
	}
	
	// 나의 여행 좋아요 리스트
	@Override
	public List<LikeVO> myTripLike(int offset, int limit,String u_idx) {
		return mdao.myTripLike(offset, limit, u_idx);
	}
	
	// 나의 여행 유저 리스트
	@Override
	public List<UserVO> myTripUser(String u_idx) {
		return mdao.myTripUser(u_idx);
	}

	// 지도 보기
	@Override
	public List<VisitJejuVO> myTripMap(String u_idx) {
		return mdao.myTripMap(u_idx);
	}
	
	// 좋아요 지도보기
	@Override
	public List<VisitJejuVO> myTripMapLike(String u_idx) {
		// TODO Auto-generated method stub
		return mdao.myTripMapLike(u_idx);
	}
	
	// 캘린더 일정 추가
	@Override
	public int saveCal(CalendarVO cvo4, String u_idx) {
		return mdao.saveCal(cvo4, u_idx);
	}
	
	// 페이징 기법
	@Override
	public int getTotalCount(String u_idx) {
		return mdao.getTotalCount(u_idx);
	}
	
	// 좋아요 삭제
	@Override
	public int removeHeart(String like_idx) {
		return mdao.removeHeart(like_idx);
	}
	
	// 관리자 일정 추가
	@Override
	public int adminInsert(VisitJejuVO vo4) {
		return mdao.adminInsert(vo4);
	}
	
	// 관리자 일정 추가 중복체크
	@Override
	public String idCheck(String contentsid) {
		return mdao.idCheck(contentsid);
	}


}