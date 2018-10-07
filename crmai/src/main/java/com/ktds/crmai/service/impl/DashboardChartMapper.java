package com.ktds.crmai.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.model.DashboardChart;


@Mapper
@Repository
public interface DashboardChartMapper {
	/*
	 * <select id="selectMyData" resultMap="aiStatisticMap"> <select
	 * id="selectMyDataCount" resultMap="int"> <select id="selectMyDataStat"
	 * resultMap="DashboardChart"> <select id="selectTotalData"
	 * resultMap="aiStatisticMap"><select id="selectTotalDataCount"
	 * resultMap="int"> <select id="selectTotalDataStat" resultMap="aiStatisticMap">
	 */
	
	//나의 전체
	List<AIStatistics> selectMyData(String ADM_ID);
	
	//나의 전체 갯수
	int selectMyDataCount(String ADM_ID);
	
	//나의 전체 평균(정확도,예측,결과)
	DashboardChart selectMyDataStat(String ADM_ID);
	
	
	
	//전체
	List<AIStatistics> selectTotalData();
	
	//전체 갯수
	int selectTotalDataCount();
	
	//전체 평균(정확도,예측,결과)
	DashboardChart selectTotalDataStat();
	
	
}
