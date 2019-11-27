package kr.goott.tour.reply;

import java.util.List;

import org.springframework.stereotype.Repository;
 
//@Repository("kr.goott.tour.mapper.CommentMapper")
public interface ReplyDAOInterface {
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