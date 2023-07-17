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
	
	 
}
