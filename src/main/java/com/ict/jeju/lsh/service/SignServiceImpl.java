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
	public String getAccessToken(String code) {
		String access_token = "";
		String refresh_token ="";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=b3c8cdc497ebc0c70d13c3383ee0f676");
			sb.append("&redirect_uri=http://localhost:8090/kakao_login.do");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = con.getResponseCode();
			System.out.println("code : "+responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line ="";
			String result ="";
			while ((line=br.readLine())!=null) {
				result +=line;
			}
			System.err.println("response body : "+result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("token : "+access_token);
			System.out.println("ref token : "+refresh_token);
			br.close();
			bw.close();
		} catch (Exception e) {
			System.out.println("getting token err : "+e);
		}
		return access_token;
	}
	
	@Override
	public UserVO getKakaoInfo(String access_token) {
		Map<String, Object>map = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int responseCode = con.getResponseCode();
			System.out.println("code : "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line ="";
			String result ="";
			while ((line=br.readLine())!=null) {
				result +=line;
			}
			System.out.println("response body : "+result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			map.put("nickname", nickname);
			map.put("email", email);
			System.out.println("nickname : "+nickname);
			System.out.println("email : "+email);
		} catch (Exception e) {
			System.out.println("kakaoinfo err : "+e);
		}
		UserVO userVO = signDAO.kakao_find(map);
		System.out.println("userVO : "+userVO);
		if (userVO == null) {
			signDAO.kakao_join(map);
			return signDAO.kakao_find(map);
		} else {
			return userVO;
		}
	}
	
	

}
