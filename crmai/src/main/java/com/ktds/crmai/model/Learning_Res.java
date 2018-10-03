package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("learning_res")
public class Learning_Res{

	private static final long serialVersionUID = 3947489072259877540L;
	
	private String cam_id;
	private String train_method;
	private String feature_name;
	private String weight;
	
	public Learning_Res(){
		
	}
	
	public Learning_Res(
			String cam_id,
			String train_method,
			String feature_name,
			String weight) {
	
		this.cam_id = cam_id;
		this.train_method = train_method;
		this.feature_name = feature_name;
		this.weight = weight;
	}
}
