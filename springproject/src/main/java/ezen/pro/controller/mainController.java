package ezen.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/main/*")
public class mainController {
	

	
	@GetMapping("/main.do")
	public String main() {
		
	 return "mainpa";
	}
}
