package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_STAGING_TRAIN;
import com.ktds.crmai.model.Pretreatment;
import com.ktds.crmai.service.impl.PretreatmentMapper;

@Service
@Transactional
public class PretreatmentService implements PretreatmentMapper {

	@Autowired
	PretreatmentMapper pretreatmentMapper;
	
	
	@Override
	public List<AI_CAMPAIGN> selectAllcampaign() {
		return pretreatmentMapper.selectAllcampaign();
	}


	@Override
	public List<AI_CAMPAIGN> selectCampaign(AI_CAMPAIGN campaign) {
		return pretreatmentMapper.selectCampaign(campaign);
	}


	@Override
	public List<AI_STAGING_TRAIN> selectStaginTrain(AI_CAMPAIGN campaign) {
		// TODO Auto-generated method stub
		return pretreatmentMapper.selectStaginTrain(campaign);
	}


	@Override
	public List<AI_STAGING_TRAIN> selectStaginTrainResult(AI_CAMPAIGN campaign) {
		// TODO Auto-generated method stub
		return pretreatmentMapper.selectStaginTrainResult(campaign);
	}





}
