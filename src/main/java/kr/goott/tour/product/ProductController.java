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
	
	//여행상품 페이지로 이동
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
	
	//추천상품 페이지로 이동
	@RequestMapping("/product/product_recommendList")
	public ModelAndView product_recommendList(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		List<ProductVO> list1 = dao.travelTypeList("가족여행");
		if(list1!=null) {
			for(int i=0; i<list1.size(); i++) {
				String fname = dao.selectOneImage(list1.get(i).getGoodCode());
				list1.get(i).setFileName(fname);
			}
		}
		
		List<ProductVO> list2 = dao.travelTypeList("수학여행");
		if(list2!=null) {
			for(int i=0; i<list2.size(); i++) {
				String fname = dao.selectOneImage(list2.get(i).getGoodCode());
				list2.get(i).setFileName(fname);
			}
		}
		
		List<ProductVO> list3 = dao.travelTypeList("현장학습");
		if(list3!=null) {
			for(int i=0; i<list3.size(); i++) {
				String fname = dao.selectOneImage(list3.get(i).getGoodCode());
				list3.get(i).setFileName(fname);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);
		
		mav.setViewName("product/product_recommendList");
		
		return mav;
	}
	
	//여행 일정 페이지로 이동
	@RequestMapping("/product/product_view")
	public ModelAndView product_view(@RequestParam("goodCode") String goodCode,
									 HttpServletRequest req) {
//	  System.out.println(goodCode+","+userId);
	  String userId = (String)req.getSession().getAttribute("logid");
      
	  ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
      ProductVO vo = new ProductVO();
      vo = dao.selectRecord(goodCode);
      
      
      List<ScheduleVO> list = dao.selectAllSchedule(vo.getGoodCode());
      String scheduleDate = "";
      String y="", m="", d="";
      for(int i=0; i<list.size(); i++) {
    	  String sc = list.get(i).getStartDate();
    	  if(i==0) {
    		  y = sc.substring(0,4);
    		  m = sc.substring(5,7);
    		  d= sc.substring(8,10);
    		  scheduleDate = "\""+y+"\":{\""+m+"\":{\"" +Integer.parseInt(d)+"\":\"출발\"";    		  
    	  }else {
    		  if(!y.equals(sc.substring(0,4))) {
				  scheduleDate += "}} , \""+sc.substring(0,4)+"\":{\""+sc.substring(5,7)+"\":{\"" +Integer.parseInt(sc.substring(8,10))+"\":\"출발\"";
				  y = sc.substring(0,4);
				  m = sc.substring(5,7);
	    		  d= sc.substring(8,10);
    		  }else {
    			  if(!m.equals(sc.substring(5,7))) {
    				  scheduleDate += "} ,\""+sc.substring(5,7)+"\":{\"" +Integer.parseInt(sc.substring(8,10))+"\":\"출발\"";
    				  m = sc.substring(5,7);
    	    		  d = sc.substring(8,10);
    			  }else {
    				  if(!d.equals(sc.substring(8,10))){
    	    			  scheduleDate += ",\""+Integer.parseInt(sc.substring(8,10))+"\":\"출발\"";
    	    			  d=sc.substring(8,10);	  
    				  }
    				  
    			  }
    		  }
    	  }
    	  
      }
      scheduleDate += "}}";
      
      String fName = dao.selectOneImage(goodCode);
      String fileName = "/tour/imgUpload/"+fName;
      
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
      mav.addObject("scheduleDate", scheduleDate);
      mav.addObject("list", list);
      mav.addObject("vo", vo);
      mav.addObject("fileName", fileName);
      mav.setViewName("product/product_view");
      
      return mav;
	}
	
	
	//여행상품 상세페이지로 이동
	@RequestMapping("/product/product_detail")
	public ModelAndView product_detail(@RequestParam("goodCode") String goodCode,
								 	   @RequestParam("sc_num") int sc_num,
								 	   HttpServletRequest req) {
		//로그인 아이디
		String userId = (String)req.getSession().getAttribute("logid");
		
		//상품코드로 상품정보
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		ProductVO vo =  new ProductVO();
		vo = dao.selectRecord(goodCode);
		
		ModelAndView mav = new ModelAndView();
		if(userId !=null) {
			//여행바구니 선택여부
			int jang = dao.selectBasket(sc_num, userId);
			
			//관심선택여부
			int heart = dao.selectHeart(sc_num, userId);
			System.out.println(jang+","+heart);
			
			mav.addObject("jang", jang);
			mav.addObject("heart", heart);
		}
		
		System.out.println(vo.getGoodCode()+","+vo.getTravelType()+","+sc_num);
		
		ScheduleVO svo = new ScheduleVO();
		svo = dao.selectShcedule(sc_num);
		
		List<String> imgNames = dao.selectAllImage(goodCode);
		
		mav.addObject("sc", svo);
		mav.addObject("vo", vo);
		mav.addObject("imgNames", imgNames);
		mav.setViewName("product/product_detail");

		//일련번호로 일정정보

		return mav;
	}
	
	//상품관리 페이지로 이동
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
	
	//상품작성페이지 이동
	@RequestMapping("/product/product_writer")
	public ModelAndView product_write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/product_writer");
		
		return mav;
	}
	
	//여행바구니 추가
	@RequestMapping("/product/basketIn")
	@ResponseBody
	public int basketIn(BasketVO vo) {
//		System.out.println(vo.getUserId());	//로그인 아이디
//		System.out.println(vo.getGoodCode());	//상품코드
//		System.out.println(vo.getSc_num());	//일정번호
//		System.out.println(vo.getJang());		//여행바구니
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.insertBasket(vo);
		return cnt;
	}
	
	//여행바구니 삭제
	@RequestMapping("/product/basketOut")
	@ResponseBody
	public int basketOut(BasketVO vo) {
		System.out.println(vo.getUserId());	//로그인 아이디
		System.out.println(vo.getGoodCode());	//상품코드
		System.out.println(vo.getSc_num());	//일정번호
		System.out.println(vo.getJang());		//여행바구니
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.deleteBasket(vo);
		System.out.println(cnt);
		return cnt;
	}
	
	//관심 추가
	@RequestMapping("/product/heartIn")
	@ResponseBody
	public int heartIn(HeartVO vo) {
//		System.out.println(vo.getUserId());	//로그인 아이디
//		System.out.println(vo.getGoodCode());	//상품코드
//		System.out.println(vo.getSc_num());	//일정번호
//		System.out.println(vo.getJang());		//여행바구니
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.insertHeart(vo);
		return cnt;
	}
	
	//관심 삭제
	@RequestMapping("/product/heartOut")
	@ResponseBody
	public int heartOut(HeartVO vo) {
//		System.out.println(vo.getUserId());	//로그인 아이디
//		System.out.println(vo.getGoodCode());	//상품코드
//		System.out.println(vo.getSc_num());	//일정번호
//		System.out.println(vo.getJang());		//여행바구니
		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int cnt = dao.deleteHeart(vo);
		return cnt;
	}
	
	// 사진첨부
	@RequestMapping(value = "/product/imgUpload", method = RequestMethod.POST)
	@ResponseBody
	public String imgUpload(HttpServletRequest req) {
		String fileName = "";
		try {
		//파일의 절대경로
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
	
	//코드 중복검사
	@RequestMapping("/product/codeCheck")
	@ResponseBody
	public String codeCheck(@RequestParam("goodCode") String goodCode) {		
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		
		int result = dao.codeCheck(goodCode); //코드 중복검사
		
		if(result>0) return null; //코드가 중복일 경우
		return goodCode; //코드가 중복이 아닐경우
	}
	
	// 상품 작성
	@RequestMapping(value="/product/product_write", method=RequestMethod.POST)
	@ResponseBody
	public int product_write(ProductVO vo) {
		ProductDAOInterface dao = sqlSession.getMapper(ProductDAOInterface.class);
		String goodCode = vo.getGoodCode();
		System.out.println(goodCode);
		//상품등록
		int result = dao.insertProduct(vo);
		if(result>0) {
			//일정등록
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
