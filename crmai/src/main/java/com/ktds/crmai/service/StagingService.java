package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.service.impl.StagingMapper;

@Service
@Transactional
public class StagingService implements StagingMapper {

	@Autowired
	StagingMapper stagingMapper;
	
	@Override
	public Integer selectStagingTrainCnt(AI_STAGING staging) {
		return stagingMapper.selectStagingTrainCnt(staging);
	}

	@Override
	public Integer selectStagingTrainResultCnt(AI_STAGING staging) {
		return stagingMapper.selectStagingTrainResultCnt(staging);
	}

	@Override
	public Integer selectStagingTestCnt(AI_STAGING staging) {
		return selectStagingTestCnt(staging);
	}

	@Override
	public Integer selectStagingTestResultCnt(AI_STAGING staging) {
		return selectStagingTestResultCnt(staging);
	}

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

	@Override
	public List<AI_STAGING> selectTestPredict(AI_PAGE page) {
		// TODO Auto-generated method stub
		return stagingMapper.selectTestPredict(page);
	}

	@Override
	public List<AI_STAGING> selectStagingTrainList(AI_STAGING staging) {
		return stagingMapper.selectStagingTrainList(staging);
	}

	@Override
	public List<AI_STAGING> selectStagingTrainResultList(AI_STAGING staging) {
		return stagingMapper.selectStagingTrainResultList(staging);
	}

	@Override
	public List<AI_STAGING> selectStagingTestList(AI_STAGING staging) {
		return stagingMapper.selectStagingTestList(staging);
	}

	@Override
	public List<AI_STAGING> selectStagingTestResultList(AI_STAGING staging) {
		return stagingMapper.selectStagingTestResultList(staging);
	}
}
