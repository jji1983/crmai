package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("account")
@NoArgsConstructor
@AllArgsConstructor
public class AI_ACCOUNT {
	private static final long serialVersionUID = 3947489072259877540L;
	private String adm_id;
	private String adm_pw;
	private String adm_name;
	private String adm_cdate;
	private String adm_email;
	// private String adm_role;
	private String adm_type;
	// private String adm_login;
}
