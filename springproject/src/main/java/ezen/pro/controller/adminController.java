package ezen.pro.controller;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@ContextConfiguration
public class adminController {

	
	@GetMapping("/maum")
	public String adminmode() {
		
		return "admin";
	}
	
	
}
