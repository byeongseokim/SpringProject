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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.pro.domain.userVO;
import ezen.pro.service.boardServiceImpl;
import ezen.pro.service.cateServiceImpl;
import ezen.pro.service.userServiceImpl;

@Controller
@RequestMapping("/user/*")
public class userController {
	
	@Autowired
	boardServiceImpl boardServiceImpl;
	@Autowired
	userServiceImpl userserviceImpl;
	@Autowired
	cateServiceImpl cateServiceImpl;
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
		
		System.out.println(vo.getGrade());
		return "main";
	}
	
	@GetMapping("/logout.do")
	public String logout(ModelMap model,HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
		return "redirect:/main/main.do";
	}
	
	@GetMapping("/checkid.do")
	public String checkid() {

		return "memberinfo";
	}
	
	@ResponseBody
	@PostMapping("/checkid.do")
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
	@PostMapping(value = "/idsearch",produces="application/json;charset=UTF-8")
	public String searcid(@RequestBody userVO vo) {
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
	@PostMapping(value ="/pwdsearch" ,produces="application/json;charset=UTF-8")
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
	
	@GetMapping("/usermodify.do")
	public String usergrademodify(Model model) {
		model.addAttribute("user",userserviceImpl.selectalluser());
		model.addAttribute("cate", cateServiceImpl.readcate());
		return "usermodify";
	}
	
	@ResponseBody
	@PutMapping(value ="/grademodify.do" ,produces="application/json;charset=UTF-8")
	public String grademodify(@RequestBody userVO vo) {
		System.out.println(vo.getGrade());
		System.out.println(vo.getId());
		
		userserviceImpl.grademoify(vo);
		return "성공적으로 변경되었습니다";
	}
	
	@GetMapping("/userinterface/{user_id}")
	public String userinterface(Model model,@PathVariable("user_id") String id) {
		model.addAttribute("user",userserviceImpl.selectinterfaceuser(id));
		model.addAttribute("board",boardServiceImpl.selectwriter(id));
		model.addAttribute("cate", cateServiceImpl.readcate());
		return "userinterface";
	}
}
