package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		logger.info("dashboardChart selectTotalDataStat");

		DashboardChartData response = dashboardChartService.selectTotalDataStat();

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "myStat")
	public DashboardChartData selectMyDataStat(HttpSession session) {
		logger.info("dashboardChart selectMyDataStat");

		DashboardChartData response = dashboardChartService
				.selectMyDataStat((String) session.getAttribute("sessionID"));

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "totalType")
	public List<DashboardChartData> selectTotalDataType(HttpSession session) {
		logger.info("dashboardChart selectTotalDataType");

		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectTotalDataType();

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "myType")
	public List<DashboardChartData> selectMyDataType(HttpSession session) {
		logger.info("dashboardChart selectMyDataType");

		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectMyDataType((String) session.getAttribute("sessionID"));

		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "totalCam")
	public List<AIStatistics> selectTotalDataTab(HttpSession session) {
		logger.info("dashboardChart selectTotalDataTab");
		
		List<AIStatistics> response = new ArrayList<>();
		response = dashboardChartService.selectTotalTab();
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "myCam")
	public List<AIStatistics> selectMyDataTab(HttpSession session) {
		logger.info("dashboardChart selectMyDataTab");
		
		List<AIStatistics> response = new ArrayList<>();
		response = dashboardChartService.selectMyTab((String) session.getAttribute("sessionID"));
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "totalPeriod")
	public List<DashboardChartData> selectTotalDataPeriod(HttpSession session) {
		logger.info("dashboardChart selectTotalDataPeriod");
		
		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectTotalPeriod();
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "myPeriod")
	public List<DashboardChartData> selectMyDataPeriod(HttpSession session) {
		logger.info("dashboardChart selectMyDataPeriod");
		
		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectMyPeriod((String) session.getAttribute("sessionID"));
		System.out.println(response);
		
		return response;
	}

}
