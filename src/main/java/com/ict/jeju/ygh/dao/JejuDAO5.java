package com.ict.jeju.ygh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.jeju.lsh.dao.UserVO;

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
	public int commentUpdate(String bo_idx) {
		try {
			return sqlSessionTemplate.update("Board_table.comment_update", bo_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// Q&A 답글 삭제
	public int commentDelete(CommentVO comvo) {
		try {
			return sqlSessionTemplate.delete("Board_table.comment_delete", comvo);
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
	public int replyUpdate(String report_idx) {
		try {
			return sqlSessionTemplate.update("Board_table.reply_update", report_idx);
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

	// 회원정보 상세보기
	public UserVO userDetail(String U_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.user_detail", U_idx);
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

	// 사용자 Q&A 페이징
	public int getTotalCount3(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count3", u_idx);
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

	// 사용자 신고 페이징
	public int getTotalCount4(String u_idx) {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count4", u_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 관지자 전체 Q&A 전체보기
	public int getTotalCount5() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count5");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// 관지자 전체 Q&A 페이징
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
	
	// 관지자 전체 신고 전체보기
	public int getTotalCount6() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count6");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 관지자 전체 신고 페이징
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
	public int getTotalCount7() {
		try {
			return sqlSessionTemplate.selectOne("Board_table.count7");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	// 회원관리 전체보기
	public List<UserVO> userList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("Board_table.user_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}