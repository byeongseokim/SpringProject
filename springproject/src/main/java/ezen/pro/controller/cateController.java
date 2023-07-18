package ezen.pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import ezen.pro.domain.cateVO;
import ezen.pro.service.cateServiceImpl;

@RestController

public class cateController {

	@Autowired
	private cateServiceImpl cateServiceImpl;
	
	@PostMapping("cateadd.do")
	public List<cateVO> add(cateVO vo) {
	cateServiceImpl.addcate(vo);
	
	return cateServiceImpl.readcate();
	}
	
	@PostMapping("dropcate.do")
	public List<cateVO> drop(cateVO vo) {
		cateServiceImpl.dropcate(vo);
		
		return cateServiceImpl.readcate();
	}
}
