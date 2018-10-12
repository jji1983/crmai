package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("chartData")
public class DashboardChartData {
	private int dataType;
	private String totalBase;
	private String baseValue;
	private int totalCount;
	private float totalOriginal;
	private float totalSo;
	private float totalReal;

	public DashboardChartData(int dataType, String totalBase, String baseValue, int totalCount, float totalOriginal,
			float totalSo, float totalReal) {
		this.dataType = dataType;
		this.totalBase = totalBase;
		this.baseValue = baseValue;
		this.totalCount = totalCount;
		this.totalOriginal = totalOriginal;
		this.totalSo = totalSo;
		this.totalReal = totalReal;
	}

	public DashboardChartData() {
	}

}
