package com.ktds.crmai.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ktds.crmai.model.AICampaign;
import com.ktds.crmai.model.AI_CAMPAIGN;

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
	
	/*
	 * Name : 캠페인 목록(파라메터 존재)
	 */
	List<AICampaign> selectCampaignList(Map<String, Object> param);
	
}
