package kr.goott.tour.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
 
import kr.goott.tour.reply.ReplyVO;
 
//@Repository("kr.goott.tour.mapper.CommentMapper")
public interface CommentMapper {
    // ´ñ±Û °³¼ö
    public int commentCount() throws Exception;
 
    // ´ñ±Û ¸ñ·Ï
    public List<ReplyVO> commentList(int sc_num) throws Exception;
 
    // ´ñ±Û ÀÛ¼º
    public int commentInsert(ReplyVO comment) throws Exception;
    
    // ´ñ±Û ¼öÁ¤
    public int commentUpdate(ReplyVO comment) throws Exception;
 
    // ´ñ±Û »èÁ¦
    public int commentDelete(int num) throws Exception;
 
}