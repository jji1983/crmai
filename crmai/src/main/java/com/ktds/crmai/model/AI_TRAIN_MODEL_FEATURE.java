package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data 
@Alias("Learning") 
public class AI_TRAIN_MODEL_FEATURE {

	private static final long serialVersionUID = 3947489072259877540L;

	private String cam_id;
	private String train_method;
	private String feature_name;
	private String weight;

	public AI_TRAIN_MODEL_FEATURE(){
		
	} 
	
	public AI_TRAIN_MODEL_FEATURE(
			String cam_id,
			String train_method,
			String feature_name,
			String weight
	    ) {
		
		this.cam_id = cam_id;
		this.train_method = train_method;
		this.feature_name = feature_name;
		this.weight = weight;

	}

}
