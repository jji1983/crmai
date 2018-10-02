package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_PAGE;
import com.ktds.crmai.model.AI_STAGING;
import com.ktds.crmai.model.Pretreatment;

@Mapper
@Repository
public interface StagingMapper {
	
	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTrain(AI_PAGE page);
	
	/*
	 * Name : 학습전처리완료데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTrainResult(AI_PAGE page);
	
}
