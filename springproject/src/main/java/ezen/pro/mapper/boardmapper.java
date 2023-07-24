package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.boardVO;
import ezen.pro.domain.pageVO;


public interface boardmapper {

	// 게시글 등록
	public void boardregister(boardVO board);
	
	// 게시글 상세 정보 조회
	public boardVO getboarddetail(int bno);
	
	// 게시글 수정
	public void updateboard(boardVO board);
	
	// 게시글 삭제
	public void deleteBoard(int bno);
	
	// 페이징 리스트 조회
	public List<boardVO> pagingboard(pageVO vo);
	
	public int totboard(pageVO vo);
	
	public List<boardVO> selectwriter(String id);
}
