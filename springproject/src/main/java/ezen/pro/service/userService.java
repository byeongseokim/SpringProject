package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.userVO;

public interface userService {

	
	public int joinuser();
	
	public List<userVO> readuser();
	
	public int deleteuser();
	
	public int changegrade();
}
