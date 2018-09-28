package com.ktds.crmai.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.crmai.model.AI_BOARD;
import com.ktds.crmai.service.impl.BoardMapper;

@Service("BoardService")
public class BoardService implements BoardMapper{

	@Autowired
	BoardMapper boardmapper;
	
	@Override
	public List<AI_BOARD> selectAllBoardList() { 
		return boardmapper.selectAllBoardList();
	} 

	@Override
	public List<AI_BOARD> selectBoardList(AI_BOARD board) {
		return boardmapper.selectBoardList(board);
	}

	@Override
	public void insertBoard(AI_BOARD board) {
		boardmapper.insertBoard(board);
	}

}
