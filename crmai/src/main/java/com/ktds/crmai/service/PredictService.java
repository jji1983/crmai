package com.ktds.crmai.service;

import java.util.List;

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
}
