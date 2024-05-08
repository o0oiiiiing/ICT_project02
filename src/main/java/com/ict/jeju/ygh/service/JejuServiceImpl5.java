package com.ict.jeju.ygh.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
import com.ict.jeju.ygh.dao.JejuDAO5;
import com.ict.jeju.ygh.dao.ReportVO;

@Service
public class JejuServiceImpl5 implements JejuService5 {
	@Autowired
	private JejuDAO5 jejuDAO5;
	
	// 관리자 Q&A 페이징
	@Override
	public int getTotalCount() {
		return jejuDAO5.getTotalCount();
	}
	
	// 관리자 Q&A 전체보기
	@Override
	public List<BoardVO> boardList(int offset, int limit) {
		return jejuDAO5.boardList(offset, limit);
	}

	// 관리자 Q&A 상세보기
	@Override
	public BoardVO boardDetail(String bo_idx) {
		return jejuDAO5.boardDetail(bo_idx);
	}

	// 관리자 신고 페이징
	@Override
	public int getTotalCount2() {
		return jejuDAO5.getTotalCount2();
	}
	
	// 관리자 신고 전체보기
	@Override
	public List<ReportVO> reportList(int offset, int limit) {
		return jejuDAO5.reportList(offset, limit);
	}

	// 관리자 신고 상세보기
	@Override
	public ReportVO reportDetail(String report_idx) {
		return jejuDAO5.reportDetail(report_idx);
	}
	
	
	@Override
	public int getLevUpdate(Map<String, Integer> map) {
		return jejuDAO5.getLevUpdate(map);
	}

	// Q&A 답글 가져오기
	@Override
	public List<CommentVO> commentList(String bo_idx) {
		return jejuDAO5.commentList(bo_idx);
	}

	// Q&A 답글 작성
	@Override
	public int commentInsert(CommentVO comvo) {
		return jejuDAO5.commentInsert(comvo);
	}

	// Q&A 게시판 작성 (사용자)
	@Override
	public int boardWrtieOk(BoardVO bovo) {
		return jejuDAO5.boardWrtieOk(bovo);
	}

	

	
	

}
