package com.ktds.crmai.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * 예측 결과 VO
 */
@NoArgsConstructor
@AllArgsConstructor
public class AIPredict extends PageCriteria {
	@Getter @Setter private Integer rnum;				// 순번
	@Getter @Setter private Integer stSeq;				// 스테이징 시퀀스
	@Getter @Setter private Integer camId;				// 캠페인ID
	@Getter @Setter private String trainMethod;			// 학습모델
	@Getter @Setter private String predict;				// 예측 성공 여부
	@Getter @Setter private Double succProb;			// 성공 예측률
	@Getter @Setter private Double failProb;			// 실패 예측률
	@Getter @Setter private String stC1;				// 스테이징 컬럼1
	
	public AIPredict(Integer camId) {
		this.camId = camId;
	}
	
	public AIPredict(Integer camId, Double succProb) {
		this.camId = camId;
		this.succProb = succProb;
	};
	
	public String toString() {
		StringBuilder sb = new StringBuilder();
		
		sb.append(stSeq + ",");
		sb.append(camId + ",");
		sb.append(stC1 + ",");
		sb.append(trainMethod + ",");
		sb.append(predict + ",");
		sb.append(succProb + ",");
		sb.append(failProb + ",");
		sb.append("" + ",\n");
		
		return sb.toString();
		
	}
}
