package kr.goott.tour.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ProductDAOInterface {
	// �����ǰ ��ü���
	public List<ProductVO> getAllRecord(ProductVO vo);	
    // �����ǰ �Է�
    public void create(ProductVO vo);
    // �����ǰ ����
    public void update(ProductVO vo);
    // �����ǰ  ����
    public void delete(String goodCode);
    // �����ǰ ����
    public ProductVO selectRecord(String goodcode);
    // ��ǰ ���� ��ü ��� ����
    public List<ScheduleVO> selectAllSchedule(String goodcode);
    // ��ǰ ���� ��ü ��� ����(�α��� ��)
    public Integer selectUserSchedule(@Param("sc_num") int sc_num, @Param("userId") String userId);    
    // �� ��ǰ ����
    public ScheduleVO selectShcedule(int num);
    // ����з��� ��ǰ ����Ʈ����
    public List<ProductVO> travelTypeList(String travelType);
    // ����ٱ��� �߰�
    public int insertBasket(BasketVO vo);
    // ����ٱ��� ���
    public int deleteBasket(BasketVO vo);
}
