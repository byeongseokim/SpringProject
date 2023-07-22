package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.replyVO;

public interface replyService {

	
	public void insertreply(replyVO vo);
	
	public List<replyVO> selectreply(int bno);
	
	public void deletereply(int rno);
	
	public void updatereply(replyVO vo);
}
