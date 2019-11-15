package kr.goott.tour.register;

import javax.servlet.http.HttpServletRequest;

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
		//System.out.println(userId);
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		
		int result = dao.idCheck(userId); //���̵� �ߺ��˻�
		//System.out.println(result);
		
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
		int cnt = dao.insertRecord(vo);
		
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
}
