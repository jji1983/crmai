package com.ktds.crmai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.ktds.crmai")
public class CrmaiApplication{

	public static void main(String[] args) {
		SpringApplication.run(CrmaiApplication.class, args);
	}
}
