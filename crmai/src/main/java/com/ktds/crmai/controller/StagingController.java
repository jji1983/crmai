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
    	List<AI_CAMPAIGN> out_campaign = null;

    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(null, HttpStatus.OK);
    	
    	return response;
    }
	
	
}
