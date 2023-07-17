package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.boardVO;


public interface boardmapper {

	// 게시글 등록
	public void boardRegister(boardVO board);
	
	// 게시글 상세 정보 조회
	public boardVO getBoardDetail(int bno);
	
	// 게시글 수정
	public void updateBoard(boardVO board);
	
	// 게시글 삭제
	public void deleteBoard(int bno);
	
	// 전체 게시글 목록 조회
	public List<boardVO> getAllBoard();
	
	// 페이징 처리된 게시글 목록 조회
	public List<boardVO> getPagingBoard(int offset, int limit);
}
