package kr.goott.tour.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	@Autowired
	SqlSession sqlSession;
	
	//아이디 중복검사
	@RequestMapping("/register/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) {		
//		System.out.println(userId);
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		
		int result = dao.idCheck(userId); //아이디 중복검사
//		System.out.println(result);
		
		if(result>0) return null; //아이디가 중복일 경우
		return userId; //아이디가 중복이 아닐경우
	}

	//회원가입 폼
	@RequestMapping("/register/registerForm")
	public String regForm() {
		return "register/registerForm";
	}
	
	//회원가입
	@RequestMapping(value="/register/registerOk", method=RequestMethod.POST)
	public ModelAndView insertRecord(RegisterVO vo, HttpServletRequest request) {
		
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		System.out.println(vo.getUserName());
		ModelAndView mav = new ModelAndView();
		try{
			int cnt = dao.insertRecord(vo);
			
			if(cnt>0) {
				mav.setViewName("register/registerOk"); 
			}else {
				mav.setViewName("redirect:registerForm");
			}
		}catch(Exception e) {
			System.out.println("회원가입에러.."+e.getMessage());
			mav.setViewName("register/registerError");
		}
			return mav;
	}
	
	//회원가입 에러
	@RequestMapping("/register/registerError")
	public String regErr() {
		return "register/registerError";
	}
	
	//로그인 폼
	@RequestMapping("/register/loginForm")
	public String loginForm() {
		return "register/loginForm";
	}
	
	//로그인
	@RequestMapping("/register/login")
	public ModelAndView loginOk(RegisterVO vo, HttpServletRequest req) {
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		RegisterVO vo2 = dao.login(vo);
		
		ModelAndView mav = new ModelAndView();
		if(vo2==null) { //로그인 실패
			mav.setViewName("redirect:loginForm");
		}else { //로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("logid", vo2.getUserId());
			session.setAttribute("logname", vo2.getUserName());
			
			mav.setViewName("register/loginOk");
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/register/logoutOk")
	public ModelAndView logoutOk(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register/logoutOk");
		return mav;
	}
}
