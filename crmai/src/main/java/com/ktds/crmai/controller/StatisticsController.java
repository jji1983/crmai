package com.ktds.crmai.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 모델 여부가 'Y'인 통계 조회
	@ResponseBody
	@RequestMapping(value = "/list")
	public List<AIStatistics> selectSttModelYList(
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
			
		return statisticsService.selectSttModelYList(aiVO);
	}
	
	// 통계 평균 조회
	@ResponseBody
	@RequestMapping(value = "/average")
	public Map<String, AIStatistics> selectStatisticsAvgList(
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
		
		AIStatistics dTreeVO = statisticsService.selectDTreeAvg(aiVO);
		AIStatistics rfVO = statisticsService.selectRFavg(aiVO);
		AIStatistics svmVO = statisticsService.selectSVMavg(aiVO);
		AIStatistics lRVO = statisticsService.selectLRavg(aiVO);
		
		Map<String, AIStatistics> trainMethodMap = new HashMap<>();
		
		trainMethodMap.put("dTreeVO", dTreeVO);
		trainMethodMap.put("rfVO", rfVO);
		trainMethodMap.put("svmVO", svmVO);
		trainMethodMap.put("lRVO", lRVO);
		
		return trainMethodMap;
	}
}
