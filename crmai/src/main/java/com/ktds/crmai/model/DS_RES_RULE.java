package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("res_rule")
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
	
	
	
	public DS_RES_RULE(){
		
	}
	
	
	public DS_RES_RULE(
			String row_id,
			String created,
			String created_by,
			String last_upd,
			String last_upd_by,
			String cam_id,
			String res_1,
			String res_2,
			String res_3,
			String res_4,
			String res_pre_process,
			String desc_text) {
		
		this.row_id = row_id;
		this.created = created;
		this.created_by = created_by;
		this.last_upd = last_upd;
		this.last_upd_by = last_upd_by;
		this.cam_id = cam_id;
		this.res_1 = res_1;
		this.res_2 = res_2;
		this.res_3 = res_3;
		this.res_4 = res_4;
		this.res_pre_process = res_pre_process;
		this.desc_text = desc_text;
	}
}
