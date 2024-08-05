package com.kh.aniht.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter { // 클래스 영역 시작

	// perHandle 메소드 (선처리)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// HttpSession 객체 얻어내기
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			// 로그인이 된 상태
			
			return true;
			
		} else {
			// 로그인이 안된 상태
			
			// session 에 일회성 알람 문구 담기
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			
			// 메인페이지로 url 재요청
			response.sendRedirect(request.getContextPath());
			
			return false;
			
		}
				
	}
	
} // 클래스 영역 끝
