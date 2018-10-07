package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AIStatistics;
import com.ktds.crmai.service.DashboardChartService;

@Controller
@RequestMapping(value = "/dashboardChart")
public class DashboardChartController {
	
	private static Logger logger = LoggerFactory.getLogger(DashboardChartController.class);
	
	@Autowired
	private DashboardChartService dashboardChartService;
	
	@ResponseBody
	@RequestMapping(value="totalData")
	public List<AIStatistics> getTotalData(HttpSession session){
		logger.info("dashboardChart getTotalData");
		
		List<AIStatistics> response = new ArrayList<>();
		
		response = dashboardChartService.selectTotalData();
		logger.info("totalData.." + response);
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="myData")
	public List<AIStatistics> getMyData(@ModelAttribute("ADM_ID") String ADM_ID, HttpSession session){
		logger.info("dashboardChart getMyData");
		
		List<AIStatistics> response = new ArrayList<>();
		
		response = dashboardChartService.selectMyData(ADM_ID);
		logger.info("totalData.." + response);
		
		return response;
	}
	
	

}
