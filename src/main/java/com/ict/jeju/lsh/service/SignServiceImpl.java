package com.ict.jeju.lsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.lsh.dao.SignDAO;
import com.ict.jeju.lsh.dao.UserVO;

@Service
public class SignServiceImpl implements SignService {
	@Autowired
	private SignDAO signDAO;
	
	@Override
	public UserVO getLoginOK(UserVO userVO) {
		return signDAO.getLoginOK(userVO);
	}
	
	@Override
	public int getJoinOK(UserVO userVO) {
		return signDAO.getJoinOK(userVO);
	}
	
	@Override
	public String getIdDoubleChk(String u_id) {
		return signDAO.getIdDoubleChk(u_id);
	}
	
	@Override
	public int getChgPwd(UserVO userVO) {
		return signDAO.getChgPwd(userVO);
	}
	
	@Override
	public List<UserVO> getFindIdChk(UserVO userVO) {
		return signDAO.getFindIdChk(userVO);
	}
	
}
