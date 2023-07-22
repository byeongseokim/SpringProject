package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.replyVO;

public interface replymapper {

	public List<replyVO> selectreply(int bno);
	public void updatereply(replyVO vo);
	public void insertreply(replyVO vo);
	public void deletereply(int rno);
}
