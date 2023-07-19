package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.cateVO;

public interface cateService {

	
	public List<cateVO> readcate();
	
	public void addcate(cateVO vo);
	
	public void dropcate(cateVO vo);
}
