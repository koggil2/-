package kr.goott.tour.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	//여행상품 페이지로 이동
	@RequestMapping("/product/product_list")
	public String product_list() {
		return "product/product_list";
	}
	
	//여행페이지로 이동
	@RequestMapping("/product/product_view")
	public String product_view() {
		return "product/product_view";
	}
	
	//여행상품 상세페이지로 이동
	@RequestMapping("/product/product_detail")
	public String product_detail() {
		return "product/product_detail";
	}
	
	//여행바구니 페이지로 이동
	@RequestMapping("/product/basket")
	public String product_basket() {
		return "product/basket";
	}
}
