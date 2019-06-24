package com.ktds.crmai.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspViewController {

	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/login")
	public void login() {
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.setAttribute("sessionID", null);
		session.setAttribute("sessionNAME", null);
		session.setAttribute("sessionROLE", null);

		return "login";
	}
	
	@RequestMapping(value = "/guide")
	public void guide() {
	}
	
	@RequestMapping(value = "/movie")
	public void movie() {
	}


	@RequestMapping(value = "/register")
	public void register() {
	}

	@RequestMapping(value = "/main")
	public String main() {
		return "/main";
	}

	@RequestMapping(value = "/iframe/AutoOrder")
	public void AutoOrder() {
	}

	@RequestMapping(value = "/iframe/Dashboard")
	public void Dashboard() {
	}

	@RequestMapping(value = "/iframe/Pretreatment")
	public void Pretreatment() {
	}

	@RequestMapping(value = "/iframe/PretreatmentResult")
	public void PretreatmentResult() {
	}

	@RequestMapping(value = "/iframe/Learning")
	public void Learning() {
	}

	@RequestMapping(value = "/iframe/RunForecast")
	public void RunForecast() {
	}

	@RequestMapping(value = "/iframe/RunForecastResult")
	public void RunForecastResult() {
	}

	@RequestMapping(value = "/iframe/Statistics_m1")
	public void Statistics1() {
	}

	@RequestMapping(value = "/iframe/Statistics_m2")
	public void Statistics2() {
	}

	@RequestMapping(value = "/iframe/Statistics_m3")
	public void Statistics3() {
	}

	@RequestMapping(value = "/iframe/NoticeBoard")
	public void NoticeBoard() {
	}

	@RequestMapping(value="/iframe/admin/NoticeMgr")
	public void NoticeMgr() {
	}

	@RequestMapping(value = "/iframe/admin/UserMgr")
	public void UserMgr() {
	}

}
