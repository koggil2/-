package kr.goott.tour.reply;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import kr.goott.tour.reply.ReplyVO;
import kr.goott.tour.mapper.CommentMapper;


@Controller
public class ReplyController{

	@Autowired
	SqlSession sqlSession;
    
    @RequestMapping(value="/product/reply/list", method=RequestMethod.POST) //¥Ò±€ ∏ÆΩ∫∆Æ
    @ResponseBody
    public List<ReplyVO> replyServiceList(@RequestParam("sc_num") int sc_num) throws Exception{
    	CommentMapper commentDAO = sqlSession.getMapper(CommentMapper.class);   
        return commentDAO.commentList(sc_num);
    }
    
    @RequestMapping(value="/product/reply/insert", method=RequestMethod.POST) //¥Ò±€ ¿€º∫ 
    @ResponseBody
    public int replyServiceInsert(ReplyVO comment, HttpServletRequest req) throws Exception{
    	CommentMapper commentDAO = sqlSession.getMapper(CommentMapper.class);  
        
    	
    	HttpSession sess =req.getSession();
    	System.out.println((String)sess.getAttribute("logid"));
        comment.setUserId((String)sess.getAttribute("logid"));  
        
        return commentDAO.commentInsert(comment);
    }
    
    @RequestMapping("/product/reply/update") //¥Ò±€ ºˆ¡§  
    @ResponseBody
    public int replyServiceUpdateProc(@RequestParam int num, @RequestParam String content) throws Exception{
    	CommentMapper commentDAO = sqlSession.getMapper(CommentMapper.class); 
        ReplyVO comment = new ReplyVO();
        comment.setNum(num);
        comment.setContent(content);
        
        return commentDAO.commentUpdate(comment);
    }
    
    @RequestMapping("/product/reply/delete/{num}") //¥Ò±€ ªË¡¶  
    @ResponseBody
    public int replyServiceDelete(@PathVariable int num) throws Exception{
    	CommentMapper commentDAO = sqlSession.getMapper(CommentMapper.class); 
        return commentDAO.commentDelete(num);
    }
    
}
