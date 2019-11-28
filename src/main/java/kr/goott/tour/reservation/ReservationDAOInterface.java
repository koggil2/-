package kr.goott.tour.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.goott.tour.product.BasketVO;
import kr.goott.tour.product.ProductVO;
import kr.goott.tour.product.ScheduleVO;
import kr.goott.tour.register.RegisterVO;

public interface ReservationDAOInterface {
	//여행바구니 정보 가져오기
	public List<BasketVO> basketList(String userId);
	//상품정보 가져오기
	public ProductVO productInfo(String goodCode);
	//일정정보 가져오기
	public ScheduleVO scheduleInfo(int sc_num);
	// 회원정보 받아오기
	public RegisterVO registerInfo(String userId);
	// 예약하기
	public int insertReservation(ReservationVO rev_vo);
	// 예약정보 가져오기
	public ReservationVO reservationInfo(@Param("userId") String userId,
										 @Param("goodCode") String goodCode,
										 @Param("sc_num") int sc_num);
	// 결제하기
	public int payReservation(@Param("num") int num);
}
