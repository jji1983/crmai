package com.ktds.crmai.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ktds.crmai.model.AIPredict;
import com.ktds.crmai.service.PredictService;

@Controller
@RequestMapping("/predict")
public class PredictController {
	private static Logger LOGGER = LoggerFactory.getLogger(PredictController.class);
	
	@Autowired
	PredictService predictService;
	
	// 예측 결과 목록 조회
	@RequestMapping(value="/list")
	public List<AIPredict> selectAllPredictList(
		@RequestParam Integer camId) {
		
		LOGGER.info("$$$$$캠페인 아이디:" + camId);
		
		AIPredict vo = new AIPredict(camId);
		
		List<AIPredict> predictList = predictService.selectAllPredictList(vo);
		
		LOGGER.info("$$$$$프레딕트 내용:" + predictList);
		
		return predictList;
	}
}
