package com.ktds.crmai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.service.StatisticsService;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	@Autowired
	StatisticsService statisticsService;
	
	// 통계 조회
	@ResponseBody
	@RequestMapping(value = "/list")
	public List<AIStatistics> selectStatisticsList(
			@RequestParam(required=false) String camName,
			@RequestParam(required=false) String camType,
			@RequestParam(required=false) String camStatus,
			@RequestParam(required=false) String admName,
			@RequestParam(required=false) String beforeDate,
			@RequestParam(required=false) String afterDate
			) {
		
		if("ALL".equals(camType)) {
			camType = "";
		}
		
		if("ALL".equals(camStatus)) {
			camStatus = "";
		}
		
		AIStatistics aiVO = new AIStatistics(camName, camStatus, admName, camType, beforeDate, afterDate);
		
		return statisticsService.selectStatisticsList(aiVO);
	}
}
