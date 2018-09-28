package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_ADMINUSER;

@Mapper
@Repository
public interface AdminMapper {
	AI_ADMINUSER selectAdminById(String ADMIN_ID);
	void updateAdminById(String ADMIN_ID);
	List<AI_ADMINUSER> selectAllAdmin();
	void insertAdmin(AI_ADMINUSER admin);
	
}
