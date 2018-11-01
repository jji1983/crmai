package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AIStatistics;

public interface StatisticsMapper {

	List<AIStatistics> selectSttModelYList(AIStatistics vo);
	
	AIStatistics selectDTreeAvg(AIStatistics vo);
	
	AIStatistics selectRFavg(AIStatistics vo);
	
	AIStatistics selectSVMavg(AIStatistics vo);
	
	AIStatistics selectLRavg(AIStatistics vo);
}
