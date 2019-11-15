package kr.goott.tour.register;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/register/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) {		
		System.out.println(userId);
		
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		
		int result = dao.idCheck(userId);
		System.out.println(result);
		
		//�信 ������ ������ 
				
		return "/register/idCheck";
	}
	
	@RequestMapping("/register/registerForm")
	public ModelAndView insertRecord(RegisterVO vo) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
