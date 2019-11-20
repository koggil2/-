package kr.goott.tour.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//��Ʈ�ѷ� ������
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		//�α��� ���� Ȯ�� �� true(�α��ν�), flase(�α��ν��н�)�� ����
		HttpSession session = req.getSession();
		String logid = (String)session.getAttribute("logid");
				
		if(logid==null || logid.equals("")) {
			res.sendRedirect("/tour/register/loginForm");
			return false;
		}
		
		return true;
	}
	//��Ʈ�ѷ� ȣ�� �� view������ ����� ȣ��
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
		super.postHandle(request, response, handler, modelAndView);
	}
	//��Ʈ�ѷ� ���� ��
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	
		super.afterCompletion(request, response, handler, ex);
	}
	
}
