package com.ict.jeju.lsh.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.jeju.wyy.dao.AdminVO;

@Repository
public class SignDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO getLoginOK(UserVO userVO) {
		try {
			return sqlSessionTemplate.selectOne("user.login", userVO);
		} catch (Exception e) {
			System.out.println("dao login err : "+e);
		}
		return null;
	}
	
	public int getJoinOK(UserVO userVO) {
		try {
			return sqlSessionTemplate.insert("user.join", userVO);
		} catch (Exception e) {
			System.out.println("dao join err : "+e);
		}
		return -1;
	}
	
	public String getIdDoubleChk(String u_id) {
		try {
			int res = sqlSessionTemplate.selectOne("user.id_chk", u_id);
			if (res >0) {
				return "0";
			} 
			return "1";
		} catch (Exception e) {
			System.out.println("dao id chk err : "+e);
		}
		return null;
	}
	
	public int getChgPwd(UserVO userVO) {
		try {
			return sqlSessionTemplate.update("user.chgpwd", userVO);
		} catch (Exception e) {
			System.out.println("dao ch pwd err : "+e);
		}
		return -1;
	}
	
	public List<UserVO> getFindIdChk(UserVO userVO) {
		try {
			return sqlSessionTemplate.selectList("user.find_id", userVO);
		} catch (Exception e) {
			System.out.println("dao find id err : "+e);
		}
		return null;
	}

	public UserVO kakao_find(Map<String, Object> map) {
		try {
			return sqlSessionTemplate.selectOne("user.kakao_find", map);
		} catch (Exception e) {
			System.out.println("dao kakao find err : "+e);
		}
		return null;
	}
	
	public int kakao_join(Map<String, Object> map) {
		try {
			return sqlSessionTemplate.insert("user.kakao_join", map);
		} catch (Exception e) {
			System.out.println("dao kakao join err : "+e);
		}
		return -1;
	}
	
	public UserVO naver_find(Map<String, Object> map) {
		try {
			return sqlSessionTemplate.selectOne("user.naver_find", map);
		} catch (Exception e) {
			System.out.println("dao naver find err : "+e);
		}
		return null;
	}
	
	public int naver_join(Map<String, Object> map) {
		try {
			return sqlSessionTemplate.insert("user.naver_join", map);
		} catch (Exception e) {
			System.out.println("dao naver join err : "+e);
		}
		return -1;
	}
	
	// 관리자 로그인
	public AdminVO getAdminLoginOK(AdminVO adminVO) {
		try {
			return sqlSessionTemplate.selectOne("admin.admin_login", adminVO);
		} catch (Exception e) {
			System.out.println("dao admin login err : "+e);
		}
		return null;
	}
	
	
	// 관리자 권한부여
	public int getAdminJoinOK(AdminVO adminVO) {
		try {
			return sqlSessionTemplate.insert("admin.admin_join", adminVO);
		} catch (Exception e) {
			System.out.println("dao admin join err : "+e);
		}
		return -1;
	}
	
	// 관리자 중복 체크
	public String getAdminIdChk(String a_id) {
		try {
			int res = sqlSessionTemplate.selectOne("admin.admin_idChk", a_id);
			if (res >0) {
				return "0";
			}
			return "1";
		} catch (Exception e) {
			System.err.println("dao admin id chk err : "+e);
		}
		return null;
	}
	
}

