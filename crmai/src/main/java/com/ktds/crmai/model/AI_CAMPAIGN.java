package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("campaign")
public class AI_CAMPAIGN{

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
	private String cam_iviewname;
	private String cam_idate;
	private String cam_otype;
	private String cam_otablename;
	private String cam_cdate;
	private String cam_desc;
	private String cam_msg;
	
	
	public AI_CAMPAIGN(){
		
	}
	
	
	public AI_CAMPAIGN(
			int page_st,
			int page_end,
			String cam_seq,
			String cam_id,
			String cam_name,
			String adm_id,
			String cam_type,
			String cam_autoyn,
			String cam_status,
			String cam_itype,
			String cam_icnum,
			String cam_ifilename,
			String cam_iviewname,
			String cam_idate,
			String cam_otype,
			String cam_otablename,
			String cam_cdate,
			String cam_desc,
			String cam_msg
	    ) {
		this.page_st = page_st;
		this.page_end = page_end;
		this.cam_seq = cam_seq;
		this.cam_id = cam_id;
		this.cam_name = cam_name;
		this.adm_id = adm_id;
		this.cam_type = cam_type;
		this.cam_autoyn = cam_autoyn;
		this.cam_status = cam_status;
		this.cam_itype = cam_itype;
		this.cam_icnum = cam_icnum;
		this.cam_ifilename = cam_ifilename;
		this.cam_iviewname = cam_iviewname;
		this.cam_idate = cam_idate;
		this.cam_otype = cam_otype;
		this.cam_otablename = cam_otablename;
		this.cam_cdate = cam_cdate;
		this.cam_desc = cam_desc;
		this.cam_msg = cam_msg;
	}
}
