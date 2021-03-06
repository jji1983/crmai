package com.ktds.crmai.service.impl;

import java.util.List;
import java.util.Map;

import com.ktds.crmai.model.AIPredict;

public interface PredictMapper {

	List<AIPredict> selectAllPredictList(AIPredict vo);

	Integer selectPredictCnt(Map<String, Object> param);

	List<AIPredict> selectPredictList(Map<String, Object> param);

	List<AIPredict> getPredictDown(Map<String, Object> param);
}
