package com.ict.jeju.ygh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JejuDAO5 {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 관리자 Q&A 페이징
	public int getTotalCount() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관리자 Q&A 전체보기
	public List<BoardVO> boardList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.board_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 관리자 Q&A 상세보기
	public BoardVO boardDetail(String bo_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.board_detail", bo_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 관리자 신고 페이징
	public int getTotalCount2() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count2");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관리자 신고 전체보기
	public List<ReportVO> reportList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.report_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 관리자 신고 상세보기
	public ReportVO reportDetail(String report_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.report_detail", report_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getLevUpdate(Map<String, Integer> map) {
		try {
			return sqlSessionTemplate.update("Board_table.lev_update", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// Q&A 답글 가져오기
	public List<CommentVO> commentList(String bo_idx) {
		try {
			return sqlSessionTemplate.selectList("Board_table.commentlist", bo_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// Q&A 답글 작성
	public int commentInsert(CommentVO comvo) {
		try {
			return sqlSessionTemplate.insert("Board_table.comment_insert", comvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// Q&A 게시판 작성 (사용자)
	public int boardWriteOk(BoardVO bovo) {
		try {
			return sqlSessionTemplate.insert("Board_table.board_insert", bovo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// Q&A 게시판 수정 (사용자)
	public int boardUpdate(BoardVO bovo) {
		try {
			return sqlSessionTemplate.update("Board_table.board_update", bovo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// Q&A 게시판 삭제 (사용자)
	public int boardDelete(BoardVO bovo) {
		try {
			return sqlSessionTemplate.delete("Board_table.board_delete", bovo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 신고 게시판 작성 (사용자)
	public int reportWriteOk(ReportVO revo) {
		try {
			return sqlSessionTemplate.insert("Board_table.report_insert", revo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 신고 게시판 수정 (사용자)
	public int reportUpdate(ReportVO revo) {
		try {
			return sqlSessionTemplate.update("Board_table.report_update", revo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 신고 게시판 삭제 (사용자)
	public int reportDelete(ReportVO revo) {
		try {
			return sqlSessionTemplate.delete("Board_table.report_delete", revo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

}