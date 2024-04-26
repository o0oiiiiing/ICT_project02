package com.ict.jeju.lsh.service;

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
	
}
