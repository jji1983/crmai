package com.ktds.crmai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.Learning_Info;
import com.ktds.crmai.model.Learning_Res;
import com.ktds.crmai.service.impl.LearningMapper;

@Service
@Transactional
public class LearningService implements LearningMapper {

	@Autowired
	LearningMapper learningMapper;

	@Override
	public List<Learning_Info> getLearning_info(AI_CAMPAIGN campaign) {
		return learningMapper.getLearning_info(campaign);
	}

	@Override
	public List<Learning_Res> getLearning_res(AI_CAMPAIGN campaign) {
		return learningMapper.getLearning_res(campaign);
	}

}
