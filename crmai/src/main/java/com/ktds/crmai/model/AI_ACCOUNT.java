package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data 
@Alias("account") 
public class AI_ACCOUNT {

	private static final long serialVersionUID = 3947489072259877540L;

 
	private String adm_id;
	private String adm_pw;
	private String adm_name;
	private String adm_cdate;
	private String adm_email;
	//private String adm_role;
	//private String adm_type;
	//private String adm_login;

	public AI_ACCOUNT(){
		
	} 
	
	public AI_ACCOUNT(
			String adm_id,
			String adm_pw,
			String adm_name,
			String adm_cdate,
			String adm_email
	//		String adm_role,
	//		String adm_type,
	//		String adm_login
	    
			) {
		
		this.adm_id = adm_id;
		this.adm_pw = adm_pw;
		this.adm_name = adm_name;
		this.adm_cdate = adm_cdate;
		this.adm_email = adm_email;
	//	this.adm_role = adm_role;
	//	this.adm_type = adm_type;
	//	this.adm_login = adm_login;

	}

}
