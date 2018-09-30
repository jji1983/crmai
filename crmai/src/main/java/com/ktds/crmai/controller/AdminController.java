package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_ADMINUSER;
import com.ktds.crmai.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
    AdminService admService;
	
	@ResponseBody
	@RequestMapping(value="/login_proc", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
	public List<String> list(@ModelAttribute("ADM_ID") String ADM_ID, @RequestParam("ADM_PW") String ADM_PW, HttpSession session){
		logger.info("Request List....");
		logger.info("ADM_ID : "+ADM_ID + "  ADM_PW : "+ADM_PW);
		List<String> response = new ArrayList<String>();
		
		AI_ADMINUSER user = admService.selectAdminById(ADM_ID);
		
		if(user == null) {
			response.add("fail. user not found!");
		}else {
		
			if(user.getADM_PW().equals(ADM_PW)) {
				response.add("success");
				session.setAttribute("sessionID", user.getADM_ID());
				session.setAttribute("sessionNAME", user.getADM_NAME());
				session.setAttribute("sessionROLE", user.getADM_ROLE());
				session.setAttribute("sessionLOGIN", user.getADM_LOGIN());
				session.setAttribute("sessionCAMCNT", user.getCAM_CNT());
				
				admService.updateAdminById(user.getADM_ID());
				
			}else{
				response.add("fail. PW not correct!");
			}
		}
		
		logger.info("response : "+ response.get(0));
		return response;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/register_check", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
	public List<String> register_check(@ModelAttribute("admin") AI_ADMINUSER addAdmin){
		logger.info("Request register_check....{}",addAdmin);
		List<String> response = new ArrayList<String>();
		
		AI_ADMINUSER user = admService.selectAdminById(addAdmin.getADM_ID());
		
		if(user != null) {
			response.add("fail. ID Already exists ");
		}else {
			admService.insertAdmin(addAdmin);
			response.add("success");
		}
		
		logger.info("response : "+ response.get(0));
		return response;
	}
	
	
	
}
