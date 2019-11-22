package kr.goott.tour.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	//�����ǰ �������� �̵�
	@RequestMapping("/product/product_list")
	public ModelAndView product_list(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		List<ProductVO> list = dao.getAllRecord(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("product/product_list");
		
		return mav;
	}
	
	
	
	//��õ��ǰ �������� �̵�
	@RequestMapping("/product/product_recommendList")
	public String product_recommendList() {
		return "product/product_recommendList";
	}
	
	//���� ���� �������� �̵�
	@RequestMapping("/product/product_view")
	public ModelAndView product_view(@RequestParam("goodCode") String goodCode) {  
      ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
      ProductVO vo = new ProductVO();
      vo = dao.selectRecord(goodCode);
      
      List<ScheduleVO> list = dao.selectAllSchedule(vo.getGoodCode());
      
      ModelAndView mav = new ModelAndView();
   
      mav.addObject("list", list);
      mav.addObject("vo", vo);
      mav.setViewName("product/product_view");
      
      return mav;
	}
	
	//�����ǰ ���������� �̵�
	@RequestMapping("/product/product_detail")
	public String product_detail(@RequestParam("goodCode") String goodCode,
								 @RequestParam("num") int num) {
		//��ǰ�ڵ�� ��ǰ����
		
		//�Ϸù�ȣ�� ��������
		
		return "product/product_detail";
	}
	
	//��ǰ���� �������� �̵�
	@RequestMapping("/product/management")
	public String product_management() {
		return "product/management";
	}

}
