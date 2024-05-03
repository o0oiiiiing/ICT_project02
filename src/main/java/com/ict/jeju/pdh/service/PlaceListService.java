package com.ict.jeju.pdh.service;

import java.util.List;

import com.ict.jeju.pdh.dao.PlaceListVO;

public interface PlaceListService {
	// 조회수 순으로 장소 20개 가져오기
	public List<PlaceListVO> popularList();
	
	// 장소 상세보기
	public PlaceListVO placeDetail(String contentsid);
	
	// 게시물의 좋아요 수
	public int likeNum(String contentsid);

	// 게시물의 리뷰 수
	public int reviewNum(String contentsid);
	
	// 조회수 올리기
	public int hitUpdate(String contentsid);
	
	// 검색하기
	public List<PlaceListVO> searchList(String keyword);
	
	
}
