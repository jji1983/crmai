package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_NOTICE;

@Mapper
@Repository
public interface NoticeMapper {
	//ADMIN_USER selectAdminById(String ADMIN_ID);
	//List<ADMIN_USER> selectAllAdmin();
	void insertNotice(AI_NOTICE notice);
	
	
	List<AI_NOTICE> selectNotice();
	
}