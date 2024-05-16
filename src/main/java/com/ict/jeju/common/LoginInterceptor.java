package com.ict.jeju.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements AsyncHandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		HttpSession session = request.getSession(true);
		Object obj = session.getAttribute("loginChk");
		Object obj2 = session.getAttribute("admin_loginChk");
		if (obj == null && obj2 == null) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('로그인 후 이용 가능합니다.');");
	        out.println("window.location.href = 'login_go.do';");
	        out.println("</script>");
	        out.flush();
			return false;
		}
		return true;
	}
	
}
