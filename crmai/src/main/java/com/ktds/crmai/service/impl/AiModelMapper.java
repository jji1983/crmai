package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_TRAIN_MODEL;

@Mapper
@Repository
public interface AiModelMapper {
	
	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_TRAIN_MODEL> selectAiTrainModel(String cam_id);
	
}
