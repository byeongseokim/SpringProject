package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.userVO;

public interface usermapper {
	
	public int insertuser();
	
	public List<userVO> selectuser();
	
	public int deleteuser();
	
	public int updategrade();
	

}
