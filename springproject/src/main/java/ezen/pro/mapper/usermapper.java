package ezen.pro.mapper;

import ezen.pro.domain.userVO;

public interface usermapper {
	
	public int insertuser(userVO vo);
	
	public userVO selectuser(String id);
	
	public int deleteuser(String id);
	
	public int updategrade(String id);
	
	public int selectgrade(String id);
	
	public int selectcheckid(String id);
}
