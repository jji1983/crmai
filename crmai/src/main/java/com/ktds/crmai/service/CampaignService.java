package com.ktds.crmai.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AICampaign;
import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.service.impl.CampaignMapper;

@Service
@Transactional
public class CampaignService implements CampaignMapper {

	@Autowired
	CampaignMapper campaignMapper;
	
	@Override
	public List<AI_CAMPAIGN> selectCampaignPage(AI_CAMPAIGN campaign) {
		return campaignMapper.selectCampaignPage(campaign);
	}

	@Override
	public int selectCamPageNum(AI_CAMPAIGN campaign) {
		// TODO Auto-generated method stub
		return campaignMapper.selectCamPageNum(campaign);
	}
	
	@Override
	public AI_CAMPAIGN selectCampaignSeq() {
		// TODO Auto-generated method stub
		return campaignMapper.selectCampaignSeq();
	}

	@Override
	public AI_CAMPAIGN selectCampaignAiStatus(AI_CAMPAIGN campaign) {
		// TODO Auto-generated method stub
		return campaignMapper.selectCampaignAiStatus(campaign);
	}

	
	@Override
	public void insertCampaign(AI_CAMPAIGN campaign) {
		campaignMapper.insertCampaign(campaign);
		
	}

	@Override
	public List<AICampaign> selectCampaignList(Map<String, Object> param) {
		return campaignMapper.selectCampaignList(param);
	}
}
