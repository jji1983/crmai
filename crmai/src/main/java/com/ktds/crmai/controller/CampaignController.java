package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_ADMINUSER;
import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_STAGING_TRAIN;
import com.ktds.crmai.model.Pretreatment;
import com.ktds.crmai.service.CampaignService;
import com.ktds.crmai.service.PretreatmentService;


@Controller
@RequestMapping(value="/campaign")
public class CampaignController {
	private static Logger logger = LoggerFactory.getLogger(CampaignController.class);
	
	@Autowired
	CampaignService campaignService;
	
	@ResponseBody
	@RequestMapping(value="/totalPage", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
	public List<String> getTotalCampaign(HttpSession session){
		logger.info("Request TotalCampaign....");
		List<String> response = new ArrayList<String>();
		
    	String admid= (String)session.getAttribute("sessionID");
		AI_CAMPAIGN in_compaign = new AI_CAMPAIGN();
		in_compaign.setAdm_id(admid);
		
		int maxRowNum = campaignService.selectCamPageNum(in_compaign);

		if(maxRowNum == 0) {
			response.add("0");
		}else {
			response.add(maxRowNum + "");
		}
		
		logger.info("response : "+ response.get(0));
		return response;
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignListPage(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign, HttpSession session){
    	logger.info("Request List....getCampaignListPage.... - {}", in_compaign);
    	List<AI_CAMPAIGN> out_campaign = null;
    	
    	String admid= (String)session.getAttribute("sessionID");
    	in_compaign.setAdm_id(admid);
    		
    	out_campaign = campaignService.selectCampaignPage(in_compaign);
    	
    	Iterator<AI_CAMPAIGN> ite = out_campaign.iterator();
    	
    	while(ite.hasNext()) {
    		AI_CAMPAIGN cam = (AI_CAMPAIGN)ite.next();
    		logger.info("AI_CAMPAIGN :: "+ cam.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_campaign, HttpStatus.OK);
    	
    	return response;
    }
	
	
	@RequestMapping(value = "/aistatus", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignAiStatus(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign, HttpSession session){
    	logger.info("Request List....getCampaignListPage.... - {}", in_compaign);
    	AI_CAMPAIGN out_campaign = null;
    	
    	String admid= (String)session.getAttribute("sessionID");
    	in_compaign.setAdm_id(admid);
    		
    	out_campaign = campaignService.selectCampaignAiStatus(in_compaign);
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_campaign, HttpStatus.OK);
    	
    	return response;
    }
	

}
