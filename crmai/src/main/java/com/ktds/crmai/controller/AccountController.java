package com.ktds.crmai.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_ACCOUNT;
import com.ktds.crmai.model.AI_BOARD;
import com.ktds.crmai.service.AccountService;
import com.ktds.crmai.service.BoardService;

@Controller
@RequestMapping(value="/account")
public class AccountController {
	private static Logger logger = LoggerFactory.getLogger(AccountController.class);
	 
	@Autowired 
    AccountService accountService;
	
	@ResponseBody 
	@RequestMapping(value="/list")
//	public List<AI_BOARD> selectBoardList(@ModelAttribute("AI_BOARD") AI_BOARD aiBoard, Model model) {
	public List<AI_ACCOUNT> selectAllAccountList() {
		List<AI_ACCOUNT> list = accountService.selectAllAccountList();
//		model.addAttribute("list", list);
		
		return list;  
	}
	
	@ResponseBody 
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public List<AI_ACCOUNT> selectAccountDetail(
			
			@RequestParam("adm_id") String adm_id) {
		List<AI_ACCOUNT> list = accountService.selectAccountDetail(adm_id);
		
		logger.info("### selectAccountDetail :: {} ", adm_id);
		
		return list;  
	}
	
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<Object> insertNewAccount(
			@RequestParam("user_id") String user_id,
			@RequestParam("inputAdmId") String inputAdmId,
			@RequestParam("inputAdmPw") String inputAdmPw,
			@RequestParam("inputAdmName") String inputAdmName,
			@RequestParam("inputAdmEmail") String inputAdmEmail,
			
			HttpSession session){
		
		
		logger.info("### insertNewAccount :: {} {} {} {} {}", user_id, inputAdmId, inputAdmPw, inputAdmName, inputAdmEmail);
		AI_ACCOUNT account = new AI_ACCOUNT();
		account.setAdm_id(inputAdmId);
		account.setAdm_pw(inputAdmPw);
		account.setAdm_name(inputAdmName);
		account.setAdm_email(inputAdmEmail);
	//	account.setWriter(user_id);
		
		int result = accountService.insertAccount(account);
		
		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::등록 실패", HttpStatus.OK);
		}
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ResponseEntity<Object> deleteAccount(
			@RequestParam("user_id") String user_id,
			@RequestParam("inputAdmId") String adm_id,
			HttpSession session){
		
		String result = accountService.deleteAccount(adm_id);
		
		ResponseEntity<Object> response = null;
	//	if (result > 0) {
	//		response = new ResponseEntity<Object>("OK::삭제 성공", HttpStatus.OK);
	//	} else {
	//		response = new ResponseEntity<Object>("FAIL::삭제 실패", HttpStatus.OK);
	//	}
		
		return response;
	}

}