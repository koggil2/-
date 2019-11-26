package kr.goott.tour.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	//여행바구니로 이동
	@RequestMapping("/reservation/basket")
	public ModelAndView	basketPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//예약페이지로 이동
	@RequestMapping("/reservation/reservation")
	public ModelAndView reservationPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/reservation");
		return mav;
	}
	
	//결제 폼으로 이동
	@RequestMapping(value="/reservation/payment", method=RequestMethod.POST)
	public String paymentPage() {
		
		return"reservation/paymentForm";
	}
}
