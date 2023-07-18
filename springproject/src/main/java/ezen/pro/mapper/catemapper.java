package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.cateVO;

public interface catemapper {

	
	public void insertcate(cateVO vo);
	public void deletecate(cateVO vo);
	public List<cateVO> selectcate();

}
