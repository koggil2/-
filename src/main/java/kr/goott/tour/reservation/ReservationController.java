package kr.goott.tour.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.tour.register.RegisterDAOInterface;
import kr.goott.tour.register.RegisterVO;

@Controller
public class ReservationController {
	@Autowired
	SqlSession sqlSession;
	
	
	//여행바구니로 이동
	@RequestMapping("/reservation/basket")
	public ModelAndView	basketPage(ReservationVO vo, HttpServletRequest request) {
		ReservationDAOInterface dao = 
		
		
		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//예약페이지로 이동
	@RequestMapping("/reservation/reservation")
	public ModelAndView reservationPage(HttpServletRequest request) {
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		HttpSession hs = request.getSession();
		String userId = (String)hs.getAttribute("logid");
		RegisterVO vo2 = dao.getRegister(userId);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo2", vo2);
		mav.setViewName("reservation/reservation");
		return mav;
	}
	
	//결제 폼으로 이동
	@RequestMapping(value="/reservation/payment", method=RequestMethod.POST)
	public ModelAndView paymentPage(ReservationVO vo) {
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		ReservationVO vo3 = dao.getReservation(vo);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo3", vo3);
		mav.setViewName("reservation/paymentForm");
		return mav;
	}

	
	
	
	
	
	
	
	
	
}