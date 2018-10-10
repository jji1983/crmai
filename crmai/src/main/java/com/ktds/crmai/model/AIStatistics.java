package com.ktds.crmai.model;

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
	@Getter @Setter private String camStatus;			// 캠페인 상태
	@Getter @Setter private String admId;				// 생성자 ID
	@Getter @Setter private String admName;				// 생성자명
	@Getter @Setter private String camType;				// 캠페인 목적
	@Getter @Setter private String camCdate;			// 캠페인 생성일자
	@Getter @Setter private Integer admType;			// 산업군
	@Getter @Setter private String trainMethod;			// 학습모델
	@Getter @Setter private Integer originalAcc;		// 정확도
	@Getter @Setter private Integer soAcc;				// 예측
	@Getter @Setter private Integer realAcc;			// 실측, 결과
	@Getter @Setter private String modelFlag;			// 선택된 모델 여부
	@Getter @Setter private Integer testCnt;			// 대상자 건수
	
	// 파라메터 방식으로만 사용
	@Getter @Setter private String beforeDate;			// 기간(이전)
	@Getter @Setter private String afterDate;			// 기간(이후)
	@Getter @Setter private Double originalAccAvg;		// 정확도 평균
	@Getter @Setter private Double soAccAvg;			// 예측 평균
	@Getter @Setter private Double realAccAvg;			// 결과 평균
	
	public AIStatistics(String camName, String camStatus, String admName, String camType, String beforeDate,
			String afterDate) {
		this.camName = camName;
		this.camStatus = camStatus;
		this.admName = admName;
		this.camType = camType;
		this.beforeDate = beforeDate;
		this.afterDate = afterDate;
	}
}
