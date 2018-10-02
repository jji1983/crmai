package com.ktds.crmai.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_BOARD;
import com.ktds.crmai.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired 
    BoardService boardService;
	
	@ResponseBody 
	@RequestMapping(value="/list")
//	public List<AI_BOARD> selectBoardList(@ModelAttribute("AI_BOARD") AI_BOARD aiBoard, Model model) {
	public List<AI_BOARD> selectAllBoardList() {
		List<AI_BOARD> list = boardService.selectAllBoardList();
//		model.addAttribute("list", list);
		
		return list;  
	}
	
	@ResponseBody 
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public List<AI_BOARD> selectBoardDetail(
			@RequestParam("code") int code) {
		List<AI_BOARD> list = boardService.selectBoardDetail(code);
		return list;  
	}
	
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<Object> insertNewBoard(
			@RequestParam("user_id") String user_id,
			@RequestParam("inputBoardName") String inputBoardName,
			@RequestParam("inputBoardDesc") String inputBoardDesc,
			HttpSession session){
		
		AI_BOARD board = new AI_BOARD();
		board.setTitle(inputBoardName);
		board.setContents(inputBoardDesc);
		board.setWriter(user_id);
		
		int result = boardService.insertBoard(board);
		
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
	public ResponseEntity<Object> deleteBoard(
			@RequestParam("user_id") String user_id,
			@RequestParam("boardCode") int code,
			HttpSession session){
		
		int result = boardService.deleteBoard(code);
		
		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::삭제 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::삭제 실패", HttpStatus.OK);
		}
		
		return response;
	}

}