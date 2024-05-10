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
	public int boardWriteOk(BoardVO bovo);
	// Q&A 게시판 수정 (사용자)
	public int boardUpdate(BoardVO bovo);
	// Q&A 게시판 삭제 (사용자)
	public int boardDelete(BoardVO bovo);
	
	
	// 신고 게시판 작성 (사용자)
	public int reportWriteOk(ReportVO revo);
	// 신고 게시판 수정 (사용자)
	public int reportUpdate(ReportVO revo);
	// 신고 게시판 삭제 (사용자)
	public int reportDelete(ReportVO revo);
	
}
