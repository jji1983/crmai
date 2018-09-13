package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("admin")
public class ADMIN_USER {

	private String ADM_ID;
	private String ADM_PW;
	private String ADM_ROLE;
	private String ADM_NAME;
	private String ADM_EMAIL;
	private String ADM_CDATE;
	private String ADM_UDATE;
	
	public ADMIN_USER() {
		
	}
	
	public ADMIN_USER(String ADM_ID, String ADM_PW, String ADM_ROLE, String ADM_NAME, String ADM_EMAIL, String ADM_CDATE, String ADM_UDATE) {
		this.ADM_ID = ADM_ID;
		this.ADM_PW = ADM_PW;
		this.ADM_ROLE = ADM_ROLE;
		this.ADM_NAME = ADM_NAME;
		this.ADM_EMAIL = ADM_EMAIL;
		this.ADM_CDATE = ADM_CDATE;
		this.ADM_UDATE = ADM_UDATE;		
	}
}
