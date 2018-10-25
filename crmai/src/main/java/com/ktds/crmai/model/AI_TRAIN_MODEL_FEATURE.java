package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@Alias("Learning")
@NoArgsConstructor
@AllArgsConstructor
public class AI_TRAIN_MODEL_FEATURE {
	private static final long serialVersionUID = 3947489072259877540L;
	private String cam_id;
	private String train_method;
	private String feature_name;
	private String weight;
}
