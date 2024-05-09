package com.ict.jeju.lsh.controller;

import java.util.List;
import java.util.Random;

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
	
	// 로그인 화면 이동
	@GetMapping("login_go.do")
	public ModelAndView getLogin() {
		return new ModelAndView("lsh_view/login_page");
	}
	
	// 아이디찾기 화면 이동
	@GetMapping("findID_go.do")
	public ModelAndView getFindID() {
		return new ModelAndView("lsh_view/findID_page");
	}
	
	// 비밀번호 찾기 화면 이동
	@GetMapping("findpwd_go.do")
	public ModelAndView getFindpwd() {
		return new ModelAndView("lsh_view/findpwd_page");
	}
	
	// 회원가입 화면 이동
	@GetMapping("join_go.do")
	public ModelAndView getJoin() {
		return new ModelAndView("lsh_view/join_page");
	}
	
	// 로그인
	@PostMapping("login_ok.do")
	public ModelAndView getLoginOK(HttpSession session, UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		UserVO userVO2 = signService.getLoginOK(userVO);
		if (userVO2 == null) {
			session.setAttribute("loginChk", "fail");
			mv.addObject("msg", "가입한 이력이 없습니다");
			mv.setViewName("lsh_view/login_page");
			return mv;
		}
		String dpwd = userVO2.getU_pwd();
		if (! passwordEncoder.matches(userVO.getU_pwd(), dpwd)) {
			session.setAttribute("loginChk", "fail");
			mv.addObject("msg", "로그인정보 다름");
			mv.setViewName("lsh_view/login_page");
			return mv;
		} else {
			session.setAttribute("loginChk", "ok");
			session.setAttribute("userVO", userVO2);
			mv.addObject("userVO", userVO2);
			mv.setViewName("pdh-view/home");
			return mv;
		}
	}
	
	// 카카오로그인
	@RequestMapping("kakao_login.do")
	public String KakaoLogin(String code, HttpSession session, UserVO userVO) {
		System.out.println("code : "+code);
		
		String access_token = signService.getAccessToken(code);
		System.out.println("token : "+access_token);
		
		UserVO userVO2 = signService.getKakaoInfo(access_token);
		System.out.println("cont token : "+access_token);
		
		session.setAttribute("userVO", userVO2);
		session.setAttribute("loginChk", "ok");
		return "pdh-view/home";
	}
	
	// 네이버로그인
	@RequestMapping("naver_login.do")
	public String NaverLogin(String code, String state, HttpSession session, UserVO userVO) {
		System.out.println("code : "+code);
		System.out.println("state : " +state);
		String access_token = signService.getNaverToken(code, state);
		System.out.println("token : "+access_token);
		UserVO userVO2 = signService.getNaverInfo(access_token);
		session.setAttribute("userVO", userVO2);
		session.setAttribute("loginChk", "ok");
		return "pdh-view/home";
	}
	
	// 로그아웃
	@GetMapping("logout_go.do")
	public ModelAndView getLogout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("pdh-view/home");
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
			mv.setViewName("lsh_view/findID_chk_page");
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
					mv.setViewName("lsh_view/login_page");
					return mv;
				}
			}
			mv.addObject("msg", "다시 입력하세요.");
			mv.setViewName("lsh_view/findpwd_page");
			return mv;
		} catch (Exception e) {
			System.out.println("con mail err : "+e);
		}
		return null;
	}
	
}
