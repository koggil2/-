package kr.goott.tour.register;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.goott.tour.product.BasketVO;
import kr.goott.tour.product.HeartVO;
import kr.goott.tour.reservation.ReservationVO;

public interface RegisterDAOInterface {

	public int idCheck(String userId); //아이디 중복검사
	
	public int insertRecord(RegisterVO vo); //회원등록
	
	public RegisterVO login(RegisterVO vo); //로그인
	
	public int updateRecord(RegisterVO vo); //회원정보수정
	
	public void getRegister(RegisterVO vo); //회원정보 가져오기
	
	public void findId(RegisterVO vo); //아이디 찾기
	
	public void findPwd(RegisterVO vo); //비밀번호 찾기

	public RegisterVO selectRecord(String userId);//회원가입수정 폼
	
	public int deleteRecord(String userId, String userPwd); //회원탈퇴
	
	public List<ReservationVO> myRevList(@Param("userId") String userId); //예약 정보 불러오기
	
	public List<ReservationVO> myPayList(@Param("userId") String userId); //결제정보 불러오기

	public List<HeartVO> myLikeList(@Param("userId") String userId); //관심정보 불러오기
	
}
