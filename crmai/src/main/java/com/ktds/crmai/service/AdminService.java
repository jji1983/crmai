package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.ADMIN_USER;
import com.ktds.crmai.service.impl.AdminMapper;

@Service
@Transactional
public class AdminService implements AdminMapper {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public ADMIN_USER selectAdminById(String ADMIN_ID) {
		return adminMapper.selectAdminById(ADMIN_ID);
	}

	@Override
	public List<ADMIN_USER> selectAllAdmin() {
		return adminMapper.selectAllAdmin();
	}

	@Override
	public void insertAdmin(ADMIN_USER admin) {
		adminMapper.insertAdmin(admin);

	}

}
