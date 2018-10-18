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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.model.PageCriteria;
import com.ktds.crmai.model.PageMaker;
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
    
    	
    	logger.info("######....getPredict.... - {}", page);
    	
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
	
	// 값에 따른 선택에 의한 전처리 목록 총 갯수 가져오기
	@ResponseBody
	@RequestMapping(value="/count", method=RequestMethod.GET)
	public PageMaker getPreprocessCount(
		@ModelAttribute AI_STAGING staging,
		PageCriteria cri) {
		
		PageMaker pageMaker = new PageMaker();
    	
    	pageMaker.setCri(cri);
    	
    	Integer totalCount = 0;
    	
    	switch (staging.getStatusFlag()) {
			// 학습 데이터 처리 전
    		case 1:
    			totalCount = stagingService.selectStagingTrainCnt(staging);
				
				break;
			// 대상자 데이터 처리 전
			case 2:
				totalCount = stagingService.selectStagingTestCnt(staging);
				
				break;
			// 학습 데이터 처리 후
			case 3:
				totalCount = stagingService.selectStagingTrainResultCnt(staging);
				
				break;
			// 대상자 데이터 처리 후
			case 4:
				totalCount = stagingService.selectStagingTestResultCnt(staging);
				
				break;
			default:
				break;
		}
    	
    	pageMaker.setTotalCount(totalCount);
    	
    	logger.info("$$$$$ 총 목록 수:" + totalCount + ", 디스플레이 페이지:" + pageMaker.getDisplayPageNum() + ", 페이지 총 수:" + pageMaker.getRealEndPage());
    	
    	return pageMaker;
	}
	
	// 전처리 목록 가져오기(다른 방식, 수동에 사용)
	@ResponseBody
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public List<AI_STAGING> getPreprocessList(
		@ModelAttribute AI_STAGING stagingParam,
		PageCriteria cri) {
		
		stagingParam.setPage(cri.getPage());
		stagingParam.setPerPageNum(cri.getPerPageNum());
		
		logger.info("$$$$$$페이지:" + cri.getPage() + ", 페이지당 목록 수:" + cri.getPerPageNum());
		
		List<AI_STAGING> staging = null;
		
		switch (stagingParam.getStatusFlag()) {
			// 학습 데이터 처리 전
			case 1:
				staging = stagingService.selectStagingTrainList(stagingParam);
				
				break;
			// 대상자 데이터 처리 전
			case 2:
				staging = stagingService.selectStagingTestList(stagingParam);
				
				break;
			// 학습 데이터 처리 후
			case 3:
				staging = stagingService.selectStagingTrainResultList(stagingParam);
				
				break;
			// 대상자 데이터 처리 후
			case 4:
				staging = stagingService.selectStagingTestResultList(stagingParam);
				
				break;
			default:
				break;
		}
		
		logger.info("$$$$$스테이징 :: " + staging.toString());
		
		return staging;
	}
}
