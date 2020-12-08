package com.kh.summer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		/*
		Member m = (Member)session.getAttribute("member");
		
		if( m == null ) {
			System.out.println("비 로그인 상태에서 [" + request.getRequestURI() + "] 접근!");
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후 이용해 주세요");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			// 화면 제어권을 넘기고
			return false; // 강제로 종료 시킴
		}
		*/
		return super.preHandle(request, response, handler);
	}

	
}
