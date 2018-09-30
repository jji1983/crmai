package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_STAGING_TRAIN;
import com.ktds.crmai.model.Pretreatment;

@Mapper
@Repository
public interface PretreatmentMapper {
	
	/*
	 * Name : 캠페인 All
	 */
	List<AI_CAMPAIGN> selectAllcampaign();
	
	/*
	 * Name : 캠페인  검색
	 */
	List<AI_CAMPAIGN> selectCampaign(AI_CAMPAIGN campaign);
	
	
	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING_TRAIN> selectStaginTrain(AI_CAMPAIGN campaign);
	
	/*
	 * Name : 학습전처리완료데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING_TRAIN> selectStaginTrainResult(AI_CAMPAIGN campaign);
	
}
