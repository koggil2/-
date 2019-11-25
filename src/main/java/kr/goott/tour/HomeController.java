package kr.goott.tour;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.goott.tour.product.ProductVO;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		HomeDAOInterface dao = sqlSession.getMapper(HomeDAOInterface.class);
		
		List<ProductVO> list = dao.select_list();
		
		model.addAttribute("list", list);
		
		return "home";
	}
	
	//회사소개
	@RequestMapping("/companyInfo/companyInfo")
	public String companyInfo() {
		
		return "companyInfo/companyInfo";
	}
	
	//표준약관 ｜취급방침 ｜이용약관
	@RequestMapping("/companyInfo/clauseInfo")
	public String clauseInfo(@RequestParam("cip") int cip) {
		System.out.println(cip);
		return "companyInfo/clauseInfo";
	}
}
