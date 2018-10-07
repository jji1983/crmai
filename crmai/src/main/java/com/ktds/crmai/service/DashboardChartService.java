package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.model.AI_NOTICE;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.DashboardChart;
import com.ktds.crmai.service.impl.DashboardChartMapper;
import com.ktds.crmai.service.impl.NoticeMapper;

@Service
@Transactional
public class DashboardChartService implements DashboardChartMapper {
	
	@Autowired
	DashboardChartMapper dashboardChartMapper;

	@Override
	public List<AIStatistics> selectMyData(String ADM_ID) {
		return dashboardChartMapper.selectMyData(ADM_ID);
	}

	@Override
	public int selectMyDataCount(String ADM_ID) {
		return dashboardChartMapper.selectMyDataCount(ADM_ID);
	}

	@Override
	public DashboardChart selectMyDataStat(String ADM_ID) {
		return dashboardChartMapper.selectMyDataStat(ADM_ID);
	}

	@Override
	public List<AIStatistics> selectTotalData() {
		return dashboardChartMapper.selectTotalData();
	}

	@Override
	public int selectTotalDataCount() {
		return dashboardChartMapper.selectTotalDataCount();
	}

	@Override
	public DashboardChart selectTotalDataStat() {
		return dashboardChartMapper.selectTotalDataStat();
	}



}