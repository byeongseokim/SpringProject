package ezen.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.pro.domain.userVO;
import ezen.pro.service.userServiceImpl;

@Controller
@RequestMapping("/user/*")
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
		 System.out.println(vo.getName());
		 vo.setPassword(securePw);
		 System.out.println(vo.getPassword());
		 serviceImpl.joinuser(vo);
		 return "main";
	}
	
	@GetMapping("/login.do")
	public String joinuser() {
		return "login";
	}
	
	@PostMapping("/login.do")
	public String joinuser(userVO vo) {
		
		System.out.println("들어옴");
		System.out.println(vo.getGrade());
		return "main";
	}
	
	@GetMapping("/logout.do")
	public String logout(ModelMap model,HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
            System.out.println("삭제하니?");
        }
		return "redirect:/main/main.do";
	}
	
	@ResponseBody
	@PostMapping("/checkId.do")
	public String checkid(@RequestParam("id")String id) {
		int a=serviceImpl.check(id);
		String rufrhk="";
		System.out.println(id);
		System.out.println(a);
		if(a!=1) {
			rufrhk="success";
		}
		return rufrhk;
	}
	
}
