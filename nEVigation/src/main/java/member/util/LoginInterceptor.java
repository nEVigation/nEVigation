package member.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor{
	
	//로깅 객체 
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("Interceptor start (login check)");
		
		//세션 객체
		HttpSession session = request.getSession();
		
		if( session.getAttribute("login") == null ) { //비로그인
			logger.info(">> no login session info" );
			
			response.sendRedirect("/member/notlogin");
			
			return false; //컨트롤러 접근 금지 
		}
		
		logger.info(">> login session detected ");
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("Interceptor end (login check)");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}
