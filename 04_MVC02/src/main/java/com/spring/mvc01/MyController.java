package com.spring.mvc01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
	
	@RequestMapping("/input")
	public String input() {
		return "insertForm";
	}
	
	@RequestMapping("/inputOk")
	public String abc(HttpServletRequest request, Model model) {
		String user_name = request.getParameter("name").trim();
		String user_age = request.getParameter("age").trim();
		String user_phone = request.getParameter("phone").trim();

		model.addAttribute("userName",user_name);
		model.addAttribute("userAge",user_age);
		model.addAttribute("userPhone",user_phone);
		return "inputResult";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "loginForm";
	}
	
	@RequestMapping("/loginOk")
	public String loginOk(
			@RequestParam("userId") String user_id,
			@RequestParam("userPwd") String user_pwd,
			Model model) {
//		String userId = request.getParameter("userId").trim();
//		두개 똑같은 뜻
//		@RequestParam("userId") String user_id
		
		model.addAttribute("id", user_id);
		model.addAttribute("pwd", user_pwd);
		return "result";
	}

}
