package com.ict.jeju.lsh.controller;

import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.lsh.dao.UserVO;
import com.ict.jeju.lsh.service.MailService;
import com.ict.jeju.lsh.service.SignService;
import com.ict.jeju.wyy.dao.AdminVO;

@Controller
public class SignController {
	@Autowired
	private SignService signService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private MailService mailService;
	
	// 로그인 이동
	@GetMapping("login_go.do")
	public ModelAndView getLogin() {
		return new ModelAndView("lsh_view/login_page");
	}
	
	// 아이디찾기 이동
	@GetMapping("findID_go.do")
	public ModelAndView getFindID() {
		return new ModelAndView("lsh_view/find_id_page");
	}
	
	// 비밀번호 찾기 이동
	@GetMapping("findpwd_go.do")
	public ModelAndView getFindpwd() {
		return new ModelAndView("lsh_view/find_pwd_page");
	}
	
	// 회원가입 이동
	@GetMapping("join_go.do")
	public ModelAndView getJoin() {
		return new ModelAndView("lsh_view/join_page");
	}
	
	// 관리자 회원가입 페이지 이동
	@GetMapping("admin_join.do")
	public ModelAndView getAdminJoin() {
		return new ModelAndView("lsh_view/admin_join_page");
	}
	
	// 관리자 로그인 페이지 이동
	@GetMapping("admin_login.do")
	public ModelAndView getAdminLogin() {
		return new ModelAndView("lsh_view/admin_login_page");
	}
	
	// 로그인
	@PostMapping("login_ok.do")
	public ModelAndView getLoginOK(HttpSession session, UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		UserVO userVO2 = signService.getLoginOK(userVO);
		if (userVO2 == null) {
			session.setAttribute("loginChk", "fail");
			mv.addObject("msg", "가입한 내역이 없습니다.");
			mv.setViewName("lsh_view/login_page");
			return mv;
		}
		
	    if (userVO2 != null && passwordEncoder.matches(userVO.getU_pwd(), 
	    		userVO2.getU_pwd()) && userVO2.getActive().equals("0")) {
	        session.setAttribute("loginChk", "ok");
	        session.setAttribute("userVO", userVO2);
	        mv.addObject("userVO", userVO2);
	        mv.setViewName("redirect:home");
	        return mv;
	    }
	    if (userVO2.getActive().equals("1")) {
			session.setAttribute("loginChk", "fail");
			mv.addObject("msg", "이미 탈퇴한 회원입니다.");
			mv.setViewName("lsh_view/login_page");
			return mv;
		}
	    session.setAttribute("loginChk", "fail");
	    mv.addObject("msg", "입력하신 정보를 확인해주세요.");
	    mv.setViewName("lsh_view/login_page");
	    return mv;
	}
	
	// 관리자 로그인
	@PostMapping("admin_login_ok.do")
	public ModelAndView getAdminLoginOK(HttpSession session, AdminVO adminVO) {
		ModelAndView mv = new ModelAndView();
		AdminVO adminVO2 = signService.getAdminLoginOK(adminVO);
		if (adminVO2 == null) {
			session.setAttribute("admin_loginChk", "fail");
			mv.addObject("msg", "가입한 내역이 없습니다.");
			mv.setViewName("lsh_view/admin_login_page");
			return mv;
		}
		if (adminVO2 != null && passwordEncoder.matches(adminVO.getA_pwd(), adminVO2.getA_pwd())) {
			session.setAttribute("admin_loginChk", "ok");
			session.setAttribute("adminVO", adminVO2);
			mv.addObject("adminVO", adminVO2);
			mv.setViewName("redirect:home");
			return mv;
		}
		return null;
	}
	
	// 카카오 로그인
	@RequestMapping("kakao_login.do")
	public String KakaoLogin(String code, HttpSession session, UserVO userVO) {
		String access_token = signService.getAccessToken(code);
		UserVO userVO2 = signService.getKakaoInfo(access_token);
		session.setAttribute("loginChk", "ok");
		session.setAttribute("userVO", userVO2);
		return "redirect:home";
	}
	
	// 네이버 로그인
	@RequestMapping("naver_login.do")
	public String NaverLogin(String code, String state, HttpSession session, UserVO userVO) {
		String access_token = signService.getNaverToken(code, state);
		UserVO userVO2 = signService.getNaverInfo(access_token);
		session.setAttribute("loginChk", "ok");
		session.setAttribute("userVO", userVO2);
		return "redirect:home";
	}
	
	// 로그아웃
	@GetMapping("logout_go.do")
	public ModelAndView getLogout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:home");
	}
	
	// 관리자 계정 생성
	@RequestMapping("admin_join_ok.do")
	public ModelAndView getAdminJoinOK(AdminVO adminVO) {
		adminVO.setA_pwd(passwordEncoder.encode(adminVO.getA_pwd()));
		int res = signService.getAdminJoinOK(adminVO);
		if (res >0) {
			return new ModelAndView("redirect:admin_login.do");
		}
		return null;
	}

	// 회원가입
	// 이미지 기본값 설정못함 ㅠㅠ
	@PostMapping("join_ok.do")
	public ModelAndView getJoinOK(UserVO userVO, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:home");
			String path = request.getSession().getServletContext().getRealPath("/resources/lsh_user_images");
			MultipartFile user_profile = userVO.getUser_profile();
			if (user_profile.isEmpty()) {
				userVO.setU_profile_img("");
			} else {
				UUID uuid = UUID.randomUUID();
				String u_profile_img = uuid.toString()+"_"+user_profile.getOriginalFilename();
				userVO.setU_profile_img(u_profile_img);
				
				byte [] in = user_profile.getBytes();
				File out = new File(path, u_profile_img);
				FileCopyUtils.copy(in, out);
			}
			userVO.setU_pwd(passwordEncoder.encode(userVO.getU_pwd()));
			int res = signService.getJoinOK(userVO);
			if (res > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println("join err : "+e);
		}
		return null;
	}

	// 아이디 중복체크
	@RequestMapping(value = "id_doublechk.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getIdDoubleChk(@RequestParam("u_id") String u_id) {
		String result = signService.getIdDoubleChk(u_id);
		return result;
	}
	
	// 관리자 아이디 중복 체크
	@RequestMapping(value = "admin_chk.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAdminIdChk(@RequestParam("a_id") String a_id) {
		String res = signService.getAdminIdChk(a_id);
		return res;
	}
	
	// 아이디 찾기
	@RequestMapping("findID_ok.do")
	public ModelAndView getFindIdChk(UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		List<UserVO> find_list = signService.getFindIdChk(userVO);
		if (find_list != null) {
			mv.addObject("find_list", find_list);
			mv.setViewName("lsh_view/find_id_chk_page");
			return mv;
		}
		return new ModelAndView("redirect:findID_go.do");
	}
  
	// 비밀번호 찾기 이메일 인증번호 발송 및 DB업데이트
	@PostMapping("find_pwd_go.do")
	public ModelAndView SendMailOK(UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		UserVO userVO2 = signService.getLoginOK(userVO);
		try {
			// DB 정보와 입력 정보 비교
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
					mv.addObject("msg", "가입시 입력한 이메일로 임시 비밀번호가 발송되었습니다.");
					mv.setViewName("lsh_view/login_page");
					return mv;
				}
			}
			mv.addObject("msg", "입력한 정보를 확인해주세요.");
			mv.setViewName("lsh_view/find_pwd_page");
			return mv;
		} catch (Exception e) {
			System.out.println("con mail err : "+e);
		}
		return null;
	}
	
}
