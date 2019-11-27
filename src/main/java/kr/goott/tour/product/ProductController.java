package kr.goott.tour.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class ProductController {
	public String path = null;
	@Autowired
	SqlSession sqlSession;
	
	//�����ǰ �������� �̵�
	@RequestMapping("/product/product_list")
	public ModelAndView product_list(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		List<ProductVO> list = dao.getAllRecord(vo);
		
//		ProductVO vo2 = list.get(0);
//		System.out.println(vo2.getGoodCode()+","+vo2.getTravelType());
				
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
									 HttpServletRequest req) {
//	  System.out.println(goodCode+","+userId);
	  String userId = (String)req.getSession().getAttribute("logid");
      
	  ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
      ProductVO vo = new ProductVO();
      vo = dao.selectRecord(goodCode);
      
      List<ScheduleVO> list = dao.selectAllSchedule(vo.getGoodCode());
      ModelAndView mav = new ModelAndView();
      
      if(userId != null) {  
    	  List<Integer> list2 = new ArrayList<Integer>();
    	for (int j = 0; j < list.size(); j++) {
//    		System.out.println(list.get(j).getSc_num());
    		list2.add(dao.selectUserSchedule(list.get(j).getSc_num(), userId));
//    		System.out.println(dao.selectUserSchedule(list.get(j).getSc_num(), userId));
		}
    	 mav.addObject("list2", list2);
      }
      
      mav.addObject("list", list);
      mav.addObject("vo", vo);
      mav.setViewName("product/product_view");
      
      return mav;
	}
	
	
	//�����ǰ ���������� �̵�
	@RequestMapping("/product/product_detail")
	public ModelAndView product_detail(@RequestParam("goodCode") String goodCode,
								 	   @RequestParam("sc_num") int sc_num,
								 	   HttpServletRequest req) {
		//�α��� ���̵�
		String userId = (String)req.getSession().getAttribute("logid");
		
		//��ǰ�ڵ�� ��ǰ����
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		ProductVO vo =  new ProductVO();
		vo = dao.selectRecord(goodCode);
		
		ModelAndView mav = new ModelAndView();
		if(userId !=null) {
			//����ٱ��� ���ÿ���
			int jang = dao.selectBasket(sc_num, userId);
			
			//���ɼ��ÿ���
			int heart = dao.selectHeart(sc_num, userId);
			System.out.println(jang+","+heart);
			
			mav.addObject("jang", jang);
			mav.addObject("heart", heart);
		}
		
		System.out.println(vo.getGoodCode()+","+vo.getTravelType()+","+sc_num);
		
		ScheduleVO svo = new ScheduleVO();
		svo = dao.selectShcedule(sc_num);
		
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
		
//		ProductVO vo2 = list.get(0);
//		System.out.println(vo2.getGoodCode()+","+vo2.getTravelType());
		
		
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
//		System.out.println(vo.getUserId());	//�α��� ���̵�
//		System.out.println(vo.getGoodCode());	//��ǰ�ڵ�
//		System.out.println(vo.getSc_num());	//������ȣ
//		System.out.println(vo.getJang());		//����ٱ���
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.insertBasket(vo);
		return cnt;
	}
	
	//����ٱ��� ����
	@RequestMapping("/product/basketOut")
	@ResponseBody
	public int basketOut(BasketVO vo) {
//		System.out.println(vo.getUserId());	//�α��� ���̵�
//		System.out.println(vo.getGoodCode());	//��ǰ�ڵ�
//		System.out.println(vo.getSc_num());	//������ȣ
//		System.out.println(vo.getJang());		//����ٱ���
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.deleteBasket(vo);
		return cnt;
	}
	
	//���� �߰�
	@RequestMapping("/product/heartIn")
	@ResponseBody
	public int heartIn(HeartVO vo) {
//		System.out.println(vo.getUserId());	//�α��� ���̵�
//		System.out.println(vo.getGoodCode());	//��ǰ�ڵ�
//		System.out.println(vo.getSc_num());	//������ȣ
//		System.out.println(vo.getJang());		//����ٱ���
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.insertHeart(vo);
		return cnt;
	}
	
	//���� ����
	@RequestMapping("/product/heartOut")
	@ResponseBody
	public int heartOut(HeartVO vo) {
//		System.out.println(vo.getUserId());	//�α��� ���̵�
//		System.out.println(vo.getGoodCode());	//��ǰ�ڵ�
//		System.out.println(vo.getSc_num());	//������ȣ
//		System.out.println(vo.getJang());		//����ٱ���
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.deleteHeart(vo);
		return cnt;
	}
	
	// ����÷��
	@RequestMapping(value = "/product/imgUpload", method = RequestMethod.POST)
	@ResponseBody
	public String imgUpload(HttpServletRequest req) {
		String fileName = "";
		try {
		//������ ������
		path = req.getSession().getServletContext().getRealPath("/imgUpload");
		
		MultipartRequest multi = new MultipartRequest(req, path, 5 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String goodCode = multi.getParameter("goodCodeCopy");
		fileName = multi.getFilesystemName("fileName");

		ImgUploadVO vo = new ImgUploadVO();
		vo.setGoodCode(goodCode);
		vo.setFileName(fileName);
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.insertImg(vo);
		 	
		if(cnt<0) fileName= null;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	//�ڵ� �ߺ��˻�
	@RequestMapping("/product/codeCheck")
	@ResponseBody
	public String codeCheck(@RequestParam("goodCode") String goodCode) {		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int result = dao.codeCheck(goodCode); //�ڵ� �ߺ��˻�
		
		if(result>0) return null; //�ڵ尡 �ߺ��� ���
		return goodCode; //�ڵ尡 �ߺ��� �ƴҰ��
	}
	
	// ��ǰ �ۼ�
	@RequestMapping(value="/product/product_write", method=RequestMethod.POST)
	@ResponseBody
	public int product_write(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		String goodCode = vo.getGoodCode();
		System.out.println(goodCode);
		//��ǰ���
		int result = dao.insertProduct(vo);
		if(result>0) {
			//�������
			String startDate = vo.getStartDate();
			String backDate = vo.getBackDate();
			
			String startD[] = startDate.split("Startv");
			String backD[] = backDate.split("Backy");
			System.out.println(startD.length);
			result = 0;
			for(int i=1; i<startD.length; i++) {
				startDate = startD[i];
				backDate = backD[i];
				System.out.println(startDate);
				int r = dao.insertSchedule(goodCode, startDate, backDate);
				result += r;
			}
		}else {
			result = 0;
		}
		
		return result;
	}
}
