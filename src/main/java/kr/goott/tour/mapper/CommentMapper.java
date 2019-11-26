package kr.goott.tour.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
 
import kr.goott.tour.reply.ReplyVO;
 
//@Repository("kr.goott.tour.mapper.CommentMapper")
public interface CommentMapper {
    // ��� ����
    public int commentCount() throws Exception;
 
    // ��� ���
    public List<ReplyVO> commentList(int sc_num) throws Exception;
 
    // ��� �ۼ�
    public int commentInsert(ReplyVO comment) throws Exception;
    
    // ��� ����
    public int commentUpdate(ReplyVO comment) throws Exception;
 
    // ��� ����
    public int commentDelete(int num) throws Exception;
 
}