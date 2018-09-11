package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.ADMIN_USER;

@Mapper
@Repository
public interface AdminMapper {
	ADMIN_USER selectAdminById(String ADMIN_ID);
	List<ADMIN_USER> selectAllAdmin();
	void insertAdmin(ADMIN_USER admin);
	
}
