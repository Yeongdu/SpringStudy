package com.spring.mvc01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	/*
	 * ModelAndView객체란?
	 * - ModelAndView 객체는 컨트롤러에 의해 비지니스 로직이 수행되고 나면 대체적으로 사용자에게 반환되어
	 * 브라우저에 보여질 정보들이 만들어진다. 이때 만들어진 정보를 view page로 넘겨주게 되는게 응답을 할 view page 정보와 
	 * 함께 전달할 데이터를 한꺼번에 저장하여 넘겨줄 때 사용하는 객체
	 * 
	 * 
	 * 
	 */
	
	@RequestMapping("/info")
	public ModelAndView abc() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("email", "hong@naver.com");
		mav.setViewName("member/email"); //member라는 폴더 밑에 email.jsp로 만들어서 처리해달라 
		return mav;
	}

}
