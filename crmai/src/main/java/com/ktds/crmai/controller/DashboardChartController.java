package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.model.DashboardChartData;
import com.ktds.crmai.service.DashboardChartService;

@Controller
@RequestMapping(value = "/dashboardChart")
public class DashboardChartController {

	private static Logger logger = LoggerFactory.getLogger(DashboardChartController.class);

	@Autowired
	private DashboardChartService dashboardChartService;

	@ResponseBody
	@RequestMapping(value = "totalStat")
	public DashboardChartData selectTotalDataStat(HttpSession session) {

		DashboardChartData response = dashboardChartService.selectTotalDataStat();

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "myStat")
	public DashboardChartData selectMyDataStat(HttpSession session) {

		DashboardChartData response = dashboardChartService
				.selectMyDataStat((String) session.getAttribute("sessionID"));

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "totalType")
	public List<DashboardChartData> selectTotalDataType(HttpSession session) {

		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectTotalDataType();

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "myType")
	public List<DashboardChartData> selectMyDataType(HttpSession session) {

		List<DashboardChartData> response = new ArrayList<>();
		HashMap<String, Object> baseData = new HashMap<>();
		baseData.put("sessionId", (String) session.getAttribute("sessionID"));
		baseData.put("type","type");
		
		response = dashboardChartService.selectMyDataType(baseData);

		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "totalTab")
	public List<AIStatistics> selectTotalDataTab(HttpSession session) {
		
		List<AIStatistics> response = new ArrayList<>();
		response = dashboardChartService.selectTotalTab();
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "myTab")
	public List<AIStatistics> selectMyDataTab(HttpSession session) {
		
		List<AIStatistics> response = new ArrayList<>();
		response = dashboardChartService.selectMyTab((String) session.getAttribute("sessionID"));
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "totalPeriod")
	public List<DashboardChartData> selectTotalDataPeriod(@RequestParam("year") String year, HttpSession session) {
		
		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectTotalPeriod(year);
		
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "myPeriod")
	public List<DashboardChartData> selectMyDataPeriod(@RequestParam("year") String year, HttpSession session) {
		
		List<DashboardChartData> response = new ArrayList<>();
		HashMap<String, Object> baseData = new HashMap<>();
		baseData.put("sessionId", (String) session.getAttribute("sessionID"));
		baseData.put("year",year);
		
		response = dashboardChartService.selectMyPeriod(baseData);
		
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "totalCampaign")
	public List<DashboardChartData> selectTotalDataCampaign(@RequestParam("camId") String camId, HttpSession session) {
		List<DashboardChartData> response = new ArrayList<>();
		HashMap<String, Object> baseData = new HashMap<>();
		baseData.put("camId", camId);
		response = dashboardChartService.selectTotalCampaign(baseData);
		
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "myCampaign")
	public List<DashboardChartData> selectMyDataCampaign(@RequestParam("camId") String camId, HttpSession session) {
		List<DashboardChartData> response = new ArrayList<>();
		HashMap<String, Object> baseData = new HashMap<>();
		baseData.put("sessionId", (String) session.getAttribute("sessionID"));
		baseData.put("camId", camId);
		
		
		response = dashboardChartService.selectMyCampaign(baseData);
		
		
		return response;
	}

}
