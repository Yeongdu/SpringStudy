package com.spring.mvc03;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping("/join_ok")
	public String joinOk(Member member, Model model) {
		model.addAttribute("Member", member);
		return "joinInfo";
		
	}

}
