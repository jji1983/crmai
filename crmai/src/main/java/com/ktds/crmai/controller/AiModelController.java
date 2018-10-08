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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_TRAIN_MODEL;
import com.ktds.crmai.service.AiModelService;

@Controller
@RequestMapping(value="/model")
public class AiModelController {

	private static Logger logger = LoggerFactory.getLogger(AiModelController.class);
	
	@Autowired
	AiModelService aiModelService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getModel(@ModelAttribute("page") AI_PAGE page){
    	logger.info("Request List....getModel.... - {}", page);
    	List<AI_TRAIN_MODEL> out_model = null;
    	
    	out_model = aiModelService.selectAiTrainModel(page.getCam_id());
    	
    	Iterator<AI_TRAIN_MODEL> ite = out_model.iterator();
    	
    	while(ite.hasNext()) {
    		AI_TRAIN_MODEL info = (AI_TRAIN_MODEL)ite.next();
    		logger.info("train :: "+ info.toString());
    	}
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_model, HttpStatus.OK);
    	
    	return response;
    }
	
	@ResponseBody
	@RequestMapping(value="/learn", method=RequestMethod.GET)
	public List<AI_TRAIN_MODEL> getNewModelList(@RequestParam String cam_id) {
		logger.info("$$$$$ 캠페인 아이디:" + cam_id);
		
		return aiModelService.selectAiTrainModel(cam_id);
	}
}
