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
	
	//���̵� �ߺ��˻�
	@RequestMapping("/register/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) {		
//		System.out.println(userId);
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		
		int result = dao.idCheck(userId); //���̵� �ߺ��˻�
//		System.out.println(result);
		
		if(result>0) return null; //���̵� �ߺ��� ���
		return userId; //���̵� �ߺ��� �ƴҰ��
	}

	//ȸ������ ��
	@RequestMapping("/register/registerForm")
	public String regForm() {
		return "register/registerForm";
	}
	
	//ȸ������
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
			System.out.println("ȸ�����Կ���.."+e.getMessage());
			mav.setViewName("register/registerError");
		}
			return mav;
	}
	
	//ȸ������ ����
	@RequestMapping("/register/registerError")
	public String regErr() {
		return "register/registerError";
	}
	
	//�α��� ��
	@RequestMapping("/register/loginForm")
	public String loginForm() {
		return "register/loginForm";
	}
	
	//�α���
	@RequestMapping("/register/login")
	public ModelAndView loginOk(RegisterVO vo, HttpServletRequest req) {
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		RegisterVO vo2 = dao.login(vo);
		
		ModelAndView mav = new ModelAndView();
		if(vo2==null) { //�α��� ����
			mav.setViewName("redirect:loginForm");
		}else { //�α��� ����
			HttpSession session = req.getSession();
			session.setAttribute("logid", vo2.getUserId());
			session.setAttribute("logname", vo2.getUserName());
			
			mav.setViewName("register/loginOk");
		}
		return mav;
	}
	
	//�α׾ƿ�
	@RequestMapping("/register/logoutOk")
	public ModelAndView logoutOk(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register/logoutOk");
		return mav;
	}
}
