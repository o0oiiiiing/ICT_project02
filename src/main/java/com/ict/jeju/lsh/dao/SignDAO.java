package com.ict.jeju.lsh.dao;

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
			int res = sqlSessionTemplate.selectOne("user.idchk", u_id);
			if (res >0) {
				return "0";
			} 
			return "1";
		} catch (Exception e) {
			System.out.println("dao id chk err : "+e);
		}
		return null;
	}
	
	
	
	
}