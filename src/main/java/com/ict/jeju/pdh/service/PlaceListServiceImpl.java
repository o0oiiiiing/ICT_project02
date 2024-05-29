package com.ict.jeju.pdh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.pdh.dao.PlaceListDAO;
import com.ict.jeju.pdh.dao.PlaceListVO;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.pdh.dao.CommentVO;
import com.ict.jeju.pdh.dao.ImagesVO;
import com.ict.jeju.pdh.dao.PagingVO;
import com.ict.jeju.pdh.dao.QaVO;
import com.ict.jeju.pdh.dao.DeclarationVO;
import com.ict.jeju.pdh.dao.ReviewVO;
import com.ict.jeju.pdh.dao.WishVO;

@Service
public class PlaceListServiceImpl implements PlaceListService {

	@Autowired
	private PlaceListDAO placeListDAO;

	// 조회수 순으로 contentsid 20개 가져오기
	@Override
	public List<PlaceListVO> popularList() {
		return placeListDAO.popularList();
	}
	
	// 전체 리스트 가져오기
	@Override
	public List<PlaceListVO> allList() {
		return placeListDAO.allList();
	}

	// 장소 상세보기
	@Override
	public PlaceListVO placeDetail(String contentsid) {
		return placeListDAO.placeDetail(contentsid);
	}

	// 게시물의 좋아요 수
	@Override
	public int likeNum(String contentsid) {
		return placeListDAO.likeNum(contentsid);
	}
	
	// Q&A 수
	@Override
	public int qaNum(String contentsid) {
		return placeListDAO.qaNum(contentsid);
	}

	// 게시물의 리뷰 수
	@Override
	public int reviewNum(String contentsid) {
		return placeListDAO.reviewNum(contentsid);
	}
	
	// 조회수 올리기
	@Override
	public int hitUpdate(String contentsid) {
		return placeListDAO.hitUpdate(contentsid);
	}
	
	// 검색하기
	@Override
	public List<PlaceListVO> searchList(String keyword) {
		return placeListDAO.searchList(keyword);
	}
	
	// Q&A 작성하기
	@Override
	public int qaWrite(QaVO qaVO) {
		return placeListDAO.qaWrite(qaVO);
	}
	
	// 장소의 Q&A 가져오기
	@Override
	public List<QaVO> qaList(PagingVO qaPagingVO) {
		return placeListDAO.qaList(qaPagingVO);
	}
	
	// 리뷰 작성하기
	@Override
	public int reviewWrite(ReviewVO reviewVO) {
		return placeListDAO.reviewWrite(reviewVO);
	}
	
	// 리뷰 이미지 삽입
	@Override
	public int imageInsert(ImagesVO imagesVO) {
		return placeListDAO.imageInsert(imagesVO);
	}
	
	// 장소의 리뷰 가져오기
	@Override
	public List<ReviewVO> reviewList(PagingVO rPagingVO) {
		return placeListDAO.reviewList(rPagingVO);
	}
	
	// 신고하기
	@Override
	public int reportWrite(DeclarationVO reportVO) {
		return placeListDAO.reportWrite(reportVO);
	}
	
	// 평균 별점 가져오기
	@Override
	public double reviewAvg(String contentsid) {
		return placeListDAO.reviewAvg(contentsid);
	}
	
	// 위시리스트 추가
	@Override
	public int addWish(WishVO wishVO) {
		return placeListDAO.addWish(wishVO);
	}
	
	// 위시리스트 제거
	@Override
	public int removeWish(WishVO wishVO) {
		return placeListDAO.removeWish(wishVO);
	}
	
	// 좋아요 여부 확인
	@Override
	public WishVO confirmLike(WishVO wishVO) {
		return placeListDAO.confirmLike(wishVO);
	}
	
	// 자기 자신의 리뷰 삭제하기
	@Override
	public int removeReview(String re_idx) {
		return placeListDAO.removeReview(re_idx);
	}
	
	// Q&A 답변 작성하기
	@Override
	public int commentWrite(CommentVO commentVO) {
		return placeListDAO.commentWrite(commentVO);
	}
	
	// 리뷰 작성한 사람의 정보를 가져오기
	@Override
	public UserVO reviewWriter(String u_idx) {
		return placeListDAO.reviewWriter(u_idx);
	}	

}
