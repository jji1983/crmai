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
	public String sample_index() {
		return "/sample/index";
	}
	
	@RequestMapping(value="/sample/file/fileTest")
	public String sample_fileTest() {
		return "/sample/file/fileTest";
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
	
	@RequestMapping(value="/iframe/NoticeBoard")
	public String NoticeBoard() {
		return "/iframe/NoticeBoard";
	}
	
	@RequestMapping(value="/iframe/Notice")
	public String Notice() {
		return "/iframe/Notice";
	}

}
