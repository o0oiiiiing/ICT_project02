package com.ict.jeju.lsh.service;

import java.util.List;

import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.wyy.dao.AdminVO;

public interface SignService {
	public UserVO getLoginOK(UserVO userVO);
	public int getJoinOK(UserVO userVO);
	public String getIdDoubleChk(String u_id);
	public int getChgPwd(UserVO userVO);
	public List<UserVO> getFindIdChk(UserVO userVO);
	public String getAccessToken(String code);
	public UserVO getKakaoInfo(String access_token);
	public String getNaverToken(String code, String state);
	public UserVO getNaverInfo(String access_token);

	// 관리자
	public AdminVO getAdminLoginOK(AdminVO adminVO);
	public int getAdminJoinOK(AdminVO adminVO);
	public String getAdminIdChk(String a_id);
	
	
	
}