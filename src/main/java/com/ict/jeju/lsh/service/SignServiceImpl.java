package com.ict.jeju.lsh.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
	
	@Override
	public String getAccess_token(String authorize_code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=b3c8cdc497ebc0c70d13c3383ee0f676");
			sb.append("&redirect_uri=http://localhost:8090/kakao_login.do");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);
			br.close();
			bw.close();
		} catch (Exception e) {
			System.out.println("token err : "+e);
		}
		return access_token;
	}
	
	@Override
	public Map<String, Object> getUser_info(String access_Token) {
		Map<String, Object> user_info = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			user_info.put("nickname", nickname);
			user_info.put("email", email);
		} catch (Exception e) {
			System.out.println("info err : "+e);
		}
		Map<String, Object> res = signDAO.find_kakao(user_info);
		System.out.println("find kakao : "+res);
		
		if (res ==null) {
			signDAO.kakao_insert(user_info);
		} else {
			return signDAO.find_kakao(user_info);
			//return res;
		}
		return user_info;
	}
	
	

}
