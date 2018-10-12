package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_CAMPAIGN;
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
	
	/*
	 * Name : 학습데이터 결과 및 중요도(조인 안 한 단순 목록 조회, 쓸데없이 조인하면 성능 떨어짐)
	 */
	List<Learning_Info> getLearningResultList(String cam_id);
	
	List<Learning_Res> getLearningWeighting(String cam_id);
}
