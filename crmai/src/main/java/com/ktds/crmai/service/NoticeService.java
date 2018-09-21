package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.service.impl.NoticeMapper;

@Service
@Transactional
public class NoticeService implements NoticeMapper {

	@Autowired
	NoticeMapper noticeBoardMapper;
	

	@Override
	public void insertNotice(AI_NOTICE notice) {
		// TODO Auto-generated method stub
		noticeBoardMapper.insertNotice(notice);
		
	}


	@Override
	public List<AI_NOTICE> selectNotice() {
		// TODO Auto-generated method stub
		return noticeBoardMapper.selectNotice();
	}

}