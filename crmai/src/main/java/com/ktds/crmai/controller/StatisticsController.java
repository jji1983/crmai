package com.ktds.crmai.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static Logger LOGGER = LoggerFactory.getLogger(StatisticsController.class);
	
	@Autowired
	StatisticsService statisticsService;
	
	// 모델 여부가 'Y'인 통계 조회
	@ResponseBody
	@RequestMapping(value = "/list")
	public List<AIStatistics> selectSttModelYList(
			@RequestParam(required=false) String camName,
			@RequestParam(required=false) String camType,
			@RequestParam(required=false) String camStatus,
			@RequestParam(required=false) String beforeDate,
			@RequestParam(required=false) String afterDate,
			HttpSession session
			) {
			
		if("ALL".equals(camType)) {
			camType = "";
		}
			
		if("ALL".equals(camStatus)) {
			camStatus = "";
		}
		
		String admId = (String) session.getAttribute("sessionID");
			
		LOGGER.info("$$$$$$$$세션 아이디:" + admId);
		
		AIStatistics aiVO = new AIStatistics(camName, camStatus, admId, camType, beforeDate, afterDate);
			
		return statisticsService.selectSttModelYList(aiVO);
	}
	
	// 통계 평균 조회
	@ResponseBody
	@RequestMapping(value = "/average")
	public Map<String, AIStatistics> selectStatisticsAvgList(
			@RequestParam(required=false) String camName,
			@RequestParam(required=false) String camType,
			@RequestParam(required=false) String camStatus,
			@RequestParam(required=false) String beforeDate,
			@RequestParam(required=false) String afterDate,
			HttpSession session
			) {
		
		if("ALL".equals(camType)) {
			camType = "";
		}
		
		if("ALL".equals(camStatus)) {
			camStatus = "";
		}
		
		String admId = (String) session.getAttribute("sessionID");
		
		LOGGER.info("$$$파라메터 캠페인명:" + camName + ", 캠페인 타입:" + camType + ", 캠페인 상태:" + camStatus + ", 아이디:" + admId + ", 전 날짜:" + beforeDate + ", 후 날짜:" + afterDate);
		
		AIStatistics aiVO = new AIStatistics(camName, camStatus, admId, camType, beforeDate, afterDate);
		
		AIStatistics dTreeVO = statisticsService.selectDTreeAvg(aiVO);
		AIStatistics rfVO = statisticsService.selectRFavg(aiVO);
		AIStatistics svmVO = statisticsService.selectSVMavg(aiVO);
		AIStatistics lRVO = statisticsService.selectLRavg(aiVO);
		
		LOGGER.info("###정확도:" + dTreeVO.getOriginalAccAvg() + ", 예측:" + dTreeVO.getSoAccAvg() + ", 실측:" + dTreeVO.getRealAccAvg());
		
		Map<String, AIStatistics> trainMethodMap = new HashMap<>();
		
		trainMethodMap.put("dTreeVO", dTreeVO);
		trainMethodMap.put("rfVO", rfVO);
		trainMethodMap.put("svmVO", svmVO);
		trainMethodMap.put("lRVO", lRVO);
		
		return trainMethodMap;
	}
}
