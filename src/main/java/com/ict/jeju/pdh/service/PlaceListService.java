package com.ict.jeju.pdh.service;

import java.util.List;

import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.pdh.dao.ImagesVO;
import com.ict.jeju.pdh.dao.PagingVO;
import com.ict.jeju.pdh.dao.QaVO;
import com.ict.jeju.pdh.dao.ReviewVO;

public interface PlaceListService {
	// 조회수 순으로 장소 20개 가져오기
	public List<PlaceListVO> popularList();
	
	// 전체 장소 가져오기
	public List<PlaceListVO> allList();
	
	// 장소 상세보기
	public PlaceListVO placeDetail(String contentsid);
	
	// 게시물의 좋아요 수
	public int likeNum(String contentsid);

	// Q&A 수
	public int qaNum(String contentsid);
	
	// 게시물의 리뷰 수
	public int reviewNum(String contentsid);
	
	// 조회수 올리기
	public int hitUpdate(String contentsid);
	
	// 검색하기
	public List<PlaceListVO> searchList(String keyword);
	
	// Q&A 작성하기
	public int qaWrite(QaVO qaVO);
	
	// 장소의 Q&A 가져오기
	public List<QaVO> qaList(PagingVO qaPagingVO);
	
	// 리뷰 작성하기
	public int reviewWrite(ReviewVO reviewVO);
	
	// 리뷰 이미지 삽입하기
	public int imageInsert(ImagesVO imagesVO);
	
	// 장소의 리뷰 가져오기
	public List<ReviewVO> reviewList(PagingVO rPagingVO);
}
