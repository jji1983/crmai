package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AI_ACCOUNT;
import com.ktds.crmai.model.AI_BOARD;
import com.ktds.crmai.model.AI_PAGE;


public interface AccountMapper {
 
	
	List<AI_ACCOUNT> selectAllAccountList();
	
	List<AI_ACCOUNT> selectAccountList(AI_ACCOUNT account);
	
	//List<AI_ACCOUNT> selectAccountDetail(AI adm_id);
	
	int insertAccount(AI_ACCOUNT account);
	
	int updateAccount(AI_ACCOUNT account);

	//int deleteAccount(int adm_id);

	List<AI_ACCOUNT> selectAccountDetail(String adm_id);

	int deleteAccount(String adm_id);
	
	List<AI_ACCOUNT> selectAccountPage(AI_PAGE page);
	
	int selectAccountPageNum();
	


	
}
