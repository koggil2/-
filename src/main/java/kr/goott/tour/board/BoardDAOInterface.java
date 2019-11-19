package kr.goott.tour.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

interface BoardDAOInterface {
	//���					����������, ���������� ����� ���ڵ� ��, 
	public List<BoardVO> getAllRecord(BoardVO vo);
	//�۾���
	public int boardInsert(BoardVO vo);
	//����
	public int boardUpdate(BoardVO vo);
	//����
	public int boardDelete(int num);
	//��ȸ��
	public void boardHit(int num);
	//�ѷ��ڵ��
	public int boardTotalRecord(String commuPage);
	//���ڵ� ����
	public void boardSelect(BoardVO vo, boolean a);
}
