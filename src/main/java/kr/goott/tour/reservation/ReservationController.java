package kr.goott.tour.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.tour.product.BasketVO;
import kr.goott.tour.product.ProductVO;
import kr.goott.tour.product.ScheduleVO;
import kr.goott.tour.register.RegisterDAOInterface;
import kr.goott.tour.register.RegisterVO;

@Controller
public class ReservationController {
	@Autowired
	SqlSession sqlSession;
	
	
	//여행바구니로 이동
	@RequestMapping("/reservation/basket")
	public ModelAndView	basketPage(@RequestParam("userId") String userId) {
//		String userId = (String)request.getSession().getAttribute("logid");
//		System.out.println(userId);
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		List<BasketVO> b_list = dao.basketList(userId);
		ModelAndView mav = new ModelAndView();
		for(int i=0; i<b_list.size(); i++) {
			ProductVO pvo = dao.productInfo(b_list.get(i).getGoodCode());
			ScheduleVO svo = dao.scheduleInfo(b_list.get(i).getSc_num());
			mav.addObject("pvo", pvo);
			mav.addObject("svo", svo);
		}
		
		mav.addObject("b_list", b_list);
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//예약하기
	@RequestMapping("/reservation/reser")
	public ModelAndView	insertReservation(ReservationVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//예약페이지로 이동
	@RequestMapping("/reservation/reservation")
	public ModelAndView reservationPage(HttpServletRequest request) {		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/reservation");
		return mav;
	}
	
//	//결제 폼으로 이동
//	@RequestMapping(value="/reservation/payment", method=RequestMethod.POST)
//	public ModelAndView paymentPage(ReservationVO vo) {
//		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
//		ReservationVO vo3 = dao.getReservation(vo);
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("vo3", vo3);
//		mav.setViewName("reservation/paymentForm");
//		return mav;
//	}
//	
}