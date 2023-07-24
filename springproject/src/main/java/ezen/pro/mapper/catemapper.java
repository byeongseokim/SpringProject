package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.cateVO;

public interface catemapper {

	
	public void insertcate(String cate);
	public void deletecate(String cate);
	public List<cateVO> selectcate();

}
