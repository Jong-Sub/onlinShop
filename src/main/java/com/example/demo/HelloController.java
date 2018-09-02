package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	@RequestMapping(value="/")
	public String login() {
		return "login";		// 호출 경로 /W	EB-INF/jsp/login.jsp
	}
		
	@RequestMapping(value="/loginCheck")
	public String logincheck() {
		return "loginCheck";		// 호출 경로 /W	EB-INF/jsp/loginCheck.jsp
	}
	
	@RequestMapping(value="/join")
	public String join() {
		return "join";		// 호출 경로 /W	EB-INF/jsp/join.jsp
	}
	
	@RequestMapping(value="/makeUser")
	public String makeUser() {
		return "makeUser";		// 호출 경로 /W	EB-INF/jsp/makeUser.jsp
	}
	
	@RequestMapping(value="/onlineShop")
	public String onlineShop() {
		return "onlineShop";		// 호출 경로 /W	EB-INF/jsp/onlineShop.jsp
	}
	
	@RequestMapping(value="/userInfo")
	public String userInfo() {
		return "userInfo";		// 호출 경로 /W	EB-INF/jsp/userInfo.jsp
	}
	
	@RequestMapping(value="/buyProduct")
	public String buyProduct() {
		return "buyProduct";		// 호출 경로 /W	EB-INF/jsp/buyProduct.jsp
	}
	
	@RequestMapping(value="/breakdown")
	public String breakdown() {
		return "breakdown";		// 호출 경로 /W	EB-INF/jsp/breakdown.jsp
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "logout";		// 호출 경로 /W	EB-INF/jsp/logout.jsp
	}
}
