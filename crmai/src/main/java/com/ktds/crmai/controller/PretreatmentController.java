package com.ktds.crmai.controller;

import java.util.Iterator;
import java.util.List;

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

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.Pretreatment;
import com.ktds.crmai.service.PretreatmentService;


@Controller
@RequestMapping(value="/Pretreatment")
public class PretreatmentController {
	private static Logger logger = LoggerFactory.getLogger(PretreatmentController.class);
	
	@Autowired
	PretreatmentService pretreatmentService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignList(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign){
    	logger.info("Request List....getCampaignList.... - {}", in_compaign);
    	List<AI_CAMPAIGN> out_campaign = null;
    	
    	if(in_compaign.getCam_name() != null 
    			|| in_compaign.getAdm_id() != null
    			|| in_compaign.getCam_type() != null
    			|| in_compaign.getCam_status() != null) {
    		
    		out_campaign = pretreatmentService.selectCampaign(in_compaign);
    	}else {
    		
    		out_campaign = pretreatmentService.selectAllcampaign();
    	}
    	
    	Iterator<AI_CAMPAIGN> ite = out_campaign.iterator();
    	
    	while(ite.hasNext()) {
    		AI_CAMPAIGN cam = (AI_CAMPAIGN)ite.next();
    		logger.info("DS_CAMPAIGN :: "+ cam.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_campaign, HttpStatus.OK);
    	
    	return response;
    }
	
	@RequestMapping(value = "/info", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignTrg(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign){
    	logger.info("Request List....getCampaignTrg.... - {}", in_compaign);
    	List<Pretreatment> out_campaign = null;
    	
    	if(in_compaign.getAdm_id() != null) {
//    		out_campaign = pretreatmentService.selectCampaign(in_compaign);
    	}
    	
    	Iterator<Pretreatment> ite = out_campaign.iterator();
    	
    	while(ite.hasNext()) {
    		Pretreatment info = (Pretreatment)ite.next();
    		logger.info("Pretreatment :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_campaign, HttpStatus.OK);
    	
    	return response;
    }

}