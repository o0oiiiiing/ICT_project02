package com.ict.jeju.lsh.service;

import java.util.List;

import com.ict.jeju.lsh.dao.UserVO;

public interface SignService {
	public UserVO getLoginOK(UserVO userVO);
	public int getJoinOK(UserVO userVO);
	public String getIdDoubleChk(String u_id);
	public int getChgPwd(UserVO userVO);
	public List<UserVO> getFindIdChk(UserVO userVO);
	public String getAccessToken(String code);
	public UserVO getKakaoInfo(String access_token);

}
	
	
	

