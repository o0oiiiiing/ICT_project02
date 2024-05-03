package com.ict.jeju.lsh.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public Map<String, Object> find_kakao(Map<String, Object> user_info) {
		try {
			return sqlSessionTemplate.selectOne("user.find_kakao", user_info);
		} catch (Exception e) {
			System.out.println("dao find kakao err : "+e);
		}
		return null;
	}
	
	public void kakao_insert(Map<String, Object> user_info) {
		try {
			sqlSessionTemplate.insert("user.insert_kakao", user_info);
		} catch (Exception e) {
			System.out.println("dao kakao insert err : "+e);
		}
	}
	
	
	
}