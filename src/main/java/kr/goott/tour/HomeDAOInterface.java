package kr.goott.tour;

import java.util.List;

import kr.goott.tour.product.ProductVO;

public interface HomeDAOInterface {
	//��ǰ����Ʈ �ҷ�����
	public List<ProductVO> select_list();
	//�˻�����Ʈ �ҷ�����
	public List<ProductVO> search_list(String searchWord);
}
