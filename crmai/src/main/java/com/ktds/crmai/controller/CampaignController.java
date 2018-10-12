package com.ktds.crmai.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;

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

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.PageCriteria;
import com.ktds.crmai.model.PageMaker;
import com.ktds.crmai.service.CampaignService;


@Controller
@RequestMapping(value="/campaign")
public class CampaignController {
	private static Logger logger = LoggerFactory.getLogger(CampaignController.class);
	
	@Autowired
	CampaignService campaignService;
	
	@ResponseBody
	@RequestMapping(value="/totalPage", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
	public List<String> getTotalCampaign(HttpSession session){
		logger.info("Request TotalCampaign....");
		List<String> response = new ArrayList<String>();
		
    	String admid= (String)session.getAttribute("sessionID");
		AI_CAMPAIGN in_compaign = new AI_CAMPAIGN();
		in_compaign.setAdm_id(admid);
		
		int maxRowNum = campaignService.selectCamPageNum(in_compaign);

		if(maxRowNum == 0) {
			response.add("0");
		}else {
			response.add(maxRowNum + "");
		}
		
		logger.info("response : "+ response.get(0));
		return response;
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignListPage(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign, HttpSession session){
    	logger.info("Request List....getCampaignListPage.... - {}", in_compaign);
    	List<AI_CAMPAIGN> out_campaign = null;
    	
    	String admid= (String)session.getAttribute("sessionID");
    	in_compaign.setAdm_id(admid);
    		
    	out_campaign = campaignService.selectCampaignPage(in_compaign);
    	
    	Iterator<AI_CAMPAIGN> ite = out_campaign.iterator();
    	
    	while(ite.hasNext()) {
    		AI_CAMPAIGN cam = (AI_CAMPAIGN)ite.next();
    		logger.info("AI_CAMPAIGN :: "+ cam.toString());
    	}
    	
    	session.setAttribute("sessionCAMCNT", out_campaign.size());
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_campaign, HttpStatus.OK);
    	
    	return response;
    }
	
	
	@RequestMapping(value = "/aistatus", method = RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCampaignAiStatus(@ModelAttribute("campaign") AI_CAMPAIGN in_compaign, HttpSession session){
    	logger.info("Request List....getCampaignListPage.... - {}", in_compaign);
    	AI_CAMPAIGN out_campaign = null;
    	
    	String admid= (String)session.getAttribute("sessionID");
    	in_compaign.setAdm_id(admid);
    		
    	out_campaign = campaignService.selectCampaignAiStatus(in_compaign);
    	
    	//응답과 함깨 HttpStatus를 지정할 수 있습니다.
    	ResponseEntity<Object> response = new ResponseEntity<Object>(out_campaign, HttpStatus.OK);
    	
    	return response;
    }
	
	// 파라미터 받는 캠페인 목록의 총 갯수
	@ResponseBody
	@RequestMapping(value="/count", method=RequestMethod.GET)
	public PageMaker getCamTotalCount(
		@ModelAttribute AI_CAMPAIGN campaignParam,
		PageCriteria cri,
		HttpSession session) {
		
		logger.info("##### 캠페인 매개변수:" + campaignParam.getCam_name());
		
		String admId= (String)session.getAttribute("sessionID");
		
		campaignParam.setAdm_id(admId);
    	
    	PageMaker pageMaker = new PageMaker();
    	
    	pageMaker.setCri(cri);
    	
    	int totalCount = campaignService.selectCamCount(campaignParam);
    	
    	pageMaker.setTotalCount(totalCount);
    	
    	logger.info("$$$$$ 총 목록 수:" + totalCount + ", 디스플레이 페이지:" + pageMaker.getDisplayPageNum() + ", 페이지 총 수:" + pageMaker.getRealEndPage());
    	
    	return pageMaker;
	}
	
	// 파라미터 받는 캠페인 리스트 페이지
	@ResponseBody
	@RequestMapping(value = "/list", method=RequestMethod.GET)
    public List<AI_CAMPAIGN> getNewCampaignListPage(
    		@ModelAttribute AI_CAMPAIGN campaignParam,
    		PageCriteria cri,
    		HttpSession session){
    	
    	logger.info("Request List....getNewCampaignListPage.... - {}", campaignParam.getCam_name());
    	
    	String admId= (String)session.getAttribute("sessionID");
    	
    	campaignParam.setAdm_id(admId);
    	campaignParam.setPage(cri.getPage());
    	
    	logger.info("$$$$$$perPageNum:" + cri.getPerPageNum());
    	
    	campaignParam.setPerPageNum(cri.getPerPageNum());
    		
    	List<AI_CAMPAIGN> campaign = campaignService.selectNewCampaignPage(campaignParam);
    	
    	logger.info("NEW_AI_CAMPAIGN :: "+ campaign.toString());
    	
    	return campaign;
    }
}
