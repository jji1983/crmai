package com.ktds.crmai.service.impl;

import java.util.List;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_STAGING;

public interface PretreatmentMapper {

	/*
	 * Name : 캠페인 All
	 */
	List<AI_CAMPAIGN> selectAllcampaign();

	/*
	 * Name : 캠페인 검색
	 */
	List<AI_CAMPAIGN> selectCampaign(AI_CAMPAIGN campaign);

	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTrain(AI_CAMPAIGN campaign);

	/*
	 * Name : 학습전처리완료데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTrainResult(AI_CAMPAIGN campaign);
}
