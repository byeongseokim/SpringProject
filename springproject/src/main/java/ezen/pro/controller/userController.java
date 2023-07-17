package ezen.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ezen.pro.domain.userVO;
import ezen.pro.service.userServiceImpl;

@Controller
public class userController {
	
	@Autowired
	userServiceImpl serviceImpl;
	@GetMapping("/new.do")
	public String newuser() {
		
		return "joinuser";
	}
	
	@PostMapping("/new.do")
	public String newuser(userVO vo) {
		 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		 String securePw = encoder.encode(vo.getPassword());
		 vo.setPassword(securePw);
		 System.err.println(vo.getPassword());
		 serviceImpl.joinuser(vo);
		 return "main";
	}
	
	@GetMapping("/login.do")
	public String joinuser() {
		
		return "login";
	}
	@PostMapping("/login.do")
	public String joinuser(userVO vo) {
		
		
		return "main";
	}
	
}
