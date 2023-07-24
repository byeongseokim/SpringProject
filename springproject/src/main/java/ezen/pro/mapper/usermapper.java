package ezen.pro.mapper;

import java.util.List;

import ezen.pro.domain.userVO;

public interface usermapper {
	
	public int insertuser(userVO vo);
	
	public userVO selectuser(String id);
	
	public int deleteuser(String id);
	
	public int updategrade(String id);
	
	public int selectgrade(String id);
	
	public int selectcheckid(String id);
	
	public String selectid(userVO vo);
	
	public int selectpw(userVO vo);
	
	public List<userVO> selectalluser();
	
	public void updategrade(userVO vo);
	
	public userVO selectinterfaceuser(String id);
	
}
