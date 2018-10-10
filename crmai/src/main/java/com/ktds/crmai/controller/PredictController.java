package com.ktds.crmai.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AIPredict;
import com.ktds.crmai.model.PageCriteria;
import com.ktds.crmai.model.PageMaker;
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
	
	// 파라메터 입력한 예측 결과의 총 목록 수
	@ResponseBody
	@RequestMapping(value="/count")
	public PageMaker selectPredictCnt(
		@RequestParam Integer camId,
		@ModelAttribute("cri") PageCriteria cri) {
		
		PageMaker pageMaker = new PageMaker();
    	
		LOGGER.info("##### 예상 페이지:" + cri.getPage() + ", 예상 페이지 당 수:" + cri.getPerPageNum() + ", 예상 페이지 시작:" + cri.getListStart());
		
    	pageMaker.setCri(cri);
		
		Integer predictCnt = predictService.selectPredictCnt(camId);
		
		pageMaker.setTotalCount(predictCnt);
		
		LOGGER.info("$$$$$ 예상 결과 총 목록 수:" + predictCnt + ", 예상 결과 디스플레이 페이지:" + pageMaker.getDisplayPageNum() + ", 예상 결과 페이지 총 수:" + pageMaker.getRealEndPage());
		
		return pageMaker;
	}
	
	// 페이징 처리된 예측 결과 목록 조회
	@ResponseBody
	@RequestMapping(value="/paging")
	public List<AIPredict> selectPagingPredictList(
		@RequestParam Integer camId,
		@RequestParam(required=false) Integer page) {
		
		LOGGER.info("$$$$$$클릭한 페이지:" + page);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("camId", camId);
		
		PageCriteria cri = new PageCriteria();
		
		cri.setPage(page);
		cri.setPerPageNum(5);
		
		paramMap.put("camId", camId);
		paramMap.put("listStart", cri.getListStart());
		paramMap.put("listEnd", cri.getListEnd());
		
		List<AIPredict> predictList = predictService.selectPredictList(paramMap);
		
		LOGGER.info("$$$$$$프레딕트 목록:" + predictList);
		
		return predictList;
	}
}
