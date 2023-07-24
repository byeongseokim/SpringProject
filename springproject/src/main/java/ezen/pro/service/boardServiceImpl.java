package ezen.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.pro.domain.boardVO;
import ezen.pro.domain.pageVO;
import ezen.pro.mapper.boardmapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class boardServiceImpl implements boardService {

	@Autowired
	boardmapper boardMapper;

    @Override
    public List<boardVO> pagingboard(pageVO vo) {
        return boardMapper.pagingboard(vo);
    }

    // 게시글 등록
    @Override
    public void boardRegister(boardVO board) {
        boardMapper.boardregister(board);
    }

    // 게시글 삭제
    @Override
    public void deleteBoard(int bno) {
        boardMapper.deleteBoard(bno);
    }

    // 게시글 상세 조회
    @Override
    public boardVO getBoardDetail(int bno) {
        return boardMapper.getboarddetail(bno);
    }
    
    //게시글수정
    @Override
    public void changeBoard(boardVO board) {
    	boardMapper.updateboard(board);
    }
    
    //게시글 총갯수
    @Override
    public int totboard(pageVO vo) {
    	return boardMapper.totboard(vo);
    }
    
    @Override
    public List<boardVO> selectwriter(String id) {
    
    	return boardMapper.selectwriter(id);
    }
}
