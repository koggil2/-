package kr.goott.tour.register;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.goott.tour.product.BasketVO;
import kr.goott.tour.product.HeartVO;
import kr.goott.tour.reservation.ReservationVO;

public interface RegisterDAOInterface {

	public int idCheck(String userId); //���̵� �ߺ��˻�
	
	public int insertRecord(RegisterVO vo); //ȸ�����
	
	public RegisterVO login(RegisterVO vo); //�α���
	
	public int updateRecord(RegisterVO vo); //ȸ����������
	
	public void getRegister(RegisterVO vo); //ȸ������ ��������
	
	public void findId(RegisterVO vo); //���̵� ã��
	
	public void findPwd(RegisterVO vo); //��й�ȣ ã��

	public RegisterVO selectRecord(String userId);//ȸ�����Լ��� ��
	
	public int deleteRecord(String userId, String userPwd); //ȸ��Ż��
	
	public List<ReservationVO> myRevList(@Param("userId") String userId); //���� ���� �ҷ�����
	
	public List<ReservationVO> myPayList(@Param("userId") String userId); //�������� �ҷ�����

	public List<HeartVO> myLikeList(@Param("userId") String userId); //�������� �ҷ�����
	
}
