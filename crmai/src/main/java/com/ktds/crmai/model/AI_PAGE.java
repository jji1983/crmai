package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("page")
public class AI_PAGE{

	private String page;
	private String page_st;
	private String page_end;
	private String cam_id;
	private String succVal;
	private String totalVal;
	
	public AI_PAGE(){
		
	}
	
	public AI_PAGE(
			String page,
			String page_st,
			String page_end,
			String cam_id,
			String succVal,
			String totalVal

	    ) {
		
		this.page=page;
		this.page_st=page_st;
		this.page_end=page_end;
		this.cam_id=cam_id;
		
		this.succVal=succVal;
		this.totalVal=totalVal;
		
	}
}
