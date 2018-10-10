package com.ktds.crmai.controller;

import java.util.ArrayList;
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

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.service.NoticeService;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	NoticeService noticeService;

	@ResponseBody
	@RequestMapping(value = "/list")
//	public List<AI_BOARD> selectBoardList(@ModelAttribute("AI_BOARD") AI_BOARD aiBoard, Model model) {
	public List<AI_NOTICE> selectAllNoticeList() {
		List<AI_NOTICE> list = noticeService.selectAllNoticeList();
//		model.addAttribute("list", list);

		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public List<AI_NOTICE> selectNoticeDetail(@RequestParam("code") int code) {
		List<AI_NOTICE> list = noticeService.selectNoticeDetail(code);
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

	@ResponseBody
	@RequestMapping(value = "/listPage")
	public List<AI_NOTICE> getNoticeListPage(@ModelAttribute("notice") AI_PAGE in_notice, HttpSession session) {
		logger.info("Request List....getCampaignListPage.... - {}", in_notice);

		// 응답과 함깨 HttpStatus를 지정할 수 있습니다.
		List<AI_NOTICE> response = noticeService.selectNoticePage(in_notice);

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "/totalPage")
	public List<String> getTotalNotice(HttpSession session) {
		logger.info("Request TotalCampaign....");
		List<String> response = new ArrayList<>();
		
		int maxRowNum = noticeService.selectNoticePageNum();
		
		if(maxRowNum == 0) {
			response.add("0");
		}else {
			response.add(maxRowNum + "");
		}

		return response;
	}
}
