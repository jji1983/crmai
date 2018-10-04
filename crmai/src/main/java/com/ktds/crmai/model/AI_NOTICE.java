package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("notice")
public class AI_NOTICE {

	private static final long serialVersionUID = 3947489072259877540L;

	private String code;
	private String title;
	private String contents;
	private String writer;
	private String reg_datetime;

	public AI_NOTICE() {

	}

	public AI_NOTICE(String code, String title, String contents, String writer, String reg_datetime) {

		this.code = code;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.reg_datetime = reg_datetime;

	}

}