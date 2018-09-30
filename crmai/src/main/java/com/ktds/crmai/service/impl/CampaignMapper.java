package com.ktds.crmai.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.model.AI_STAGING_TRAIN;
import com.ktds.crmai.model.Pretreatment;

@Mapper
@Repository
public interface CampaignMapper {
	/*
	 * Name : 캠페인  정보 검색
	 */
	List<AI_CAMPAIGN> selectCampaignPage(AI_CAMPAIGN campaign);
	
	/*
	 * Name : 캠페인  정보 검색
	 */
	int selectCamPageNum(AI_CAMPAIGN campaign);
	
	
	/*
	 * Name : 캠페인 SEQ 가져오기
	 */
	AI_CAMPAIGN selectCampaignSeq();

	/*
	 * Name : 캠페인  정보 검색
	 */
	AI_CAMPAIGN selectCampaignAiStatus(AI_CAMPAIGN campaign);
	
	/*
	 * Name : 캠페인 Insert
	 */
	void insertCampaign(AI_CAMPAIGN campaign);
	
	

	
}
