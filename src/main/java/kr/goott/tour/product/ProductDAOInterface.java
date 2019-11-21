package kr.goott.tour.product;

import java.util.List;

public interface ProductDAOInterface {

	// ��� ���
    public List<ProductVO> productlist(String goodCode);
    // ��� �Է�
    public void create(ProductVO vo);
    // ��� ����
    public void update(ProductVO vo);
    // ��� ����
    public void delete(Integer rno);

	
	
}
