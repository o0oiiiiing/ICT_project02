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
	
	public int getTotalCount() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public List<BoardVO> getBoardList(int offset, int limit) {
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
	
	public BoardVO getBoardDetail(String bo_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.board_detail", bo_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	public int getTotalCount2() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count2");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public List<ReportVO> getReportList(int offset, int limit) {
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
	
	public ReportVO getReportDetail(String report_idx){
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

	/*
	public int getAnsInsert(BoardVO bovo) {
		try {
			return sqlSessionTemplate.insert("Board_table.ans_insert", bovo);
		} catch (Exception e) {
			System.out.println(e); 
		}
		return -1;
	}
	*/
	

	public List<CommentVO> getCommentList(String bo_idx) {
		try {
			return sqlSessionTemplate.selectList("Board_table.commentlist", bo_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getCommentInsert(CommentVO comvo) {
		try {
			return sqlSessionTemplate.insert("Board_table.comment_insert", comvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	

}