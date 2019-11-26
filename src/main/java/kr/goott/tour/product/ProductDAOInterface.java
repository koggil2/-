package kr.goott.tour.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ProductDAOInterface {
	// 여행상품 전체목록
	public List<ProductVO> getAllRecord(ProductVO vo);	
    // 여행상품 입력
    public void create(ProductVO vo);
    // 여행상품 수정
    public void update(ProductVO vo);
    // 여행상품  삭제
    public void delete(String goodCode);
    // 여행상품 선택
    public ProductVO selectRecord(String goodcode);
    // 상품 일정 전체 목록 선택
    public List<ScheduleVO> selectAllSchedule(String goodcode);
    // 상품 일정 전체 목록 선택(로그인 시)
    public Integer selectUserSchedule(@Param("sc_num") int sc_num, @Param("userId") String userId);    
    // 상세 상품 선택
    public ScheduleVO selectShcedule(int num);
    // 여행분류별 상품 리스트선택
    public List<ProductVO> travelTypeList(String travelType);
    // 여행바구니 추가
    public int insertBasket(BasketVO vo);
    // 여행바구니 취소
    public int deleteBasket(BasketVO vo);
}
