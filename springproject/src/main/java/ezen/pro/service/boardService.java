package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.boardVO;
import ezen.pro.domain.pageVO;

public interface boardService {
	
    List<boardVO> pagingboard(pageVO vo);  // 페이징 게시글 목록 조회

    void boardRegister(boardVO board);  // 게시글 등록

    void deleteBoard(int bno);  // 게시글 삭제

    boardVO getBoardDetail(int bno);  // 게시글 상세 조회
    
    public void changeBoard(boardVO board); //게시글 업데이트
    
    public int totboard(pageVO vo);
}
