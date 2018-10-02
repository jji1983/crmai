package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AI_ACCOUNT;


public interface AccountMapper {

	
	List<AI_ACCOUNT> selectAllAccountList();
	
	List<AI_ACCOUNT> selectAccountList(AI_ACCOUNT account);
	
	//List<AI_ACCOUNT> selectAccountDetail(AI adm_id);
	
	int insertAccount(AI_ACCOUNT account);

	//int deleteAccount(int adm_id);

	List<AI_ACCOUNT> selectAccountDetail(String adm_id);

	String deleteAccount(String adm_id);


	
}
