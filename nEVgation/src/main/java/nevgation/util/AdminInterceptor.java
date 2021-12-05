package nevgation.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("Interceptor start (admin)");
		
		HttpSession session = request.getSession();
		
		if( session.getAttribute("login") == null ) { //비로그인
			logger.info(">> no login session info" );
			
			response.sendRedirect("/admin/unprivilegedUser");
			
			return false; //컨트롤러 접근 금지
			
		}else {
			if(session.getAttribute("user_type").toString().contentEquals("member")){ //권한없음
				logger.info(">> unprivileged user" );
				
				response.sendRedirect("/admin/unprivilegedUser");
				
				return false; //컨트롤러 접근 금지
			}
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
