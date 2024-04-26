package com.ict.jeju.lsh.service;

import com.ict.jeju.lsh.dao.UserVO;

public interface SignService {
	public UserVO getLoginOK(UserVO userVO);
	public int getJoinOK(UserVO userVO);
	
}
