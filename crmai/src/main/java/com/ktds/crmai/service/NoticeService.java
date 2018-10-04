package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.service.impl.NoticeMapper;

@Service
@Transactional
public class NoticeService implements NoticeMapper {

	@Autowired
	NoticeMapper noticeBoardMapper;

	@Override
	public List<AI_NOTICE> selectAllNoticeList() {
		return noticeBoardMapper.selectAllNoticeList();
	}

	@Override
	public List<AI_NOTICE> selectNoticeList(AI_NOTICE notice) {
		return noticeBoardMapper.selectNoticeList(notice);
	}

	@Override
	public List<AI_NOTICE> selectNoticeDetail(int code) {
		return noticeBoardMapper.selectNoticeDetail(code);
	}

	@Override
	public int insertNotice(AI_NOTICE notice) {
		return noticeBoardMapper.insertNotice(notice);
	}

	@Override
	public int deleteNotice(int code) {
		return noticeBoardMapper.deleteNotice(code);
	}


	@Override
	public int selectCount() {
		return noticeBoardMapper.selectCount();
	}

	@Override
	public int selectNoticePageNum() {
		// TODO Auto-generated method stub
		return noticeBoardMapper.selectNoticePageNum();
	}

	@Override
	public List<AI_NOTICE> selectNotice(AI_PAGE page) {
		// TODO Auto-generated method stub
		return noticeBoardMapper.selectNotice(page);
	}


}