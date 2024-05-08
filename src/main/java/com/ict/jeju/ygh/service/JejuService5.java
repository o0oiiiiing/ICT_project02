package com.ict.jeju.ygh.service;

import java.util.List;
import java.util.Map;

import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
import com.ict.jeju.ygh.dao.ReportVO;

public interface JejuService5 {
	// 관리자 Q&A 페이징
	public int getTotalCount();
	
	// 관리자 Q&A 전체보기
	public List<BoardVO> boardList(int offset, int limit);
	
	// 관리자 Q&A 상세보기
	public BoardVO boardDetail(String bo_idx);
	
	// 관리자 신고 페이징
	public int getTotalCount2();
	
	// 관리자 신고 전체보기
	public List<ReportVO> reportList(int offset, int limit);
	
	// 관리자 신고 상세보기
	public ReportVO reportDetail(String report_idx);
	
	
	public int getLevUpdate(Map<String, Integer> map);
	
	// Q&A 답글 가져오기
	public List<CommentVO> commentList(String bo_idx);
	
	// Q&A 답글 작성
	public int commentInsert(CommentVO comvo);
	
	// Q&A 게시판 작성 (사용자)
	public int boardWrtieOk(BoardVO bovo);
	
}
