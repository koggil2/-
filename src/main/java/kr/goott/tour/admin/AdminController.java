package kr.goott.tour.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Autowired
	SqlSession sqlSession;
	
	//������ �α��� ��
	@RequestMapping("/admin")
	public String admin_login() {
		return "admin/admin_login";
	}

}
