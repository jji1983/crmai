package com.ktds.crmai.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.model.DashboardChartData;
import com.ktds.crmai.service.impl.DashboardChartMapper;

@Service
@Transactional
public class DashboardChartService implements DashboardChartMapper {
	
	@Autowired
	DashboardChartMapper dashboardChartMapper;


	@Override
	public DashboardChartData selectMyDataStat(String ADM_ID) {
		return dashboardChartMapper.selectMyDataStat(ADM_ID);
	}

	@Override
	public DashboardChartData selectTotalDataStat() {
		return dashboardChartMapper.selectTotalDataStat();
	}

	@Override
	public List<DashboardChartData> selectMyDataType(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectMyDataType(baseData);
	}

	@Override
	public List<DashboardChartData> selectTotalDataType() {
		return dashboardChartMapper.selectTotalDataType();
	}

	@Override
	public List<AIStatistics> selectMyTab(String ADM_ID) {
		return dashboardChartMapper.selectMyTab(ADM_ID);
	}

	@Override
	public List<AIStatistics> selectTotalTab() {
		return dashboardChartMapper.selectTotalTab();
	}

	@Override
	public List<DashboardChartData> selectMyPeriod(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectMyPeriod(baseData);
	}

	@Override
	public List<DashboardChartData> selectTotalPeriod(String year) {
		return dashboardChartMapper.selectTotalPeriod(year);
	}

	@Override
	public List<DashboardChartData> selectMyCampaign(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectMyCampaign(baseData);
	}

	@Override
	public List<DashboardChartData> selectTotalCampaign(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectTotalCampaign(baseData);
	}



}