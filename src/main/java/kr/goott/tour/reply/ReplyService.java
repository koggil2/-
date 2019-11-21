package kr.goott.tour.reply;

import java.util.List;

public interface ReplyService {

    // ��� ���
    public List<ReplyVO> list(String goodCode);
    // ��� �Է�
    public void create(ReplyVO vo);
    // ��� ����
    public void update(ReplyVO vo);
    // ��� ����
    public void delete(int num);
	
}
