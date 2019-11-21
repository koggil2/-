package kr.goott.tour.product;

import java.util.List;

public interface ProductDAOInterface {

	// ´ñ±Û ¸ñ·Ï
    public List<ProductVO> productlist(String goodCode);
    // ´ñ±Û ÀÔ·Â
    public void create(ProductVO vo);
    // ´ñ±Û ¼öÁ¤
    public void update(ProductVO vo);
    // ´ñ±Û »èÁ¦
    public void delete(Integer rno);

	
	
}
