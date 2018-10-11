package com.ktds.crmai.vo;

public class CampaignData {
	
	private int cam_id;
	private String adm_id;
	private String cam_itype;
	private String cam_ifilename;
	private String cam_otype;
	private String cam_ofilename;
	private String cam_rtype;
	private String cam_rfilename;
	private int icnum;
	
	
	public int getCam_id() {
		return cam_id;
	}
	public void setCam_id(int cam_id) {
		this.cam_id = cam_id;
	}
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	public String getCam_itype() {
		return cam_itype;
	}
	public void setCam_itype(String cam_itype) {
		this.cam_itype = cam_itype;
	}
	public String getCam_ifilename() {
		return cam_ifilename;
	}
	public void setCam_ifilename(String cam_ifilename) {
		this.cam_ifilename = cam_ifilename;
	}
	
	public String getCam_otype() {
		return cam_otype;
	}
	public void setCam_otype(String cam_otype) {
		this.cam_otype = cam_otype;
	}
	public String getCam_ofilename() {
		return cam_ofilename;
	}
	public void setCam_ofilename(String cam_ofilename) {
		this.cam_ofilename = cam_ofilename;
	}
	
	
	public String getCam_rtype() {
		return cam_rtype;
	}
	public void setCam_rtype(String cam_rtype) {
		this.cam_rtype = cam_rtype;
	}
	public String getCam_rfilename() {
		return cam_rfilename;
	}
	public void setCam_rfilename(String cam_rfilename) {
		this.cam_rfilename = cam_rfilename;
	}
	
	public int getIcnum() {
		return icnum;
	}
	public void setIcnum(int icnum) {
		this.icnum = icnum;
	}
	public String toString() {
		StringBuilder sb = new StringBuilder();
		
		sb.append("cam_id :: " + cam_id + "\n");
		sb.append("adm_id :: " + adm_id + "\n");
		sb.append("cam_itype :: " + cam_itype + "\n");
		sb.append("cam_ifilename :: " + cam_ifilename + "\n");
		sb.append("cam_otype :: " + cam_otype + "\n");
		sb.append("cam_ofilename :: " + cam_ofilename + "\n");
		sb.append("cam_rtype :: " + cam_rtype + "\n");
		sb.append("cam_rfilename :: " + cam_rfilename + "\n");
		sb.append("icnum :: " + icnum + "\n");
		
		return sb.toString();
	}
	
}
