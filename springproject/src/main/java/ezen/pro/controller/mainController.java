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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.pro.domain.cateVO;
import ezen.pro.service.cateServiceImpl;
import ezen.pro.service.userServiceImpl;

@Controller
@RequestMapping("/main/*")
public class mainController {
	
	String val="https://www.youtube.com/embed/7d8rFHzsu2Q";
	@Autowired
	userServiceImpl serviceImpl;
	@Autowired
	cateServiceImpl cateServiceImpl;

	@GetMapping("/main.do")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model) {
		String userid = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!userid.equals("anonymousUser")) {
			String grade = String.valueOf(serviceImpl.readgrade(userid));
			HttpSession session = request.getSession();
			session.setAttribute("grade", grade);
			session.setAttribute("userid", userid);

		}
		List<cateVO> cate = cateServiceImpl.readcate();
		model.addAttribute("cate", cate);
		model.addAttribute("banner",val);
		return "main";
	}
	
	@ResponseBody
	@PostMapping("/mainbanner")
	public String mainbaner(@RequestParam("val")String val) {
	this.val="https://www.youtube.com/embed/"+val;
	return "변경완료";
	}
	
}
