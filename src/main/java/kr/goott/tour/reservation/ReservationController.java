package kr.goott.tour.reservation;

import java.util.List;

import javax.crypto.Mac;
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
import kr.goott.tour.product.ProductDAOInterface;
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
		if(b_list.size()>0) {
			for(int i=0; i<b_list.size(); i++) {
				ProductVO pvo = dao.productInfo(b_list.get(i).getGoodCode());
				ScheduleVO svo = dao.scheduleInfo(b_list.get(i).getSc_num());
				mav.addObject("pvo", pvo);
				mav.addObject("svo", svo);
			}
			mav.addObject("b_list", b_list);
		}else {
			int cnt =0;
			mav.addObject("cnt", cnt);
		}
		
		mav.setViewName("reservation/basket");
		return mav;
	}
	
	//예약페이지로 이동
	@RequestMapping("/reservation/reservation")
	public ModelAndView reservationPage(ReservationVO rev_vo) {		
//		System.out.println(rev_vo.getUserId()+","+rev_vo.getGoodCode()+","+rev_vo.getSc_num());
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		RegisterVO rvo = dao.registerInfo(rev_vo.getUserId());
		ProductVO pvo = dao.productInfo(rev_vo.getGoodCode());
		ScheduleVO svo = dao.scheduleInfo(rev_vo.getSc_num());
		
//		System.out.println(svo.getStartDate()+","+svo.getBackDate());
		
		rev_vo.setPrice(pvo.getPrice()*rev_vo.getGoodNum());

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rev_vo", rev_vo);
		mav.addObject("rvo", rvo);
		mav.addObject("pvo", pvo);
		mav.addObject("svo", svo);
		mav.setViewName("reservation/reservation");
		return mav;
	}
	
	//예약하기
	@RequestMapping(value="/reservation/reservationOK", method=RequestMethod.POST)
	public ModelAndView reservationOk(ReservationVO rev_vo) {
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		ModelAndView mav = new ModelAndView();
		
		System.out.println(rev_vo.getReserName());
		
		int cnt = dao.insertReservation(rev_vo);
		
		ProductDAOInterface dao2 = sqlSession.getMapper(ProductDAOInterface.class);
		
		BasketVO bvo = new BasketVO();
		bvo.setGoodCode(rev_vo.getGoodCode());
		bvo.setSc_num(rev_vo.getSc_num());
		bvo.setUserId(rev_vo.getUserId());
		
		dao2.deleteBasket(bvo);
		
		mav.addObject("rev_vo", rev_vo);
		mav.addObject("cnt", cnt);
		mav.setViewName("/reservation/reservationOk");
		return mav;
	}
	
	//결제 폼으로 이동
	@RequestMapping("/reservation/payment")
	public ModelAndView paymentPage(@RequestParam("sc_num") int sc_num,
									@RequestParam("userId") String userId,
									@RequestParam("goodCode") String goodCode) {
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		
		ModelAndView mav = new ModelAndView();
//		System.out.println(sc_num);
		
		ReservationVO rev_vo = dao.reservationInfo(userId, goodCode, sc_num);
		ScheduleVO svo = dao.scheduleInfo(sc_num);
		System.out.println(rev_vo.getNum());
		
		mav.addObject("rev_vo", rev_vo);
		mav.addObject("svo", svo);
		mav.setViewName("reservation/paymentForm");
		return mav;
	}
	//결제하기
	@RequestMapping("/reservation/payOk")
	public ModelAndView payOk(@RequestParam("num") int num) {
		ReservationDAOInterface dao = sqlSession.getMapper(ReservationDAOInterface.class);
		
		System.out.println(num);
		int cnt = dao.payReservation(num);
		
		ModelAndView mav = new ModelAndView();	
		mav.addObject("cnt", cnt);
		mav.setViewName("reservation/payOk");
		return mav;
	}
}