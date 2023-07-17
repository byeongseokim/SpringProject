package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.boardVO;

public interface boardService {

    List<boardVO> getAllBoard();  // 전체 게시글 목록 조회

    void boardRegister(boardVO board);  // 게시글 등록

    void deleteBoard(int bno);  // 게시글 삭제

    boardVO getBoardDetail(int bno);  // 게시글 상세 조회
}
