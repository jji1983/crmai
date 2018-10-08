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
	
	//나의 전체 평균(정확도,예측,결과)
	DashboardChartData selectMyDataStat(String ADM_ID);
	
	//전체 평균(정확도,예측,결과)
	DashboardChartData selectTotalDataStat();
	
	//나의 전체(탭)
	List<AIStatistics> selectMyTab(String ADM_ID);
	
	//전체(탭)
	List<AIStatistics> selectTotalTab();
	
	//나의 전체(산업군별)
	List<DashboardChartData> selectMyDataType(HashMap<String, Object> baseData);
	
	//전체 평균(산업군별)
	List<DashboardChartData> selectTotalDataType();
	
	//나의 전체(기간별)
	List<DashboardChartData> selectMyPeriod(HashMap<String, Object> baseData);
	
	//전체 평균(기간별)
	List<DashboardChartData> selectTotalPeriod(String year); 
	
	
	//나의 전체(캠페인별)
	List<DashboardChartData> selectMyCampaign(HashMap<String, Object> baseData);
	
	//전체 평균(캠페인별)
	List<DashboardChartData> selectTotalCampaign(HashMap<String, Object> baseData);
	
}
