package com.ktds.crmai.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.crmai.model.AI_ACCOUNT;

import com.ktds.crmai.service.impl.AccountMapper;


@Service("AccountService")
public class AccountService implements AccountMapper{
 
	@Autowired
	AccountMapper accountmapper;
	
	@Override
	public List<AI_ACCOUNT> selectAllAccountList() { 
		return accountmapper.selectAllAccountList();
	} 

	@Override
	public List<AI_ACCOUNT> selectAccountList(AI_ACCOUNT account) {
		return accountmapper.selectAccountList(account);
	}
	
	@Override
	public List<AI_ACCOUNT> selectAccountDetail(String adm_id) {
		return accountmapper.selectAccountDetail(adm_id);
	}

	@Override
	public int insertAccount(AI_ACCOUNT account) {
		return accountmapper.insertAccount(account);
	}

	@Override
	public void deleteAccount(String adm_id) {
		accountmapper.deleteAccount(adm_id);
	}




	
}
