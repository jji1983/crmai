package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("learning_info")
public class Learning_Info{

	private static final long serialVersionUID = 3947489072259877540L;

	
	private String learn_name;
	private String desc_text;
	private String model_prob;
	private String succ_prob;
	private String fail_prob;
	
	
	public Learning_Info(){
		
	}
	
	public Learning_Info(
			String learn_name,
			String desc_text,
			String model_prob,
			String succ_prob,
			String fail_prob
            ) {
		
		this.learn_name = learn_name;
		this.desc_text = desc_text;
		this.model_prob = model_prob;
		this.succ_prob = succ_prob;
		this.fail_prob = fail_prob;
		
	}
}
