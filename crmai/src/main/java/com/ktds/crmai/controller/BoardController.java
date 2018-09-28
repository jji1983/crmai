package com.ktds.crmai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	

}