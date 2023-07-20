package ezen.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.pro.domain.userVO;
import ezen.pro.mapper.usermapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class userServiceImpl implements userService {

	@Autowired
	usermapper mapper;

	@Override
	public int changegrade(String id) {

		return mapper.updategrade(id);
	}

	@Override
	public int deleteuser(String id) {

		return mapper.deleteuser(id);
	}

	@Override
	public int joinuser(userVO vo) {

		return mapper.insertuser(vo);
	}

	@Override
	public userVO readuser(String id) {

		return mapper.selectuser(id);		
	}
	
	@Override
	public int readgrade(String id) {
	
		return mapper.selectgrade(id);
	}
	@Override
	public int check(String id) {
	
		return mapper.selectcheckid(id);
	}
	@Override
	public String searcid(userVO vo) {
		
		return mapper.selectid(vo);
	}
	@Override
	public int searcpwd(userVO vo) {
		return mapper.selectpw(vo);
	}
}
