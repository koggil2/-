package kr.goott.tour;

import java.util.List;

import kr.goott.tour.product.ProductVO;

public interface HomeDAOInterface {
	//상품리스트 불러오기
	public List<ProductVO> select_list();
	//검색리스트 불러오기
	public List<ProductVO> search_list(String searchWord);
	// view 이미지 한장 불러오기
    public String selectOneImage(String goodCode);
}
