package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("notice")
public class AI_NOTICE {

	private static final long serialVersionUID = 3947489072259877540L;
	
	private String NOTICE_TEXT;
	public AI_NOTICE() {
	}
	
	public AI_NOTICE(String NOTICE_TEXT) {
		this.NOTICE_TEXT = NOTICE_TEXT;
	}
}