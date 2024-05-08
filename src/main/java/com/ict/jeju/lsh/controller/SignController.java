package com.ict.jeju.lsh.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.jeju.lsh.dao.NaverVO;
import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.lsh.service.MailService;
import com.ict.jeju.lsh.service.SignService;

@Controller
public class SignController {
	@Autowired
	private SignService signService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private MailService mailService;
	
	// 성공시 이동할 화면 아무거나 만들어놓은거임
	@RequestMapping("mainsub.do")
	public ModelAndView getmain() {
		return new ModelAndView("lsh_view/main");
	}
	
	// 로그인 화면 이동
	@GetMapping("login_go.do")
	public ModelAndView getLogin() {
		return new ModelAndView("lsh_view/login");
	}
	
	// 아이디찾기 화면 이동
	@GetMapping("findID_go.do")
	public ModelAndView getFindID() {
		return new ModelAndView("lsh_view/findID");
	}
	
	// 비밀번호 찾기 화면 이동
	@GetMapping("findpwd_go.do")
	public ModelAndView getFindpwd() {
		return new ModelAndView("lsh_view/findpwd");
	}
	
	// 회원가입 화면 이동
	@GetMapping("join_go.do")
	public ModelAndView getJoin() {
		return new ModelAndView("lsh_view/join");
	}
	
	// 로그인
	@PostMapping("login_ok.do")
	public ModelAndView getLoginOK(HttpSession session, UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		UserVO userVO2 = signService.getLoginOK(userVO);
		if (userVO2 == null) {
			session.setAttribute("loginChk", "fail");
			mv.addObject("msg", "가입한 이력이 없습니다");
			mv.setViewName("lsh_view/login");
			return mv;
		}
		String dpwd = userVO2.getU_pwd();
		if (! passwordEncoder.matches(userVO.getU_pwd(), dpwd)) {
			session.setAttribute("loginChk", "fail");
			mv.addObject("msg", "로그인정보 다름");
			mv.setViewName("lsh_view/login");
			return mv;
		} else {
			session.setAttribute("loginChk", "ok");
			session.setAttribute("userVO", userVO2);
			mv.addObject("userVO", userVO2);
			
			// 로그인성공시 세션에 userVO 정보를 담아서 로그인 페이지로 이동함(아무렇게나 만든 임시페이지)
			mv.setViewName("redirect:/mainsub.do");
			return mv;
		}
	}
	
	// 카카오로그인
	@RequestMapping("kakao_login.do")
	public String KakaoLogin(@RequestParam(value = "code", required = false) String code, 
			HttpSession session, UserVO userVO) {
		System.out.println("code : "+code);
		
		String access_token = signService.getAccessToken(code);
		System.out.println("token : "+access_token);
		
		UserVO userVO2 = signService.getKakaoInfo(access_token);
		System.out.println("cont token : "+access_token);
		
		session.setAttribute("userVO", userVO2);
		session.setAttribute("loginChk", "ok");
		return "lsh_view/main";
	}
	
	
	// 네이버로그인 
	@RequestMapping("naverlogin.do")
	public ModelAndView NaverLogin(HttpServletRequest request, UserVO userVO) {
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String reqURL = "https://nid.naver.com/oauth2.0/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=i3iG6_9k8h7tam0e8JLn");
			sb.append("&client_secret=nPGni9yRqK");
			sb.append("&code=" + code);
			sb.append("&state=" + state);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

				String line = "";
				StringBuffer sb2 = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sb2.append(line);
				}
				String result = sb2.toString();
				
				Gson gson = new Gson();
				NaverVO nvo = gson.fromJson(result, NaverVO.class);
				request.getSession().setAttribute("access_token", nvo.getAccess_token());
				request.getSession().setAttribute("token_type", nvo.getToken_type());
				request.getSession().setAttribute("refresh_token", nvo.getRefresh_token());
				return new ModelAndView("lsh_view/main");
			}
		} catch (Exception e) {
			System.out.println("naver login err : "+ e);
		}
		return null;
	}
	
	// 로그아웃
	@GetMapping("logout_go.do")
	public ModelAndView getLogout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("lsh_view/main");
	}
	
	// 회원가입
	@PostMapping("join_ok.do")
	public ModelAndView getJoinOK(UserVO userVO) {
		String c_pwd = passwordEncoder.encode(userVO.getU_pwd());
		userVO.setU_pwd(c_pwd);
		int res = signService.getJoinOK(userVO);
		if (res > 0) {
			return new ModelAndView("redirect:login_go.do");
		}
		return null;
	}

	// 아이디 중복 확인
	@RequestMapping(value = "id_doublechk.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getIdDoubleChk(@RequestParam("u_id") String u_id) {
		String result = signService.getIdDoubleChk(u_id);
		return result;
	}
	
	// 아이디 찾기
	@RequestMapping("findID_ok.do")
	public ModelAndView getFindIdChk(UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		List<UserVO> find_list = signService.getFindIdChk(userVO);
		if (find_list != null) {
			mv.addObject("find_list", find_list);
			mv.setViewName("lsh_view/findID_chk");
			return mv;
		}
		return new ModelAndView("redirect:findID_go.do");
	}

	// 비밀번호 찾기 이메일 인증번호 발송 및 DB업데이트
	@PostMapping("email_send_ok.do")
	public ModelAndView SendMailOK(UserVO userVO, String u_email) {
		ModelAndView mv = new ModelAndView();
		UserVO userVO2 = signService.getLoginOK(userVO);
		try {
			// DB에 갔다온 정보와 입력한 정보를 가져와서 비교
			if (userVO2 != null && userVO2.getU_id().equals(userVO.getU_id()) && userVO2.getU_email().equals(userVO.getU_email())) {
				Random random = new Random();
				String randomNum = String.valueOf(random.nextInt(1000000) % 1000000);
				if (randomNum.length() < 6) {
					int substract = 6 - randomNum.length();
					StringBuffer sb = new StringBuffer();
					for (int i=0; i<substract; i++) {
						sb.append("0");
					}
					sb.append(randomNum);
					randomNum = sb.toString();
				}
				String chgpwd = passwordEncoder.encode(randomNum);
				userVO2.setU_pwd(chgpwd);
				
				int res = signService.getChgPwd(userVO2);
				if (res >0) {
					mailService.sendEmail(randomNum, userVO2.getU_email());
					mv.addObject("msg", "가입하신 이메일로 임시 비밀번호를 발급하였습니다.");
					mv.setViewName("lsh_view/login");
					return mv;
				}
			}
			mv.addObject("msg", "다시 입력하세요.");
			mv.setViewName("lsh_view/findpwd");
			return mv;
		} catch (Exception e) {
			System.out.println("con mail err : "+e);
		}
		return new ModelAndView("error");
	}
	
	
	
}















