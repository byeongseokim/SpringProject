package ezen.pro.controller;

import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.pro.domain.userVO;
import ezen.pro.service.userServiceImpl;

@Controller
@RequestMapping("/user/*")
public class userController {
	
	@Autowired
	userServiceImpl userserviceImpl;
	
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
		 userserviceImpl.joinuser(vo);
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
		int a=userserviceImpl.check(id);
		String result="";
		System.out.println(id);
		System.out.println(a);
		if(a!=1) {
			result="success";
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/idsearc",produces="application/json;charset=UTF-8")
	public String searcid(@RequestBody userVO vo) {
		System.out.println("드와라");
		try {
			String id=userserviceImpl.searcid(vo);
			if(id==""||id.equals("")) {
			return "아이디가 존재하지 않습니다.";
			}
		    return id;
		}catch(Exception e) {
			System.out.println("1");
			return "아이디가 존재하지 않습니다.";
		}
	}
	
	@ResponseBody
	@PostMapping("/pwdsearc")
	public String searcpwd(@RequestBody userVO vo) {
		String result="";
		 int leftLimit = 48; // letter 'a'
		    int rightLimit = 122; // letter 'z'
		    int targetStringLength = 10;
		    Random random = new Random();
		    String newpassword = random.ints(leftLimit, rightLimit + 1)
		                                   .limit(targetStringLength)
		                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		                                   .toString();
		try {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String securePw = encoder.encode(newpassword);
			vo.setPassword(securePw);
		    int a= userserviceImpl.searcpwd(vo);
		    if(a!=1) {
		    	return "정보가 존재하지않습니다";
		    }
		    return newpassword;
		}catch(Exception e) {
			return "일치하는 정보가 존재하지 않습니다.";
		}
	}
}
