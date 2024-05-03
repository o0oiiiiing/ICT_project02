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
	
	@Override
	public int getTotalCount() {
		return jejuDAO5.getTotalCount();
	}

	@Override
	public List<BoardVO> getBoardList(int offset, int limit) {
		return jejuDAO5.getBoardList(offset, limit);
	}

	@Override
	public BoardVO getBoardDetail(String bo_idx) {
		return jejuDAO5.getBoardDetail(bo_idx);
	}

	@Override
	public int getTotalCount2() {
		return jejuDAO5.getTotalCount2();
	}

	@Override
	public List<ReportVO> getReportList(int offset, int limit) {
		return jejuDAO5.getReportList(offset, limit);
	}

	@Override
	public ReportVO getReportDetail(String report_idx) {
		return jejuDAO5.getReportDetail(report_idx);
	}
	
	@Override
	public int getLevUpdate(Map<String, Integer> map) {
		return jejuDAO5.getLevUpdate(map);
	}

	@Override
	public List<CommentVO> getCommentList(String bo_idx) {
		return jejuDAO5.getCommentList(bo_idx);
	}

	
	@Override
	public int getCommentInsert(CommentVO comvo) {
		return jejuDAO5.getCommentInsert(comvo);
	}

	@Override
	public int boardWrtieOk(BoardVO bovo) {
		return jejuDAO5.boardWrtieOk(bovo);
	}

	

	
	

}
