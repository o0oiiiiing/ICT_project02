package com.ict.jeju.pdh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.jeju.lsh.dao.UserVO;

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
	public List<QaVO> qaList(PagingVO qaPagingVO) {
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
	public int imageInsert(ImagesVO imagesVO) {
		try {
			return sqlSessionTemplate.insert("place.imageInsert", imagesVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 장소의 리뷰 가져오기
	public List<ReviewVO> reviewList(PagingVO rPagingVO) {
		try {
			return sqlSessionTemplate.selectList("place.reviewList", rPagingVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 신고하기
	public int reportWrite(DeclarationVO reportVO) {
		try {
			return sqlSessionTemplate.insert("place.reportWrite", reportVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 평균 별점 가져오기
	public double reviewAvg(String contentsid) {
		try {
			return sqlSessionTemplate.selectOne("place.reviewAvg", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 신고 당한 사람 신고 수 늘리기
	public int reportSu(DeclarationVO reportVO) {
		try {
			return sqlSessionTemplate.update("place.reportSu", reportVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 위시리스트 추가
	public int addWish(WishVO wishVO) {
		try {
			return sqlSessionTemplate.insert("place.addWish", wishVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 위시리스트 삭제
	public int removeWish(WishVO wishVO) {
		try {
			return sqlSessionTemplate.delete("place.removeWish", wishVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 좋아요 여부 확인
	public WishVO confirmLike(WishVO wishVO) {
		try {
			return sqlSessionTemplate.selectOne("place.confirmLike", wishVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 자기 자신의 리뷰 삭제하기
	public int removeReview(String re_idx) {
		try {
			return sqlSessionTemplate.delete("place.removeReview", re_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// Q&A 답변 작성하기
	public int commentWrite(CommentVO commentVO) {
		try {
			return sqlSessionTemplate.insert("place.commentWrite", commentVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	
	public UserVO reviewWriter(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("place.reviewWriter", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
