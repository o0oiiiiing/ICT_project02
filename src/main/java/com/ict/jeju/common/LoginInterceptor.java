package com.ict.jeju.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements AsyncHandlerInterceptor{
	
	/*
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		HttpSession session = request.getSession(true);
		Object obj = session.getAttribute("loginChk");
		if (obj == null) {
			request.getRequestDispatcher("/WEB-INF/views/lsh_view/main.jsp").forward(request, response);
			return false;
		}
		return true;
	}

	 @Override 
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			 ModelAndView modelAndView) throws Exception { 
		AsyncHandlerInterceptor.super.postHandle(request, response, handler, modelAndView); 
	 }
	 
	 @Override 
	 public void afterCompletion(HttpServletRequest request,	 HttpServletResponse response, 
			 Object handler, Exception ex) throws Exception { 
		AsyncHandlerInterceptor.super.afterCompletion(request, response, handler, ex); 
	 }
	 */
	 
}
