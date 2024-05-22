package com.ict.jeju.ygh.service;

import java.util.List;
import java.util.Map;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.wyy.dao.AdminVO;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
import com.ict.jeju.ygh.dao.MyreviewVO;
import com.ict.jeju.ygh.dao.ReplyVO;
import com.ict.jeju.ygh.dao.ReportVO;

public interface JejuService5 {
	// 관리자 Q&A 페이징
	public int getTotalCount();

	// 관리자 Q&A 전체보기
	public List<BoardVO> adminBoardList(int offset, int limit);

	// 관리자 Q&A 상세보기
	public BoardVO boardDetail(String bo_idx);

	// 관리자 신고 페이징
	public int getTotalCount2();

	// 관리자 신고 전체보기
	public List<ReportVO> adminReportList(int offset, int limit);

	// 관리자 신고 상세보기
	public ReportVO reportDetail(String report_idx);

	public int getLevUpdate(Map<String, Integer> map);

	// Q&A 답글 가져오기
	public List<CommentVO> commentList(String bo_idx);

	// 신고 답글 가져오기
	public List<ReplyVO> replyList(String report_idx);

	// Q&A 답글 작성
	public int commentInsert(CommentVO comvo);

	public int commentUpdate(String bo_idx);

	// Q&A 답글 삭제
	public int commentDelete(CommentVO comvo);

	// 신고 답글 작성
	public int replyInsert(ReplyVO repvo);

	public int replyUpdate(String report_idx);

	// 신고 답글 삭제
	public int replyDelete(ReplyVO repvo);

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

	// 회원정보 상세보기
	public UserVO userDetail(String u_idx);

	// 회원정보수정
	public int userUpdate(UserVO userVO);

	// 비밀번호변경
	public int rePwd(UserVO uvo);

	// 사용자 Q&A 페이징
	public int getTotalCount3(String u_idx);

	// 사용자 Q&A 전체보기
	public List<BoardVO> boardList(int offset, int limit, String u_idx);

	// 사용자 신고 페이징
	public int getTotalCount4(String u_idx);

	// 사용자 신고 전체보기
	public List<ReportVO> reportList(int offset, int limit, String u_idx);

	// 관지자 전체 Q&A 페이징
	public int getTotalCount5();

	// 관지자 전체 Q&A 전체보기
	public List<BoardVO> adminBoardlist2(int offset, int limit);

	// 관지자 전체 신고 페이징
	public int getTotalCount6();

	// 관지자 전체 신고 전체보기
	public List<ReportVO> adminReportlist2(int offset, int limit);

	// 회원관리 페이징
	public int getTotalCount7();

	// 회원관리 전체보기
	public List<UserVO> userList(int offset, int limit);

	// 관리자 상세보기
	public AdminVO adminDetail(String a_idx);

	// 회원관리 삭제
	public int userDelete(UserVO userVO);

	// 회원관리 복구
	public int userRestore(UserVO userVO);
	
	
	// 나의 리뷰 글 목록 및 페이징 - 최현민
	public List<MyreviewVO> myreviewlist(int offset, int limit, String u_idx);
    
	// 나의 리뷰 contentsid 가져와서 vi_title 값 가져오기 - 최현민
	public String myreviewtitle(String contentsid);

}
