package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("chartData")
public class DashboardChartData {
	private String totalBase;
	private int totalCount;
	private float totalOriginal;
	private float totalSo;
	private float totalReal;
	public DashboardChartData(String totalBase, int totalCount, float totalOriginal, float totalSo, float totalReal) {
		this.totalCount = totalCount;
		this.totalOriginal = totalOriginal;
		this.totalSo = totalSo;
		this.totalReal = totalReal;
	}
	public DashboardChartData() {
	}
}
