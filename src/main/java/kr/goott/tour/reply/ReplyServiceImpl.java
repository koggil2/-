package kr.goott.tour.reply;

import java.util.List;

import javax.inject.Inject;

public class ReplyServiceImpl implements ReplyService {

	 @Inject
	  ReplyDAO replyDao;
	
	
	@Override
	public List<ReplyVO> list(String goodCode) {
		// TODO Auto-generated method stub
		return replyDao.list(goodCode);
	}

	@Override
	public void create(ReplyVO vo) {
		
		replyDao.create(vo);
		
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}



}
