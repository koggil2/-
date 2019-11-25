package kr.goott.tour.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		mav.setViewName("board/"+commuPage);
	
		return mav;
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("/board/write")
	public ModelAndView board_writeForm(@RequestParam("commuPage") String commuPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("commuPage", commuPage);
		mav.setViewName("board/writeForm");
		return mav;
	}
	
	@RequestMapping(value="/board/writeOk", method=RequestMethod.POST)
	public ModelAndView writeOk(BoardVO vo, HttpServletRequest req) {
		BoardDAOInterface dao =sqlSession.getMapper(BoardDAOInterface.class);
	    
		int cnt = dao.boardInsert(vo);
	    
		ModelAndView mav = new ModelAndView();
		      
		if(cnt>0) {
			mav.addObject("commuPage", vo.getCommuPage());
			mav.setViewName("redirect:list");
		}else {
			mav.setViewName("redirect:writeForm");        
		}
		return mav;
	}
	
	//글내용으로 이동
	@RequestMapping("/board/post")
	   public ModelAndView view(BoardVO vo) {
	      
	      BoardDAOInterface dao = sqlSession.getMapper(BoardDAOInterface.class);
	      BoardVO vo2 = dao.selectRecord(vo.getNum());
	      
	      ModelAndView mav = new ModelAndView();
	      
	      mav.addObject("vo", vo2);
	      mav.setViewName("board/post");
	      
	      return mav;
	}
	
	//글수정 폼으로 이동
	@RequestMapping("/board/edit")
	public ModelAndView board_eidtForm(@RequestParam("num") int num) {
		BoardDAOInterface dao= sqlSession.getMapper(BoardDAOInterface.class);
		   
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", dao.selectRecord(num));
		mav.setViewName("board/editForm");
	   
	   return mav;
	}
	
   //글수정
   @RequestMapping(value="/board/editOk", method=RequestMethod.POST)
   public ModelAndView boardEditOk(BoardVO vo) {
	  BoardDAOInterface dao = sqlSession.getMapper(BoardDAOInterface.class);
	  int cnt = dao.boardUpdate(vo);
	  ModelAndView mav = new ModelAndView();
	  mav.addObject("num", vo.getNum());
	  
	  if(cnt>0) { //업데이트시 글내용보기
		  mav.addObject("vo", vo);
		  mav.setViewName("redirect:post");
	  }else { //업데이트 실패시 글수정
		  mav.setViewName("redirect:edit");
	  }
	  return mav;
   }
   
   @RequestMapping("/board/delOk")
   public ModelAndView boardDelOk(HttpServletRequest request) {
	   BoardDAOInterface dao = sqlSession.getMapper(BoardDAOInterface.class);
	   BoardVO vo = new BoardVO();
	   vo.setNum(Integer.parseInt(request.getParameter("num")));
	   vo.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
	   vo.setCommuPage(request.getParameter("commuPage"));
	   int cnt = dao.boardDelete(vo.getNum());
		
	   ModelAndView mav = new ModelAndView();
	   mav.addObject("vo", vo);
	   mav.addObject("cnt", cnt);
	   mav.setViewName("board/delOk");
	   return mav;
   }
}
