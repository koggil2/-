package kr.goott.tour.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	//��Ʈ���� �������� �̵�
	@RequestMapping("/product/product_list")
	public String product_list() {
		return "product/product_list";
	}
}
