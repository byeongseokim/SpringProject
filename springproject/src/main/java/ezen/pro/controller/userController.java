package ezen.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ezen.pro.domain.userVO;
import ezen.pro.service.userServiceImpl;

@RestController
@RequestMapping("/user")
public class userController {
	
	@Autowired
	userServiceImpl serviceImpl;
	
	@PostMapping("/new.do")
	public String newuser(userVO vo) {
		 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		 String securePw = encoder.encode(vo.getPassword());
		 vo.setPassword(securePw);
		 serviceImpl.joinuser(vo);
		 return "main";
	}
	
	@PostMapping("/login.do")
	public String joinuser(userVO vo) {
		
		
		return "main";
	}
	
}
