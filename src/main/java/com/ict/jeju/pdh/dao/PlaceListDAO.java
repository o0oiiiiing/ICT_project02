package com.ict.jeju.pdh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceListDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 조회수 순으로 contentsid 20개 가져오기
	public List<PlaceListVO> popularList() {
		try {
			return sqlSessionTemplate.selectList("place.popularList");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 전체 장소 보기
	public List<PlaceListVO> allList() {
		try {
			return sqlSessionTemplate.selectList("place.allList");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 장소 상세보기
	public PlaceListVO placeDetail(String contentsid) {
		try {
			return sqlSessionTemplate.selectOne("place.placeDetail", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int likeNum(String contentsid) {
		try {
			return sqlSessionTemplate.selectOne("place.likeNum", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int qaNum(String contentsid) {
		try {
			return sqlSessionTemplate.selectOne("place.qaNum", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int reviewNum(String contentsid) {
		try {
			return sqlSessionTemplate.selectOne("place.reviewNum", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 조회수 올리기
	public int hitUpdate(String contentsid) {
		try {
			return sqlSessionTemplate.update("place.hitUpdate", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 검색하기
	public List<PlaceListVO> searchList(String keyword) {
		try {
			return sqlSessionTemplate.selectList("place.searchList", keyword);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// Q&A 작성하기
	public int qaWrite(QaVO qaVO) {
		try {
			return sqlSessionTemplate.insert("place.qaWrite", qaVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 장소의 Q&A 가져오기
	public List<QaVO> qaList(QaPagingVO qaPagingVO) {
		try {
			return sqlSessionTemplate.selectList("place.qaList", qaPagingVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 리뷰 작성하기
	public int reviewWrite(ReviewVO reviewVO) {
		try {
			return sqlSessionTemplate.insert("place.reviewWrite", reviewVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 리뷰 이미지 삽입하기
	public int imageInsert(ReviewVO reviewVO) {
		try {
			return sqlSessionTemplate.insert("place.imageInsert", reviewVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}
