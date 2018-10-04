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
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.service.StagingService;

@Controller
@RequestMapping(value="/staging")
public class StagingController {
	private static Logger logger = LoggerFactory.getLogger(StagingController.class);

	
	@Autowired
	StagingService stagingService;
	
	@RequestMapping(value = "/train", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getTrain(@ModelAttribute("page") AI_PAGE page){
    	logger.info("Request List....getTrain.... - {}", page);
    	List<AI_STAGING> out_train = null;
    	
    	out_train = stagingService.selectStaginTrain(page);
    	
    	Iterator<AI_STAGING> ite = out_train.iterator();
    	
    	while(ite.hasNext()) {
    		AI_STAGING info = (AI_STAGING)ite.next();
    		logger.info("train :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_train, HttpStatus.OK);
    	
    	return response;
    }
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getTest(@ModelAttribute("page") AI_PAGE page){
    	logger.info("Request List....getTest.... - {}", page);
    	List<AI_STAGING> out_test = null;
    	
    	out_test = stagingService.selectStaginTest(page);
    	
    	Iterator<AI_STAGING> ite = out_test.iterator();
    	
    	while(ite.hasNext()) {
    		AI_STAGING info = (AI_STAGING)ite.next();
    		logger.info("test :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_test, HttpStatus.OK);
    	
    	return response;
    }
	
	
	@RequestMapping(value = "/result", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getResult(@ModelAttribute("page") AI_PAGE page){
    	logger.info("Request List....getResult.... - {}", page);
    	List<AI_STAGING> out_test = null;
    	
    	if(page.getPage().equals("1")) {
    		out_test = stagingService.selectStaginTrain(page);
    	}else if(page.getPage().equals("2")) {
    		out_test = stagingService.selectStaginTest(page);
    	}else if(page.getPage().equals("3")) {
    		out_test = stagingService.selectStaginTrainResult(page);
    	}else if(page.getPage().equals("4")) {
    		out_test = stagingService.selectStaginTestResult(page);
    	}
    	
    	
    	
    	Iterator<AI_STAGING> ite = out_test.iterator();
    	
    	while(ite.hasNext()) {
    		AI_STAGING info = (AI_STAGING)ite.next();
    		logger.info("test :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_test, HttpStatus.OK);
    	
    	return response;
    }
	
	@RequestMapping(value = "/predict", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getPredict(@ModelAttribute("page") AI_PAGE page){
    	logger.info("Request List....getPredict.... - {}", page);
    	List<AI_STAGING> out_test = null;
    	
    
    	out_test = stagingService.selectTestPredict(page);
    	
    	Iterator<AI_STAGING> ite = out_test.iterator();
    	
    	while(ite.hasNext()) {
    		AI_STAGING info = (AI_STAGING)ite.next();
    		logger.info("test :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_test, HttpStatus.OK);
    	
    	return response;
    }
	
	
}
