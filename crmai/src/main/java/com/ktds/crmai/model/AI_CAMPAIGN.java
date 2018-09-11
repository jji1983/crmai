package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("campaign")
public class AI_CAMPAIGN{

	private static final long serialVersionUID = 3947489072259877540L;

	private String cam_id;
	private String cam_name;
	private String adm_id;
	private String cam_itype;
	private String cam_ifilename;
	private String cam_iviewname;
	private String cam_idate;
	private String cam_otype;
	private String cam_otablename;
	private String cam_cdate;
	private String cam_desc;
	
	
	public AI_CAMPAIGN(){
		
	}
	
	
	public AI_CAMPAIGN(
			String cam_id,
			String cam_name,
			String adm_id,
			String cam_itype,
			String cam_ifilename,
			String cam_iviewname,
			String cam_idate,
			String cam_otype,
			String cam_otablename,
			String cam_cdate,
			String cam_desc
	    ) {
		
		this.cam_id = cam_id;
		this.cam_name = cam_name;
		this.adm_id = adm_id;
		this.cam_itype = cam_itype;
		this.cam_ifilename = cam_ifilename;
		this.cam_iviewname = cam_iviewname;
		this.cam_idate = cam_idate;
		this.cam_otype = cam_otype;
		this.cam_otablename = cam_otablename;
		this.cam_cdate = cam_cdate;
		this.cam_desc = cam_desc;
	}
}
