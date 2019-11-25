package kr.goott.tour.reply;

import java.util.List;

public interface ReplyDAO {

    // ´ñ±Û ¸ñ·Ï
    public List<ReplyVO> list(String goodCode);
    // ´ñ±Û ÀÔ·Â
    public void create(ReplyVO rvo);
    // ´ñ±Û ¼öÁ¤
    public void update(ReplyVO rvo);
    // ´ñ±Û »èÁ¦
    public void delete(int num);
}
