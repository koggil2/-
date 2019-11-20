package kr.goott.tour.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	
	//게시판 이동
	@GetMapping(value="/board/list")
	public ModelAndView getList(@RequestParam("commuPage") String commuPage,
								HttpServletRequest request) {
	
		//현재페이지 
		String pageNumStr = request.getParameter("pageNum");
		BoardVO vo = new BoardVO();
		if(pageNumStr!=null && !pageNumStr.equals("")) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		BoardDAOInterface dao = sqlSession.getMapper(BoardDAOInterface.class);
		
		//페이지구분
		vo.setCommuPage(commuPage);
//		System.out.println(vo.getCommuPage());
		//서치키랑 서치워드
		String searchKey = request.getParameter("searchKey");
		String searchWord = request.getParameter("searchWord");
		
		//총 레코드 수
		
		vo.setTotalRecord(dao.boardTotalRecord(vo.getCommuPage()));
//		System.out.println("totalRecord="+vo.getTotalRecord());
		//vo.setTotalRecord(1);
		//총 페이지 수
		if(vo.getTotalRecord() % vo.getOnePageRecord()==0) {
			vo.setTotalPage(vo.getTotalRecord()/vo.getOnePageRecord());
		}else {
			vo.setTotalPage(vo.getTotalRecord()/vo.getOnePageRecord()+1);
		}
		
		//페이지 번호의 시작페이지 계산
		vo.setStartPage((vo.getPageNum()-1)/vo.getOnePageMax()*vo.getOnePageMax()+1);
//		System.out.println("111111111");
		//해당페이지 레코드 선택
		List<BoardVO> lst = dao.getAllRecord(vo);
//		System.out.println("2222222");
		
		//뷰페이지로 가져갈 데이터
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("lst", lst);
		mav.setViewName("/board/"+commuPage);
	
		if(vo.getCommuPage()=="travelQ"||vo.getCommuPage().equals("travelQ")) {commuPage = "InfoCenter.jsp";}
		
		return mav;
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("/board/write")
	public String board_writeForm() {
		return "board/writeForm";
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("/board/post")
	public String board_post() {
		return "board/post";
	}
}
