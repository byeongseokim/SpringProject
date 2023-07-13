package ezen.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.pro.domain.boardVO;
import ezen.pro.mapper.boardmapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class boardServiceImpl implements boardService {

	@Autowired
	boardmapper mapper;

	@Override
	public void boardregister(boardVO board) {
		
		 mapper.insertboard(board);
		 return;
	}

	@Override
	public void boardmodify(boardVO board) {
		
		mapper.updateboard(board);
		return;
	}

	@Override
	public void boardremove(long bno) {
		
		mapper.deleteboard(bno);
		return;

	}

	@Override
	public List<boardVO> boardread(long bno) {
		
		return mapper.readboard(bno);

	}

	@Override
	public List<boardVO> pagingboard() {
		
		return mapper.pagingboard();
	}

}
