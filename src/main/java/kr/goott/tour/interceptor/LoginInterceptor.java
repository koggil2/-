package kr.goott.tour.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//컨트롤러 실행전
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		//로그인 여부 확인 후 true(로그인시), flase(로그인실패시)를 리턴
		HttpSession session = req.getSession();
		String logid = (String)session.getAttribute("logid");
				
		if(logid==null || logid.equals("")) {
			res.sendRedirect("/tour/register/loginForm");
			return false;
		}
		
		return true;
	}
	//컨트롤러 호출 후 view페이지 출력전 호출
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
		super.postHandle(request, response, handler, modelAndView);
	}
	//컨트롤러 실행 후
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	
		super.afterCompletion(request, response, handler, ex);
	}
	
}
