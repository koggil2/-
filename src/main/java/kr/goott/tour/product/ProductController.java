package kr.goott.tour.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	//구트여행 페이지로 이동
	@RequestMapping("/product/product_list")
	public String product_list() {
		return "product/product_list";
	}
}
