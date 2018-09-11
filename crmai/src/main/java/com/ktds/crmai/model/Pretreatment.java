package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("pretreatment")
public class Pretreatment{

	private static final long serialVersionUID = 3947489072259877540L;

	private String cam_id;
	private String name;
	private String gender;
	private String age;
	private String iptv_com_fig;
	private String non_pay_flg;
	private String internet_join_flg;
	private String mem_grade;
	private String agree_flg;
	private String res_1;
	
	public Pretreatment(){
		
	}
	
	
	public Pretreatment(
			String cam_id,
			String name,
			String gender,
			String age,
			String iptv_com_fig,
			String non_pay_flg,
			String internet_join_flg,
			String mem_grade,
			String agree_flg,
			String res_1) {
		
		this.cam_id = cam_id;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.iptv_com_fig = iptv_com_fig;
		this.non_pay_flg = non_pay_flg;
		this.internet_join_flg = internet_join_flg;
		this.mem_grade = mem_grade;
		this.agree_flg = agree_flg;
		this.res_1 = res_1;
	}
}
