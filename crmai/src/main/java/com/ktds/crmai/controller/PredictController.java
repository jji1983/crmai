package com.ktds.crmai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AIPredict;
import com.ktds.crmai.service.PredictService;

@Controller
@RequestMapping("/predict")
public class PredictController {
	@Autowired
	PredictService predictService;
	
	// 예측 결과 목록 조회
	@ResponseBody
	@RequestMapping(value="/list")
	public List<AIPredict> selectAllPredictList(
		@RequestParam Integer camId) {
		
		AIPredict vo = new AIPredict(camId);
		
		return predictService.selectAllPredictList(vo);
	}
}
