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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.service.NoticeService;



@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	NoticeService noticeBoardService;
	
	@ResponseBody
	@RequestMapping(value="/notice_reg", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
	public List<String> list(@ModelAttribute("NOTICE_TEXT") String NOTICE_TEXT
			/*, @RequestParam("ADM_PW") String ADM_PW*/
			, HttpSession session){
		logger.info("Request List....");
		logger.info("NOTICE_TEXT : "+NOTICE_TEXT);
		List<String> response = new ArrayList<String>();
		
		AI_NOTICE notice = new AI_NOTICE();
		
		notice.setNOTICE_TEXT(NOTICE_TEXT);
		
		noticeBoardService.insertNotice(notice);
		response.add("success");
//		ADMIN_USER user = admService.selectAdminById(ADM_ID);
//		
//		if(user == null) {
//			response.add("fail. user not found!");
//		}else {
//		
//			if(user.getADM_PW().equals(ADM_PW)) {
//				response.add("success");
//				
//				session.setAttribute("sessionID", user.getADM_ID());
//				session.setAttribute("sessionNAME", user.getADM_NAME());
//				session.setAttribute("sessionROLE", user.getADM_ROLE());
//				
//			}else{
//				response.add("fail. PW not correct!");
//			}
//		}
		
		logger.info("response : "+ response.get(0));
		return response;
	}
	
	
//	@ResponseBody
//	@RequestMapping(value="/register_check", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
//	public List<String> register_check(@ModelAttribute("admin") ADMIN_USER addAdmin){
//		logger.info("Request register_check....{}",addAdmin);
//		List<String> response = new ArrayList<String>();
//		
//		ADMIN_USER user = admService.selectAdminById(addAdmin.getADM_ID());
//		
//		if(user != null) {
//			response.add("fail. ID Already exists ");
//		}else {
//			admService.insertAdmin(addAdmin);
//			response.add("success");
//		}
//		
//		logger.info("response : "+ response.get(0));
//		return response;
//	}
	
	
	
}
