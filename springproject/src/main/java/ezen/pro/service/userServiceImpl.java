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
	public int changegrade() {

		return mapper.updategrade();
	}

	@Override
	public int deleteuser() {

		return mapper.deleteuser();
	}

	@Override
	public int joinuser() {

		return mapper.insertuser();
	}

	@Override
	public List<userVO> readuser() {

		return mapper.selectuser();		
	}
}
