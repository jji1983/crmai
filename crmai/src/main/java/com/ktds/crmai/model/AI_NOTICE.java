package com.ktds.crmai.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("notice")
@NoArgsConstructor
@AllArgsConstructor
public class AI_NOTICE {
	private static final long serialVersionUID = 3947489072259877540L;
	private String code;
	private String title;
	private String contents;
	private String writer;
	private String reg_datetime;
}