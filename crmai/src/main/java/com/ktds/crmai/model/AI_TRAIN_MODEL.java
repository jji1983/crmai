package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("model")
public class AI_TRAIN_MODEL {

private static final long serialVersionUID = 3947489072259877540L;
	
	
	private String cam_id;
	private String train_method;
	private String original_acc;
	private String so_acc;
	private String model_dir;
	private String model_name;
	private String train_start;
	private String train_end;
	private String model_flag;
	private String desc_text;

	
	
	public AI_TRAIN_MODEL(){
		
	}
	
	
	public AI_TRAIN_MODEL(
			String cam_id,
			String train_method,
			String original_acc,
			String so_acc,
			String model_dir,
			String model_name,
			String train_start,
			String train_end,
			String model_flag,
			String desc_text
	    ) {
		this.cam_id = cam_id;
		this.train_method =train_method;
		this.original_acc = original_acc;
		this.so_acc = so_acc;
		this.model_dir = model_dir;
		this.model_name = model_name;
		this.train_start = train_start;
		this.train_end = train_end;
		this.model_flag = model_flag;
		this.desc_text = desc_text;

	}
	
	
}

