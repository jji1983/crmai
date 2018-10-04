package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AIPredict;

public interface PredictMapper {
	List<AIPredict> selectAllPredictList(AIPredict vo);
}
