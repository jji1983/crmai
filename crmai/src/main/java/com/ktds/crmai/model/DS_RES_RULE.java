package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("res_rule")
@NoArgsConstructor
@AllArgsConstructor
public class DS_RES_RULE{
	private static final long serialVersionUID = 3947489072259877540L;
	private String row_id;
	private String created;
	private String created_by;
	private String last_upd;
	private String last_upd_by;
	private String cam_id;
	private String res_1;
	private String res_2;
	private String res_3;
	private String res_4;
	private String res_pre_process;
	private String desc_text;
}
