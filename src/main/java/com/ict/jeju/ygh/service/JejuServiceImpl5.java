package com.ict.jeju.ygh.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.pdh.dao.ReviewVO;
import com.ict.jeju.wyy.dao.AdminVO;
import com.ict.jeju.wyy.dao.UserVO4;
import com.ict.jeju.ygh.dao.BoardVO;
import com.ict.jeju.ygh.dao.CommentVO;
import com.ict.jeju.ygh.dao.JejuDAO5;
import com.ict.jeju.ygh.dao.MyreviewVO;
import com.ict.jeju.ygh.dao.ReplyVO;
import com.ict.jeju.ygh.dao.ReportVO;

@Service
public class JejuServiceImpl5 implements JejuService5 {
	@Autowired
	private JejuDAO5 jejuDAO5;

	// 관리자 미답변 Q&A 페이징
	@Override
	public int getTotalCount() {
		return jejuDAO5.getTotalCount();
	}

	// 관리자 미답변 Q&A 전체보기
	@Override
	public List<BoardVO> adminBoardList(int offset, int limit) {
		return jejuDAO5.adminBoardList(offset, limit);
	}
	
	// 관리자 답변 Q&A 페이징
	@Override
	public int getTotalCount8() {
		return jejuDAO5.getTotalCount8();
	}
	
	// 관리자 답변 Q&A 전체보기
	@Override
	public List<BoardVO> adminBoardList2(int offset, int limit) {
		return jejuDAO5.adminBoardList2(offset, limit);
	}

	// 관리자 Q&A 상세보기
	@Override
	public BoardVO boardDetail(String bo_idx) {
		return jejuDAO5.boardDetail(bo_idx);
	}

	// 관리자 미답변 신고 페이징
	@Override
	public int getTotalCount2() {
		return jejuDAO5.getTotalCount2();
	}

	// 관리자 미답변 신고 전체보기
	@Override
	public List<ReportVO> adminReportList(int offset, int limit) {
		return jejuDAO5.adminReportList(offset, limit);
	}
	
	// 관리자 답변 신고 페이징
	@Override
	public int getTotalCount9() {
		return jejuDAO5.getTotalCount9();
	}
	
	// 관리자 답변 신고 전체보기
	@Override
	public List<ReportVO> adminReportList2(int offset, int limit) {
		return jejuDAO5.adminReportList2(offset, limit);
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

	// 신고 답글 가져오기
	@Override
	public List<ReplyVO> replyList(String report_idx) {
		return jejuDAO5.replyList(report_idx);
	}
	
	// 신고 리뷰 가져오기
	@Override
	public ReviewVO reviewDetail(String re_idx) {
		return jejuDAO5.reviewDetail(re_idx);
	}


	// Q&A 답글 작성
	@Override
	public int commentInsert(CommentVO comvo) {
		return jejuDAO5.commentInsert(comvo);
	}

	// Q&A 답글 작성
	@Override
	public int commentUpdate(String bo_idx) {
		return jejuDAO5.commentUpdate(bo_idx);
	}

	// Q&A 답글 수정
	@Override
	public int commentUpdateOk(CommentVO comvo) {
		return jejuDAO5.commentUpdateOk(comvo);
	}

	// 신고 답글 작성
	@Override
	public int replyInsert(ReplyVO repvo) {
		return jejuDAO5.replyInsert(repvo);
	}

	// 신고 답글 작성
	@Override
	public int replyUpdate(String report_idx) {
		return jejuDAO5.replyUpdate(report_idx);
	}

	// 신고 답글 수정
	@Override
	public int replyUpdateOk(ReplyVO repvo) {
		return jejuDAO5.replyUpdateOk(repvo);
	}
	
	// 신고 답글 수정
	@Override
	public int userReport(ReplyVO repvo) {
		return jejuDAO5.userReport(repvo);
	}

	// 신고 답글 삭제
	@Override
	public int replyDelete(ReplyVO repvo) {
		return jejuDAO5.replyDelete(repvo);
	}

	// Q&A 게시판 작성 (사용자)
	@Override
	public int boardWriteOk(BoardVO bovo) {
		return jejuDAO5.boardWriteOk(bovo);
	}

	// Q&A 게시판 수정 (사용자)
	@Override
	public int boardUpdate(BoardVO bovo) {
		return jejuDAO5.boardUpdate(bovo);
	}

	// Q&A 게시판 삭제 (사용자)
	@Override
	public int boardDelete(BoardVO bovo) {
		return jejuDAO5.boardDelete(bovo);
	}

	// 신고 게시판 작성 (사용자)
	@Override
	public int reportWriteOk(ReportVO revo) {
		return jejuDAO5.reportWriteOk(revo);
	}

	// 회원정보 상세보기
	@Override
	public UserVO userDetail(String u_idx) {
		return jejuDAO5.userDetail(u_idx);
	}

	// 회원정보수정
	@Override
	public int userUpdate(UserVO userVO) {
		return jejuDAO5.userUpdate(userVO);
	}

	// 비밀번호변경
	@Override
	public int rePwd(UserVO uvo) {
		return jejuDAO5.rePwd(uvo);
	}

	// 사용자 Q&A 페이징
	@Override
	public int getTotalCount3(String u_idx) {
		return jejuDAO5.getTotalCount3(u_idx);
	}

	// 사용자 Q&A 전체보기
	@Override
	public List<BoardVO> boardList(int offset, int limit, String u_idx) {
		return jejuDAO5.boardList(offset, limit, u_idx);
	}

	// 사용자 신고 페이징
	@Override
	public int getTotalCount4(String u_idx) {
		return jejuDAO5.getTotalCount4(u_idx);
	}

	// 사용자 신고 전체보기
	@Override
	public List<ReportVO> reportList(int offset, int limit, String u_idx) {
		return jejuDAO5.reportList(offset, limit, u_idx);
	}

	// 회원관리 페이징
	@Override
	public int getTotalCount7(String filter) {
		return jejuDAO5.getTotalCount7(filter);
	}

	// 회원관리 전체보기
	@Override
	public List<UserVO> userList(int offset, int limit, String filter) {
		return jejuDAO5.userList(offset, limit, filter);
	}

	// 관리자 상세보기
	@Override
	public AdminVO adminDetail(String a_idx) {
		return jejuDAO5.adminDetail(a_idx);
	}

	// 회원관리 삭제
	@Override
	public int userDelete(UserVO userVO) {
		return jejuDAO5.userDelete(userVO);
	}

	// 회원관리 복구
	@Override
	public int userRestore(UserVO userVO) {
		return jejuDAO5.userRestore(userVO);
	}
	
	// 나의 리뷰 글 목록 및 페이징 - 최현민
	@Override
	public List<MyreviewVO> myreviewlist(int offset, int limit, String u_idx) {
		return jejuDAO5.myreviewlist(offset, limit, u_idx);
	}
	
	// 나의 리뷰 contentsid 가져와서 vi_title 값 가져오기 - 최현민
	@Override
	public String myreviewtitle(String contentsid) {
		return jejuDAO5.myreviewtitle(contentsid);
	}
	
	// 나의 리뷰 count
	@Override
	public List<UserVO4> myreviewCount(String u_idx) {
		return jejuDAO5.myreviewCount(u_idx);
	}
	
	// 나의 리뷰 디테일 페이지
	/*
	 * @Override public UserVO myreview_detail(String u_idx) { return
	 * jejuDAO5.myreview_detail(u_idx); }
	 */
	
	// 나의 리뷰 디테일 페이지 갈떄 가져갈 리뷰 리스트
	@Override
	public MyreviewVO myreview_detail(String re_idx) {
		return jejuDAO5.myreview_detail(re_idx);
	}
	
	// 나의 리뷰 contentsid 가져와서 vi_title 값 가져오기 (detail)
	@Override
	public String myreviewtitle2(String contentsid) {
		return jejuDAO5.myreviewtitle(contentsid);
	}
	
	// 나의 리뷰 re_idx 가져와서 image 값 가져오기 (detail)
		@Override
		public String myreviewimage(String re_idx) {
			return jejuDAO5.myreviewimage(re_idx);
		}
	
	// 나의 리뷰 페이징 카운트
	@Override
	public int getTotalCount10(String u_idx) {
		return jejuDAO5.getTotalCount10(u_idx);
	}
	
	// 나의 리뷰 삭제
	@Override
	public int myreview_Delete(String re_idx) {
		return jejuDAO5.myreviewDelete(re_idx);
	}
	
	// 회원현황
	@Override
	public List<UserVO> userTotal() {
		return jejuDAO5.userTotal();
	}

	// 일일 가입자 수
	@Override
	public List<UserVO> joinUser() {
		return jejuDAO5.joinUser();
	}

	

	

	

}
