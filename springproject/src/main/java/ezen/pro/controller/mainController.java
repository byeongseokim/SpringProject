package ezen.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.pro.domain.cateVO;
import ezen.pro.service.cateServiceImpl;
import ezen.pro.service.userServiceImpl;


@Controller
@RequestMapping("/main/*")
public class mainController {
	

	@Autowired
	userServiceImpl serviceImpl;
	@Autowired
	cateServiceImpl cateServiceImpl;

	
	@GetMapping("/main.do")
	public String main(HttpServletRequest request, HttpServletResponse response,Model model) {
	String userid=(String)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	System.out.println(userid);
	if(!userid.equals("anonymousUser")) {
	String grade=String.valueOf(serviceImpl.readgrade(userid));
	HttpSession session = request.getSession();
	session.setAttribute("grade",grade);
	session.setAttribute("userid",userid);
	}
	List<cateVO> cate = cateServiceImpl.readcate();
	model.addAttribute("cate", cate);
	return "main";
	}
}
