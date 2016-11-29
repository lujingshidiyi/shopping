package com.mucfc.interceptors;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mucfc.model.UserInfo;



public class PermissionInterceptor extends HandlerInterceptorAdapter {

	

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws IOException {
		
		String uri = request.getServletPath();
		if (uri.contains("security")) {
			UserInfo userinfo = (UserInfo) request.getSession().getAttribute("userinfo");
			if(null == userinfo) {
				response.sendRedirect(request.getContextPath() + "/toLogin");
				return false;
			}
		} 
		return true;
	
	}
	
}
