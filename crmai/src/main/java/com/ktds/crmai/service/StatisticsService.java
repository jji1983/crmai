package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.service.impl.StatisticsMapper;

@Service
public class StatisticsService implements StatisticsMapper {

	@Autowired
	StatisticsMapper statisticsMapper;
	
	@Override
	public List<AIStatistics> selectStatisticsList(AIStatistics vo) {
		return statisticsMapper.selectStatisticsList(vo);
	}
}
