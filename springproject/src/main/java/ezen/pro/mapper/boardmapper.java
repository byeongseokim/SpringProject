package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.boardVO;


public interface boardmapper {

	public void insertboard(boardVO board);
	
	public List<boardVO> readboard(long bno);
	
	public void deleteboard(long bno);
	
	public void updateboard(boardVO board);
	
	public List<boardVO> pagingboard();
}
