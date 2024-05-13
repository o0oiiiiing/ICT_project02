package com.ict.jeju.wyy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MytripDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 캘린더 전체 보기
	public List<CalendarVO> calList(String u_idx) {
		try {
			return sqlSessionTemplate.selectList("mytrip.cal_list", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 캘린더 일정 삭제
	public int calDelete(String c_idx) {
		try {
			return sqlSessionTemplate.delete("mytrip.delete", c_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	// 나의여행 좋아요 리스트
	public List<LikeVO> myTripLike(int offset, int limit, String u_idx) {
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("u_idx", u_idx);
			return sqlSessionTemplate.selectList("mytrip.likeList", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 페이징 기법
	public int getTotalCount(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("mytrip.count", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 나의 여행 유저 리스트
	public List<UserVO4> myTripUser(String u_idx) {
		try {
			return sqlSessionTemplate.selectList("mytrip.userList", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 지도 전체보기
	public List<VisitJejuVO> myTripMap(String u_idx) {
		try {
			return sqlSessionTemplate.selectList("mytrip.map_list", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 좋아요지도 전체보기
	public List<VisitJejuVO> myTripMapLike(String u_idx) {
		try {
			return sqlSessionTemplate.selectList("mytrip.map_list_like", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 캘린더 일정 추가
	public int saveCal(CalendarVO cvo4, String u_idx) {
	    try {
	        Map<String, Object> map = new HashMap<>();
	        map.put("u_idx", u_idx);
	        map.put("contentsid", cvo4.getContentsid());
	        map.put("c_title", cvo4.getC_title());
	        map.put("c_start", cvo4.getC_start());
	        map.put("c_end", cvo4.getC_end());
	        return sqlSessionTemplate.insert("mytrip.save_cal", map);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return -1;
	}
	
	// 좋아요 삭제
	public int removeHeart(String like_idx) {
		try {
			sqlSessionTemplate.delete("mytrip.removeHeart", like_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 관리자 일정 추가
	public int adminInsert(VisitJejuVO vo4) {
		try {
			sqlSessionTemplate.insert("mytrip.adminInsert", vo4);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 관리자 일정 추가 중복체크
	public String idCheck(String contentsid) {
		try {
			int res = sqlSessionTemplate.selectOne("mytrip.idCheck", contentsid);
			if (res >0) {
				return "0";
			} 
			return "1";
		} catch (Exception e) {
		}
		return null;
	}

	
}