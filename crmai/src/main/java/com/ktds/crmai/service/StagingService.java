package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.model.Pretreatment;
import com.ktds.crmai.service.impl.PretreatmentMapper;
import com.ktds.crmai.service.impl.StagingMapper;

@Service
@Transactional
public class StagingService implements StagingMapper {

	@Autowired
	StagingMapper stagingMapper;

	@Override
	public List<AI_STAGING> selectStaginTrain(AI_PAGE page) {
		// TODO Auto-generated method stub
		return stagingMapper.selectStaginTrain(page);
	}

	@Override
	public List<AI_STAGING> selectStaginTrainResult(AI_PAGE page) {
		// TODO Auto-generated method stub
		return stagingMapper.selectStaginTrainResult(page);
	}

	@Override
	public List<AI_STAGING> selectStaginTest(AI_PAGE page) {
		// TODO Auto-generated method stub
		return stagingMapper.selectStaginTest(page);
	}

	@Override
	public List<AI_STAGING> selectStaginTestResult(AI_PAGE page) {
		// TODO Auto-generated method stub
		return stagingMapper.selectStaginTestResult(page);
	}
	
	





}
