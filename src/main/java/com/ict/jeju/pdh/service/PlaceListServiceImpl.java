package com.ict.jeju.pdh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.pdh.dao.PlaceListDAO;
import com.ict.jeju.pdh.dao.PlaceListVO;

@Service
public class PlaceListServiceImpl implements PlaceListService {

	@Autowired
	private PlaceListDAO placeListDAO;

	// 조회수 순으로 contentsid 20개 가져오기
	@Override
	public List<PlaceListVO> popularList() {
		return placeListDAO.popularList();
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

}
