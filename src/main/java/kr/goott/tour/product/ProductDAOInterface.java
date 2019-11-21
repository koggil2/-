package kr.goott.tour.product;

import java.util.List;

public interface ProductDAOInterface {
	// 여행상품 전체목록
	public List<ProductVO> getAllRecord(ProductVO vo);	
    // 여행상품 입력
    public void create(ProductVO vo);
    // 여행상품 수정
    public void update(ProductVO vo);
    // 여행상품  삭제
    public void delete(Integer rno);
    // 여행상품 선택
    public ProductVO selectRecord(String goodcode);
    // 상품 일정 선택
    public List<ScheduleVO> selectSchedule(String goodcode);

}
