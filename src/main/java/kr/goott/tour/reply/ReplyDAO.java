package kr.goott.tour.reply;

import java.util.List;

public interface ReplyDAO {

    // ��� ���
    public List<ReplyVO> list(String goodCode);
    // ��� �Է�
    public void create(ReplyVO rvo);
    // ��� ����
    public void update(ReplyVO rvo);
    // ��� ����
    public void delete(int num);
}
