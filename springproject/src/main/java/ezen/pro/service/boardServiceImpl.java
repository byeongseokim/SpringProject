package ezen.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.pro.domain.boardVO;
import ezen.pro.mapper.boardmapper;

@Service
public class boardServiceImpl implements boardService {

    private final boardmapper boardMapper;

    @Autowired
    public boardServiceImpl(boardmapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    // 모든 게시글 가져오기
    @Override
    public List<boardVO> getAllBoard() {
        return boardMapper.getAllBoard();
    }

    // 게시글 등록
    @Override
    public void boardRegister(boardVO board) {
        boardMapper.boardRegister(board);
    }

    // 게시글 삭제
    @Override
    public void deleteBoard(int bno) {
        boardMapper.deleteBoard(bno);
    }

    // 게시글 상세 조회
    @Override
    public boardVO getBoardDetail(int bno) {
        return boardMapper.getBoardDetail(bno);
    }
}
