package kr.goott.tour.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.tour.admin.AdminDAOInterface;
import kr.goott.tour.admin.AdminVO;

@Controller
public class AdminController {
	@Autowired
	SqlSession sqlSession;
	
	//관리자 로그인 폼
	@RequestMapping("/admin")
	public String admin_login() {
		return "admin/admin_login";
	}
	
	@RequestMapping("/admin/admin_login")
	public String admin_loginForm() {
		return "admin/admin_login";
	}
	
	
	@PostMapping("/admin/login")
	public ModelAndView admin_loginOk(AdminVO vo, HttpServletRequest req) {
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		AdminVO vo2 = dao.login(vo);
		
		ModelAndView mav = new ModelAndView();
		if(vo2==null) { //로그인 실패
			mav.setViewName("redirect:admin_login");
		}else { //로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("logid", vo2.getUserId());
			session.setAttribute("logname", vo2.getUserName());
			session.setAttribute("memType", vo2.getMemType());
			
			mav.setViewName("admin/loginOk");
		}
		return mav;
	}
	
	@RequestMapping("/admin/main")
	public ModelAndView admin_main() {
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		List<AdminVO> mCnt = dao.memCount();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mCnt", mCnt);
		mav.setViewName("admin/main");
		return mav;
	}

	@RequestMapping("/admin/tables")
	public ModelAndView admin_table() {
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		List<AdminVO> lst = dao.selectMem();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst", lst);
		mav.setViewName("admin/tables");
		return mav;
	}
	
	@RequestMapping("/admin/typeChange")
	public ModelAndView typeChange(HttpServletRequest req) {
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		AdminVO vo = new AdminVO();
		
		vo.setNum(Integer.parseInt(req.getParameter("num")));
		vo.setMemType(req.getParameter("memType"));
		dao.memUpdate(vo);
		
		//List<AdminVO> list = dao.selectMem();
		ModelAndView mav = new ModelAndView();
		//mav.addObject("list", list);
		mav.setViewName("admin/tablesUpdate");
		return mav;
	}
	
	@RequestMapping("/admin/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "admin/logoutOk";
	}
}
