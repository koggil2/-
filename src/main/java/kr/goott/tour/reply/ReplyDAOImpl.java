package kr.goott.tour.reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
    SqlSession sqlSession;
    
    // ´ñ±Û ¸ñ·Ï
    @Override
    public List<ReplyVO> list(String goodCode) {
        return sqlSession.selectList("reply.listReply", goodCode);
    }
    // ´ñ±Û ÀÛ¼º
    @Override
    public void create(ReplyVO vo) {
        sqlSession.insert("reply.insertReply", vo);
    }
    // ´ñ±Û ¼öÁ¤
    @Override
    public void update(ReplyVO vo) {
        // TODO Auto-generated method stub
 
    }
    // ´ñ±Û »èÁ¦
    @Override
    public void delete(int num) {
        // TODO Auto-generated method stub
 
    }

}
