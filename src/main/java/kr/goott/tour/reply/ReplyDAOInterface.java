package kr.goott.tour.reply;

import java.util.List;

import org.springframework.stereotype.Repository;
 
//@Repository("kr.goott.tour.mapper.CommentMapper")
public interface ReplyDAOInterface {
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