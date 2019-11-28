package kr.goott.tour.register;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.tour.product.BasketVO;
import kr.goott.tour.product.HeartVO;
import kr.goott.tour.product.ProductVO;
import kr.goott.tour.product.ScheduleVO;
import kr.goott.tour.reservation.ReservationDAOInterface;
import kr.goott.tour.reservation.ReservationVO;

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
	//회원가입정보 수정폼
	@RequestMapping("/register/editForm")
	public ModelAndView register_EditForm(@RequestParam("userId") String userId) {
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		
		RegisterVO vo = dao.selectRecord(userId);
		ModelAndView mav = new ModelAndView();
		/* System.out.println(vo.getUserId()); */
		mav.addObject("vo", vo);
		mav.setViewName("register/registerEditForm");
		
		return mav;
	}
	//회원가입정보 수정
	@RequestMapping(value="/register/registerEditOk", method=RequestMethod.POST)
	public ModelAndView RegisterEditOk(RegisterVO vo) {
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		int cnt = dao.updateRecord(vo);
		System.out.println(cnt);
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("vo", vo);
		mav.addObject("cnt", cnt);
		
		mav.setViewName("register/registerEditOk");
		
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
			session.setAttribute("memType", vo2.getMemType());
			System.out.println(vo2.getMemType());
			
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
	
	//마이페이지 이동
	@RequestMapping("/register/mypage")
	public ModelAndView mypage(@RequestParam("userId") String userId) {
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		ReservationDAOInterface r_dao = sqlSession.getMapper(ReservationDAOInterface.class);
		
		ModelAndView mav = new ModelAndView();
		//예약리스트
		List<ReservationVO> r_list = dao.myRevList(userId);
			for(int i=0; i<r_list.size(); i++) {
				ProductVO pvo = r_dao.productInfo(r_list.get(i).getGoodCode());
				ScheduleVO svo = r_dao.scheduleInfo(r_list.get(i).getSc_num());
				mav.addObject("pvo", pvo);
				mav.addObject("svo", svo);
			}
		//결제리스트
		List<ReservationVO> p_list = dao.myPayList(userId);
			for(int i=0; i<p_list.size(); i++) {
				ProductVO pvo = r_dao.productInfo(p_list.get(i).getGoodCode());
				ScheduleVO svo = r_dao.scheduleInfo(p_list.get(i).getSc_num());
				mav.addObject("pvo", pvo);
				mav.addObject("svo", svo);
			}
		//관심리스트
		List<HeartVO> l_list = dao.myLikeList(userId);
			for(int i=0; i<l_list.size(); i++) {
				ProductVO pvo = r_dao.productInfo(l_list.get(i).getGoodCode());
				ScheduleVO svo = r_dao.scheduleInfo(l_list.get(i).getSc_num());
				mav.addObject("pvo", pvo);
				mav.addObject("svo", svo);
			}
		
		
		mav.addObject("l_list", l_list);
		mav.addObject("r_list", r_list);
		mav.addObject("p_list", p_list);
		mav.setViewName("register/mypage");
		return mav;
	}
	
	//회원탈퇴 폼으로 이동
	@RequestMapping("/register/del")
	public String delForm(@RequestParam("userId") String userId) {
		return "register/deleteForm";
	}
	
	//회원탈퇴 
	@RequestMapping(value="/register/deleteOk", method = RequestMethod.POST)
	public ModelAndView deleteOk(@RequestParam("userId") String userId,
								 @RequestParam("userPwd") String userPwd,
								 HttpServletRequest req) {
		
		RegisterDAOInterface dao = sqlSession.getMapper(RegisterDAOInterface.class);
		int cnt = dao.deleteRecord(userId, userPwd);
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		System.out.println(cnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.setViewName("register/deleteOk");
		
		return mav;
	}
}
