package kr.goott.tour.register;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/register/idCheck")
	public String idCheck(String userid, HttpServletRequest request) {
		boolean result = false;
		String userId = request.getParameter("userId");
				
		System.out.println("userId="+userId);
		
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		result = dao.idCheck(userId);
		
		//뷰에 데이터 보내기 
		request.setAttribute("result", result);
		request.setAttribute("userId", userId);
				
		return "/register/idCheck";
	}
	
	@RequestMapping("/register/registerForm")
	public ModelAndView insertRecord(RegisterVO vo) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
