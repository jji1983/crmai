package com.ktds.crmai.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.model.DashboardChartData;


@Mapper
@Repository
public interface DashboardChartMapper {
	
	//전체 데이터 통계
	DashboardChartData selectTotal(HashMap<String, Object> baseData);
	
	//산업군별 데이터 통계
	List<DashboardChartData> selectType(HashMap<String, Object> baseData);
	
	//기간별 데이터 통계
	List<DashboardChartData> selectPeriod(HashMap<String, Object> baseData);
	
	//캠페인별 데이터 통계
	List<DashboardChartData> selectCampaign(HashMap<String, Object> baseData);
	
	//캠페인별 탭
	List<AIStatistics> selectCampaignTab(HashMap<String, Object> baseData);
	
}
