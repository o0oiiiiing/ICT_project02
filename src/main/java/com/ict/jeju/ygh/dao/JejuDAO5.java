package com.ict.jeju.ygh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.jeju.chm.dao.CategoryVO;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.wyy.dao.AdminVO;

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
	public List<BoardVO> adminBoardList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.admin_board_list", map);
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
	public List<ReportVO> adminReportList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.admin_report_list", map);
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

	// 신고 답글 가져오기
	public List<ReplyVO> replyList(String report_idx) {
		try {
			return sqlSessionTemplate.selectList("Board_table.replylist", report_idx);
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

	// Q&A 답글 작성
	public int commentUpdate(String bo_idx) {
		try {
			return sqlSessionTemplate.update("Board_table.comment_update", bo_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// Q&A 답글 수정
	public int commentUpdateOk(CommentVO comvo) {
		try {
			return sqlSessionTemplate.update("Board_table.comment_update_ok", comvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 신고 답글 작성
	public int replyInsert(ReplyVO repvo) {
		try {
			return sqlSessionTemplate.insert("Board_table.reply_insert", repvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 신고 답글 작성
	public int replyUpdate(String report_idx) {
		try {
			return sqlSessionTemplate.update("Board_table.reply_update", report_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 신고 답글 수정
	public int replyUpdateOk(ReplyVO repvo) {
		try {
			return sqlSessionTemplate.update("Board_table.reply_update_ok", repvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 신고 답글 삭제
	public int replyDelete(ReplyVO repvo) {
		try {
			return sqlSessionTemplate.delete("Board_table.reply_delete", repvo);
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

	// 회원정보 상세보기
	public UserVO userDetail(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.user_detail", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 회원정보수정
	public int userUpdate(UserVO userVO) {
		try {
			return sqlSessionTemplate.update("Board_table.user_update", userVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 비밀번호변경
	public int rePwd(UserVO uvo) {
		try {
			return sqlSessionTemplate.update("Board_table.pwd_update", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 사용자 Q&A 페이징
	public int getTotalCount3(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count3", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관리자 Q&A 전체보기
	public List<BoardVO> boardList(int offset, int limit, String u_idx) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("u_idx", Integer.parseInt(u_idx));
			return sqlSessionTemplate.selectList("Board_table.board_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 사용자 신고 페이징
	public int getTotalCount4(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count4", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관리자 신고 전체보기
	public List<ReportVO> reportList(int offset, int limit, String u_idx) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("u_idx", Integer.parseInt(u_idx));
			return sqlSessionTemplate.selectList("Board_table.report_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 관지자 전체 Q&A 페이징
	public int getTotalCount5() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count5");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관지자 전체 Q&A 전체보기
	public List<BoardVO> adminBoardlist2(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.admin_board_list2", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 관지자 전체 신고 페이징
	public int getTotalCount6() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count6");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관지자 전체 신고 전체보기
	public List<ReportVO> adminReportlist2(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.admin_report_list2", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 회원관리 페이징
	public int getTotalCount7(String filter) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count7", filter);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 회원관리 전체보기
	public List<UserVO> userList(int offset, int limit, String filter) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("filter", filter);
			return sqlSessionTemplate.selectList("Board_table.user_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 관리자 상세보기
	public AdminVO adminDetail(String a_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.admin_detail", a_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 회원관리 삭제
	public int userDelete(UserVO userVO) {
		try {
			return sqlSessionTemplate.update("Board_table.user_delete", userVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 회원관리 복구
	public int userRestore(UserVO userVO) {
		try {
			return sqlSessionTemplate.update("Board_table.user_Restore", userVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 나의 리뷰 글 목록 및 페이징
	public List<MyreviewVO> myreviewlist(int offset, int limit, String u_idx) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("u_idx", Integer.parseInt(u_idx));
			return sqlSessionTemplate.selectList("Board_table.myreview_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 나의 리뷰 contentsid ( contentsid 를 이용해서 vi_title 값 가져오기위함)
	public String myreviewtitle(String contentsid) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.myreview_title", contentsid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 회원현황
	public List<UserVO> userTotal() {
		try {
			List<UserVO> result = sqlSessionTemplate.selectList("Board_table.user_total");
			return result;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 일일 가입자 수
	public List<UserVO> joinUser() {
		try {
			List<UserVO> result = sqlSessionTemplate.selectList("Board_table.join_user");
			return result;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}