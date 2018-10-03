package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("learning_info")
public class Learning_Info{

	private static final long serialVersionUID = 3947489072259877540L;

	
	private String train_method;
	private String original_acc;
	private String so_acc;
	private String model_dir;
	private String model_name;
	
	
	public Learning_Info(){
		
	}
	
	public Learning_Info(
			String train_method,
			String original_acc,
			String so_acc,
			String model_dir,
			String model_name
            ) {
		
		this.train_method = train_method;
		this.original_acc = original_acc;
		this.so_acc = so_acc;
		this.model_dir = model_dir;
		this.model_name = model_name;
		

		

	}
}
