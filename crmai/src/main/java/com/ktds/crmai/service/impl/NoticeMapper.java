package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.model.AI_PAGE;

@Mapper
@Repository
public interface NoticeMapper {
	List<AI_NOTICE> selectAllNoticeList();

	List<AI_NOTICE> selectNoticeList(AI_NOTICE notice);

	List<AI_NOTICE> selectNoticeDetail(int code);

	int insertNotice(AI_NOTICE notice);

	int deleteNotice(int code);
	
	List<AI_NOTICE> selectNoticePage(AI_PAGE page);
	
	int selectNoticePageNum();
	
	int updateNotice(AI_NOTICE notice);
}