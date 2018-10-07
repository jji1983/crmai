package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("dashboardChart")
public class DashboardChart {
	private int totalCount;
	private float totalOriginal;
	private float totalSo;
	private float totalReal;
	public DashboardChart(int totalCount, float totalOriginal, float totalSo, float totalReal) {
		super();
		this.totalCount = totalCount;
		this.totalOriginal = totalOriginal;
		this.totalSo = totalSo;
		this.totalReal = totalReal;
	}
	public DashboardChart() {
	}
}
