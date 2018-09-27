package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("admin")
public class AI_ADMINUSER {

	private String ADM_ID;
	private String ADM_PW;
	private String ADM_TYPE;
	private String ADM_ROLE;
	private String ADM_NAME;
	private String ADM_EMAIL;
	private String ADM_CDATE;
	private String ADM_UDATE;
	
	public AI_ADMINUSER() {
		
	}
	
	public AI_ADMINUSER(String ADM_ID, String ADM_PW, String ADM_TYPE, String ADM_ROLE, String ADM_NAME, String ADM_EMAIL, String ADM_CDATE, String ADM_UDATE) {
		this.ADM_ID = ADM_ID;
		this.ADM_PW = ADM_PW;
		this.ADM_TYPE = ADM_TYPE;
		this.ADM_ROLE = ADM_ROLE;
		this.ADM_NAME = ADM_NAME;
		this.ADM_EMAIL = ADM_EMAIL;
		this.ADM_CDATE = ADM_CDATE;
		this.ADM_UDATE = ADM_UDATE;		
	}
}
