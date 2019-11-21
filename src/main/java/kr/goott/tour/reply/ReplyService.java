package kr.goott.tour.reply;

import java.util.List;

public interface ReplyService {

    // ´ñ±Û ¸ñ·Ï
    public List<ReplyVO> list(String goodCode);
    // ´ñ±Û ÀÔ·Â
    public void create(ReplyVO vo);
    // ´ñ±Û ¼öÁ¤
    public void update(ReplyVO vo);
    // ´ñ±Û »èÁ¦
    public void delete(int num);
	
}
