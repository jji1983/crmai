package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AIStatistics;

public interface StatisticsMapper {
	List<AIStatistics> selectStatisticsList(AIStatistics vo);
}
