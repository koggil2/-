package kr.goott.tour.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.goott.tour.product.BasketVO;
import kr.goott.tour.product.ProductVO;
import kr.goott.tour.product.ScheduleVO;
import kr.goott.tour.register.RegisterVO;

public interface ReservationDAOInterface {
	//����ٱ��� ���� ��������
	public List<BasketVO> basketList(String userId);
	//��ǰ���� ��������
	public ProductVO productInfo(String goodCode);
	//�������� ��������
	public ScheduleVO scheduleInfo(int sc_num);
	// ȸ������ �޾ƿ���
	public RegisterVO registerInfo(String userId);
	// �����ϱ�
	public int insertReservation(ReservationVO rev_vo);
	// �������� ��������
	public ReservationVO reservationInfo(@Param("userId") String userId,
										 @Param("goodCode") String goodCode,
										 @Param("sc_num") int sc_num);
	// �����ϱ�
	public int payReservation(@Param("num") int num);
}
