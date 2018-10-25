package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("campaign")
@NoArgsConstructor
@AllArgsConstructor
public class AI_CAMPAIGN extends PageCriteria {
	private static final long serialVersionUID = 3947489072259877540L;
	private int page_st;
	private int page_end;
	private String cam_seq;
	private String cam_id;
	private String cam_name;
	private String adm_id;
	private String cam_type;
	private String cam_autoyn;
	private String cam_status;
	private String cam_itype;
	private String cam_icnum;
	private String cam_ifilename;
	private String cam_idate;
	private String cam_otype;
	private String cam_ofilename;
	private String cam_rtype;
	private String cam_rfilename;
	private String cam_cdate;
	private String cam_desc;
	private String cam_msg;

	public AI_CAMPAIGN(String cam_name, String adm_id, String cam_type, String cam_status) {
		this.cam_name = cam_name;
		this.adm_id = adm_id;
		this.cam_type = cam_type;
		this.cam_status = cam_status;
	}
}
