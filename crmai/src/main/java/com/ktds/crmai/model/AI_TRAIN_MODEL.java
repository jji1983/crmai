package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("model")
@NoArgsConstructor
@AllArgsConstructor
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
}
