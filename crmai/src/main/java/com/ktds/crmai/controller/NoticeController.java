package com.ktds.crmai.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.service.NoticeService;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	NoticeService noticeService;

	@ResponseBody
	@RequestMapping(value = "/list")
	public List<AI_NOTICE> selectAllNoticeList() {
		List<AI_NOTICE> list = noticeService.selectAllNoticeList();

		return list;
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getResult(@ModelAttribute("page") AI_PAGE page){
    	logger.info("Request List....getResult.... - {}", page);
    	List<AI_NOTICE> out_test = null;
    	
    	out_test = noticeService.selectNotice(page);
    	
    	
    	
    	Iterator<AI_NOTICE> ite = out_test.iterator();
    	
    	while(ite.hasNext()) {
    		AI_NOTICE info = (AI_NOTICE)ite.next();
    		logger.info("test :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_test, HttpStatus.OK);
    	
    	return response;
    }

	@ResponseBody
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public List<AI_NOTICE> selectNoticeDetail(@RequestParam("code") int code) {
		List<AI_NOTICE> list = noticeService.selectNoticeDetail(code);

		// 글 하나 읽기
		System.out.println(list);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<Object> insertNewNotice(@RequestParam("user_id") String user_id,
			@RequestParam("inputNoticeName") String inputNoticeName,
			@RequestParam("inputNoticeDesc") String inputNoticeDesc, HttpSession session) {

		AI_NOTICE notice = new AI_NOTICE();
		notice.setTitle(inputNoticeName);
		notice.setContents(inputNoticeDesc);
		notice.setWriter(user_id);

		int result = noticeService.insertNotice(notice);

		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::등록 실패", HttpStatus.OK);
		}

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<Object> deleteNotice(@RequestParam("user_id") String user_id,
			@RequestParam("noticeCode") int code, HttpSession session) {

		int result = noticeService.deleteNotice(code);

		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::삭제 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::삭제 실패", HttpStatus.OK);
		}

		return response;
	}

}
