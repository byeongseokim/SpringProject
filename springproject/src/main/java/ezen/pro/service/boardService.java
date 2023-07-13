package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.boardVO;

public interface boardService {
	
	public void boardregister(boardVO board);

	public void boardmodify(boardVO board);
	
	public void boardremove(long bno);
	
	public List<boardVO> boardread(long bno);
	
	public List<boardVO> pagingboard();
}
