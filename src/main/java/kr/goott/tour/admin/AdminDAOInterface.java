package kr.goott.tour.admin;

import java.util.List;

import kr.goott.tour.board.BoardVO;

public interface AdminDAOInterface {
	public AdminVO login(AdminVO vo); //·Î±×ÀÎ
	public List<AdminVO> memCount();
	public List<AdminVO> selectMem();
	public int memUpdate(AdminVO vo);
}
