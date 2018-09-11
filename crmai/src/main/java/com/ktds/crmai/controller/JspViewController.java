package com.ktds.crmai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspViewController {

	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/sample/index")
	public String index_sample() {
		return "/sample/index";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping(value="/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value="/iframe/Dashboard")
	public String Dashboard() {
		return "/iframe/Dashboard";
	}
	
	@RequestMapping(value="/iframe/Pretreatment")
	public String Pretreatment() {
		return "/iframe/Pretreatment";
	}
	
	@RequestMapping(value="/iframe/Learning")
	public String Learning() {
		return "/iframe/Learning";
	}
	
	@RequestMapping(value="/iframe/RunForecast")
	public String RunForecast() {
		return "/iframe/RunForecast";
	}

}
