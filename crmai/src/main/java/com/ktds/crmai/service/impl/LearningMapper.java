package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_BOARD;
import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_TRAIN_MODEL;
import com.ktds.crmai.model.Learning_Info;
import com.ktds.crmai.model.Learning_Res;
import com.ktds.crmai.model.AI_TRAIN_MODEL_FEATURE;

@Mapper
@Repository
public interface LearningMapper {
	
	/*
	 * Name : 학습데이터 검색
	 */
	List<Learning_Info> getLearning_info(AI_CAMPAIGN campaign);
	
	List<Learning_Res> getLearning_res(AI_CAMPAIGN campaign);
	
	List<AI_TRAIN_MODEL_FEATURE> getLearning_feature(AI_CAMPAIGN campaign);
}
