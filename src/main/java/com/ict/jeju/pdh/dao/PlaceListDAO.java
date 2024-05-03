package com.ict.jeju.pdh.dao;

import java.util.List;

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
}
