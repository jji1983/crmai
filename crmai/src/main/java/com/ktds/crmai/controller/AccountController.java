package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_ACCOUNT;
import com.ktds.crmai.model.AI_BOARD;
import com.ktds.crmai.model.AI_PAGE;
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
			@RequestParam("admType") String admType,
			HttpSession session){
		
		
		logger.info("### insertNewAccount :: {} {} {} {} {}", user_id, inputAdmId, inputAdmPw, inputAdmName, inputAdmEmail);
		//insert 전 동일 아이디 있는지 체크
		
		int chk = accountService.selectCheckPK(inputAdmId);
		
		AI_ACCOUNT account = new AI_ACCOUNT();
		account.setAdm_id(inputAdmId);
		account.setAdm_pw(inputAdmPw);
		account.setAdm_name(inputAdmName);
		account.setAdm_email(inputAdmEmail);
		account.setAdm_type(admType);
	//	account.setWriter(user_id);
		
		ResponseEntity<Object> response = null;
		if (chk == 0) {
			int result = accountService.insertAccount(account);

			if (result > 0) {
				response = new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
			} else {
				response = new ResponseEntity<Object>("FAIL::등록 실패", HttpStatus.OK);
			}
		}
		else {
			response = new ResponseEntity<Object>("PK::중복 등록", HttpStatus.OK);
		}
		
		
		return response;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ResponseEntity<Object> updateAccount(
			@RequestParam("inputAdmId") String inputAdmId,
			@RequestParam("inputAdmPw") String inputAdmPw,
			@RequestParam("inputAdmName") String inputAdmName,
			@RequestParam("inputAdmEmail") String inputAdmEmail,
			@RequestParam("admType") String admType,
			HttpSession session){
		
		AI_ACCOUNT account = new AI_ACCOUNT();
		account.setAdm_id(inputAdmId);
		account.setAdm_pw(inputAdmPw);
		account.setAdm_name(inputAdmName);
		account.setAdm_email(inputAdmEmail);
		account.setAdm_type(admType);
		
		int result = accountService.updateAccount(account);
		
		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::수정 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::수정 실패", HttpStatus.OK);
		}
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ResponseEntity<Object> deleteAccount(
			@RequestParam("user_id") String user_id,
			@RequestParam("inputAdmId") String adm_id,
			HttpSession session){
		
		int result = accountService.deleteAccount(adm_id);
		
		ResponseEntity<Object> response = null;
	
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::삭제 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::삭제 실패", HttpStatus.OK);
		}
		
		return response;
	}

	
	@ResponseBody
	@RequestMapping(value = "/listPage")
	public List<AI_ACCOUNT> getAccountListPage(@ModelAttribute("account") AI_PAGE in_account, HttpSession session) {

		// 응답과 함깨 HttpStatus를 지정할 수 있습니다.
		List<AI_ACCOUNT> response = accountService.selectAccountPage(in_account);
		
		System.out.println(response);

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "/totalPage")
	public List<String> getTotalAccount(HttpSession session) {
		List<String> response = new ArrayList<>();
		
		int maxRowNum = accountService.selectAccountPageNum();
		
		if(maxRowNum == 0) {
			response.add("0");
		}else {
			response.add(maxRowNum + "");
		}

		return response;
	}
	
}