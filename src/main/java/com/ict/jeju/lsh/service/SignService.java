package com.ict.jeju.lsh.service;

import java.util.List;
import java.util.Map;

import com.ict.jeju.lsh.dao.UserVO;

public interface SignService {
	public UserVO getLoginOK(UserVO userVO);
	public int getJoinOK(UserVO userVO);
	public String getIdDoubleChk(String u_id);
	public int getChgPwd(UserVO userVO);
	public List<UserVO> getFindIdChk(UserVO userVO);
	public String getAccess_token (String authorize_code);
	public Map<String, Object> getUser_info(String access_Token);
	
}
	
	
	

