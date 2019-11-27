package kr.goott.tour.reservation;

import javax.servlet.http.HttpServletRequest;

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
	
	
	//����ٱ��Ϸ� �̵�
	@RequestMapping("/reservation/basket")
	public ModelAndView	basketPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//������������ �̵�
	@RequestMapping("/reservation/reservation")
	public ModelAndView reservationPage(RegisterVO vo, HttpServletRequest request) {
	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/reservation");
		
		return mav;
	}
	
	//���� ������ �̵�
	@RequestMapping(value="/reservation/payment", method=RequestMethod.POST)
	public ModelAndView paymentPage(RegisterVO vo, HttpServletRequest request) {
	
		ModelAndView mav = new ModelAndView();
		

		mav.setViewName("reservation/paymentForm");
		return mav;
	}
}
