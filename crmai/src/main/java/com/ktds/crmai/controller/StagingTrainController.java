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
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.service.PretreatmentService;

@Controller
@RequestMapping(value="/train")
public class StagingTrainController {
	private static Logger logger = LoggerFactory.getLogger(StagingTrainController.class);
	
	@Autowired
	PretreatmentService pretreatmentService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignTrg(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign){
    	logger.info("Request List....getCampaignTrg.... - {}", in_compaign.getCam_id());
    	List<AI_STAGING> trainData = null;
    	
    	if(in_compaign.getCam_id() != null) {
    		trainData = pretreatmentService.selectStaginTrain(in_compaign);
    	}
    	if(trainData == null) {
    		logger.info("trainData is null!! :: {}", trainData);
    	}else {
    		logger.info("trainData is not null!! :: {}", trainData);
    	}
    	
    	
    	Iterator<AI_STAGING> ite = trainData.iterator();
    	
    	while(ite.hasNext()) {
    		AI_STAGING info = (AI_STAGING)ite.next();
    		logger.info("Pretreatment :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(trainData, HttpStatus.OK);
    	
    	logger.info("getCampaignTrg return");
    	
    	return response;
    }
	
	@RequestMapping(value = "/detailResult", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignTrgResult(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign){
    	logger.info("Request List....getCampaignTrgResult.... - {}", in_compaign.getCam_id());
    	List<AI_STAGING> trainData = null;
    	
    	if(in_compaign.getCam_id() != null) {
    		trainData = pretreatmentService.selectStaginTrainResult(in_compaign);
    	}
    	if(trainData == null) {
    		logger.info("trainData is null!! :: {}", trainData);
    	}else {
    		logger.info("trainData is not null!! :: {}", trainData);
    	}
    	
    	Iterator<AI_STAGING> ite = trainData.iterator();
    	
    	while(ite.hasNext()) {
    		AI_STAGING info = (AI_STAGING)ite.next();
    		logger.info("Pretreatment :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(trainData, HttpStatus.OK);
    	
    	logger.info("getCampaignTrg return");
    	
    	return response;
    }

}
