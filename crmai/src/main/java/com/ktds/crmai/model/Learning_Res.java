package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("learning_res")
public class Learning_Res{

	private static final long serialVersionUID = 3947489072259877540L;
	private String learn_name;
	private String name;
	private String created;
	private String last_upd;
	private String model_dir;
	
	public Learning_Res(){
		
	}
	
	public Learning_Res(
			String learn_name,
			String name,
			String created,
			String last_upd,
			String model_dir) {
	
		this.learn_name = learn_name;
		this.name = name;
		this.created = created;
		this.last_upd = last_upd;
		this.model_dir = model_dir;
	}
}
