package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;

@Mapper
@Repository
public interface NoticeMapper {

	List<AI_NOTICE> selectAllNoticeList();
	
	List<AI_NOTICE> selectNotice(AI_PAGE page);

	List<AI_NOTICE> selectNoticeList(AI_NOTICE notice);

	int selectNoticePageNum();

	List<AI_NOTICE> selectNoticeDetail(int code);
	

	int insertNotice(AI_NOTICE notice);
	
	int selectCount();

	int deleteNotice(int code);

}