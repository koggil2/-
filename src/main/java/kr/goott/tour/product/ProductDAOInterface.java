package kr.goott.tour.product;

import java.util.List;

public interface ProductDAOInterface {
	// �����ǰ ��ü���
	public List<ProductVO> getAllRecord(ProductVO vo);	
    // �����ǰ �Է�
    public void create(ProductVO vo);
    // �����ǰ ����
    public void update(ProductVO vo);
    // �����ǰ  ����
    public void delete(Integer rno);
    // �����ǰ ����
    public ProductVO selectRecord(String goodcode);
    // ��ǰ ���� ����
    public List<ScheduleVO> selectSchedule(String goodcode);

}
