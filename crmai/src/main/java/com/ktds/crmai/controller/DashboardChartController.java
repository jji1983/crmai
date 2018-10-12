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

	// stat init
	@ResponseBody
	@RequestMapping(value = "total")
	public DashboardChartData selectTotal(@RequestParam(value = "pers", required = false) String pers,
			HttpSession session) {
		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		DashboardChartData response = dashboardChartService.selectTotal(baseData);

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "type")
	public List<DashboardChartData> selectType(@RequestParam(value = "pers", required = false) String pers,
			@RequestParam(value = "type", required = false) String type, HttpSession session) {
		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		if (type != null) {
			baseData.put("type", type);
		}

		List<DashboardChartData> response = new ArrayList<>();

		response = dashboardChartService.selectType(baseData);

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "period")
	public List<DashboardChartData> selectPeriod(@RequestParam(value = "pers", required = false) String pers,
			@RequestParam(value = "period", required = false) String period,
			@RequestParam(value = "periodBase", required = false) String periodBase, HttpSession session) {

		HashMap<String, Object> baseData = new HashMap<>();
		if (period != null) {
			baseData.put("period", period);
		}
		if (periodBase != null) {
			baseData.put("periodBase", periodBase + "");
		}
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}

		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectPeriod(baseData);

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "campaign")
	public List<DashboardChartData> selectCampaign(@RequestParam(value = "pers", required = false) String pers,
			@RequestParam(value = "campaign", required = false) String campaign, HttpSession session) {

		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		if (campaign != null) {
			baseData.put("campaign", campaign);
		}

		List<DashboardChartData> response = new ArrayList<>();
		response = dashboardChartService.selectCampaign(baseData);

		return response;
	}

	@ResponseBody
	@RequestMapping(value = "campaignTab")
	public List<AIStatistics> selectCampaignTab(@RequestParam(value = "pers", required = false) String pers,
			HttpSession session) {

		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}

		List<AIStatistics> response = new ArrayList<>();
		response = dashboardChartService.selectCampaignTab(baseData);

		return response;
	}
}
