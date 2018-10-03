package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AI_BOARD;

public interface BoardMapper {

	 
	List<AI_BOARD> selectAllBoardList();
	
	List<AI_BOARD> selectBoardList(AI_BOARD board);
	
	List<AI_BOARD> selectBoardDetail(int code);
	
	int insertBoard(AI_BOARD board);

	int deleteBoard(int code);
	
}
