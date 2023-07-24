package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.cateVO;

public interface cateService {

	
	public List<cateVO> readcate();
	
	public void addcate(String cate);
	
	public void dropcate(String cate);
}
