package com.ktds.crmai.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.crmai.model.AIPredict;
import com.ktds.crmai.service.impl.PredictMapper;

@Service
public class PredictService implements PredictMapper {

	@Autowired
	PredictMapper predictMapper;
	
	@Override
	public List<AIPredict> selectAllPredictList(AIPredict vo) {
		return predictMapper.selectAllPredictList(vo);
	}
	
	@Override
	public Integer selectPredictCnt(Integer camId) {
		return predictMapper.selectPredictCnt(camId);
	}

	@Override
	public List<AIPredict> selectPredictList(Map<String, Object> param) {
		return predictMapper.selectPredictList(param);
	}
}
