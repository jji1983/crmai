package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_TRAIN_MODEL;
import com.ktds.crmai.service.impl.AiModelMapper;

@Service
@Transactional
public class AiModelService implements AiModelMapper {

	@Autowired
	AiModelMapper aiModelMapper;

	@Override
	public List<AI_TRAIN_MODEL> selectAiTrainModel(String cam_id) {
		return aiModelMapper.selectAiTrainModel(cam_id);
	}
}
