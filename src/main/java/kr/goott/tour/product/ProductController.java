package kr.goott.tour.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.tour.register.RegisterVO;


@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	//�����ǰ �������� �̵�
	@RequestMapping("/product/product_list")
	public ModelAndView product_list(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		List<ProductVO> list = dao.getAllRecord(vo);
		
		ProductVO vo2 = list.get(0);
		
		System.out.println(vo2.getGoodCode()+","+vo2.getTravelType());
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("product/product_list");
		
		return mav;
	}
	
	//��õ��ǰ �������� �̵�
	@RequestMapping("/product/product_recommendList")
	public ModelAndView product_recommendList(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		List<ProductVO> list1 = dao.travelTypeList("��������");
		List<ProductVO> list2 = dao.travelTypeList("���п���");
		List<ProductVO> list3 = dao.travelTypeList("�����н�");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);
		
		mav.setViewName("product/product_recommendList");
		
		return mav;
	}
	
	//���� ���� �������� �̵�
	@RequestMapping("/product/product_view")
	public ModelAndView product_view(@RequestParam("goodCode") String goodCode,
									 @RequestParam("userId") String userId) {  
      ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
      ProductVO pvo = new ProductVO();
      pvo = dao.selectRecord(goodCode);
      
      BasketVO bvo = new BasketVO();
      bvo.setUserId(userId);
      
      List<ScheduleVO> list = dao.selectAllSchedule(pvo.getGoodCode(), bvo.getUserId());
      
      
      
      ModelAndView mav = new ModelAndView();
   
      mav.addObject("list", list);
      mav.addObject("pvo", pvo);
      mav.addObject("bvo", bvo);
      mav.setViewName("product/product_view");
      
      return mav;
	}
	
	
	//�����ǰ ���������� �̵�
	@RequestMapping("/product/product_detail")
	public ModelAndView product_detail(@RequestParam("goodCode") String goodCode,
								 @RequestParam("sc_num") int sc_num) {
		//��ǰ�ڵ�� ��ǰ����
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		ProductVO vo =  new ProductVO();
		vo = dao.selectRecord(goodCode);
		
		System.out.println(vo.getGoodCode()+","+vo.getTravelType()+","+sc_num);
		
		ScheduleVO svo = new ScheduleVO();
		svo = dao.selectShcedule(sc_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sc", svo);
		mav.addObject("vo", vo);
		mav.setViewName("product/product_detail");

		//�Ϸù�ȣ�� ��������

		return mav;
	}
	
	//��ǰ���� �������� �̵�
	@RequestMapping("/product/management")
	public ModelAndView product_management(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		List<ProductVO> list = dao.getAllRecord(vo);
		
		ProductVO vo2 = list.get(0);
		
		System.out.println(vo2.getGoodCode()+","+vo2.getTravelType());
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("product/management");
		
		return mav;
	}
	
	//��ǰ�ۼ������� �̵�
	@RequestMapping("/product/product_writer")
	public ModelAndView product_write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/product_writer");
		
		return mav;
	}
	
	//����ٱ��� �߰�
	@RequestMapping("/product/basketIn")
	@ResponseBody
	public int basketIn(BasketVO vo) {
		System.out.println(vo.getUserId());	//�α��� ���̵�
		System.out.println(vo.getGoodCode());	//��ǰ�ڵ�
		System.out.println(vo.getSc_num());	//������ȣ
		System.out.println(vo.getJang());		//����ٱ���
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.insertBasket(vo);
		return cnt;
	}
	
	//����ٱ��� �߰�
	@RequestMapping("/product/basketOut")
	@ResponseBody
	public int basketOut(BasketVO vo) {
		System.out.println(vo.getUserId());	//�α��� ���̵�
		System.out.println(vo.getGoodCode());	//��ǰ�ڵ�
		System.out.println(vo.getSc_num());	//������ȣ
		System.out.println(vo.getJang());		//����ٱ���
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.deleteBasket(vo);
		return cnt;
	}
}
