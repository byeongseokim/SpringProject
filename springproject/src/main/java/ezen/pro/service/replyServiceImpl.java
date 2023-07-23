package ezen.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.pro.domain.replyVO;
import ezen.pro.mapper.replymapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class replyServiceImpl implements replyService {

	@Autowired
	replymapper replymapper;

	@Override
	public void deletereply(int rno) {
		replymapper.deletereply(rno);
	}

	@Override
	public void insertreply(replyVO vo) {
		replymapper.insertreply(vo);
	}

	@Override
	public List<replyVO> selectreply(int bno) {
		return replymapper.selectreply(bno);
	}

	@Override
	public void updatereply(replyVO vo) {

		replymapper.updatereply(vo);
	}

}
