package ezen.pro.service;

import java.util.List;

import ezen.pro.domain.userVO;

public interface userService {

	
	public int joinuser(userVO vo);
	
	public userVO readuser(String id);
	
	public int deleteuser(String id);
	
	public int changegrade(String id);
	
	public int readgrade(String id);
	
	public int check(String id);
	
	public String searcid(userVO vo);
	
	public int searcpwd(userVO vo);
}
