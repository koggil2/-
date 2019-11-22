package kr.goott.tour.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	//����ٱ��Ϸ� �̵�
	@RequestMapping("/reservation/basket")
	public ModelAndView	basketPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//������������ �̵�
	@RequestMapping("/reservation/reservation")
	public ModelAndView reservationPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/reservation");
		return mav;
	}
}
