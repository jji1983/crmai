package com.ktds.crmai.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 통계 VO
@NoArgsConstructor
@AllArgsConstructor
public class AIStatistics {
	@Getter @Setter private Integer camId;				// 캠페인 ID
	@Getter @Setter private String camName;				// 캠페인명
	@Getter @Setter private String camType;				// 캠페인 목적
	@Getter @Setter private String camStatus;			// 캠페인 상태
	@Getter @Setter private String admId;				// 생성자 ID
	@Getter @Setter private String admName;				// 생성자명
	@Getter @Setter private Integer admType;			// 산업군
	@Getter @Setter private String camCdate;			// 캠페인 생성일자
	@Getter @Setter private String trainMethod;			// 학습모델
	@Getter @Setter private Integer testCnt;			// 대상자 건수
	@Getter @Setter private Integer originalAcc;		// 정확도
	@Getter @Setter private Integer soAcc;				// 예측
	@Getter @Setter private Integer realAcc;			// 실측, 결과
	@Getter @Setter private String modelFlag;			// 선택된 모델 여부
	
	// 파라메터 방식으로만 사용
	@Getter @Setter private String beforeDate;			// 기간(이전)
	@Getter @Setter private String afterDate;			// 기간(이후)
	@Getter @Setter private BigDecimal originalAccAvg;		// 정확도 평균
	@Getter @Setter private BigDecimal soAccAvg;			// 예측 평균
	@Getter @Setter private BigDecimal realAccAvg;			// 결과 평균
	
	@Getter @Setter private Boolean realAccFlag = false;	// 통계 화면에서 실측 파라메터 추가할지 말지 여부(초기는 없는 걸로 함)
	
	public AIStatistics(String camName, String camStatus, String admId, String camType, String beforeDate,
			String afterDate, Boolean realAccFlag) {
		this.camName = camName;
		this.camStatus = camStatus;
		this.admId = admId;
		this.camType = camType;
		this.beforeDate = beforeDate;
		this.afterDate = afterDate;
		this.realAccFlag = realAccFlag;
	}
}
