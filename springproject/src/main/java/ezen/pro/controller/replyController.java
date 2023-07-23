package ezen.pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ezen.pro.domain.replyVO;
import ezen.pro.service.replyServiceImpl;

@RestController
@RequestMapping("/reply")
public class replyController {

	@Autowired
	replyServiceImpl impl;

	@PostMapping("/addreply.do")
	public List<replyVO> createreply(@RequestBody replyVO vo) {
		System.out.println(vo.getRcon());
		System.out.println(vo.getRwriter());
		System.out.println(vo.getBno());
		impl.insertreply(vo);
		return	impl.selectreply(vo.getBno());	
	}

	@DeleteMapping("/removereply.do/{rno}")
	public List<replyVO> deletereply(@PathVariable("rno") int rno,@RequestBody replyVO vo) {
		impl.deletereply(rno);
		return	impl.selectreply(vo.getBno());
	}

	@PutMapping("/modifyreply.do")
	public List<replyVO> updatereply(@RequestBody replyVO vo) {
		impl.updatereply(vo);
	return	impl.selectreply(vo.getBno());
	}
}
