package com.ict.jeju.ygh.service;

import java.util.List;
import java.util.Map;

import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
import com.ict.jeju.ygh.dao.ReportVO;

public interface JejuService5 {
	// 관리자페이지 Q&A
	public int getTotalCount();
	public List<BoardVO> getBoardList(int offset, int limit);
	public BoardVO getBoardDetail(String bo_idx);
	
	// 관리자페이지 신고
	public int getTotalCount2();
	public List<ReportVO> getReportList(int offset, int limit);
	public ReportVO getReportDetail(String report_idx);
	
	public int getLevUpdate(Map<String, Integer> map);
	
//	public int getAnsInsert(BoardVO bovo);
	
	public List<CommentVO> getCommentList(String bo_idx);
	
	public int getCommentInsert(CommentVO comvo);
}
