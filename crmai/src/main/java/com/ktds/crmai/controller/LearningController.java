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
import com.ktds.crmai.model.Learning_Info;
import com.ktds.crmai.model.Learning_Res;
import com.ktds.crmai.service.LearningService;

@Controller
@RequestMapping(value="/Learning")
public class LearningController {
	private static Logger logger = LoggerFactory.getLogger(LearningController.class);
	
	@Autowired
	LearningService learningService;
	
	
	@RequestMapping(value = "/info", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getLearning_info(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign){
    	logger.info("Request List....getLearning.... - {}", in_compaign);
    	List<Learning_Info> out_learning = null;
    	
    	if(in_compaign.getCam_id() != null) {
    		logger.info("##################");
    		out_learning = learningService.getLearning_info(in_compaign);
    	}
    	    	
    	logger.info("Request List....getLearning out .... - {}", out_learning);
    	Iterator<Learning_Info> ite = out_learning.iterator();
    	
    	while(ite.hasNext()) {
    		Learning_Info info = (Learning_Info)ite.next();
    		logger.info("Learning :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_learning, HttpStatus.OK);
    	
    	return response;
    }
	
	
	@RequestMapping(value = "/res", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getLearning_res(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign){
    	logger.info("Request List....getLearning.... - {}", in_compaign);
    	List<Learning_Res> out_learning = null;
    	
    	if(in_compaign.getCam_id() != null) {
    		logger.info("##################");
    		out_learning = learningService.getLearning_res(in_compaign);
    	}
    	    	
    	logger.info("Request List....getLearning out .... - {}", out_learning);
    	Iterator<Learning_Res> ite = out_learning.iterator();
    	
    	while(ite.hasNext()) {
    		Learning_Res info = (Learning_Res)ite.next();
    		logger.info("Learning :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_learning, HttpStatus.OK);
    	
    	return response;
    }

}
