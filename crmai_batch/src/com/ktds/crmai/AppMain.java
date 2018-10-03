package com.ktds.crmai;

import com.ktds.crmai.proc.LearningProc;
import com.ktds.crmai.proc.PretreatmentProc;

public class AppMain{
	
	 public static void main(String[] args) {
		 
		 //1.학습데이터 로딩
		 PretreatmentProc proc = new PretreatmentProc();
		 proc.PretreatmentProc();
		 
		 //2.대상자데이터 로딩
		 LearningProc learn_proc = new LearningProc();
		 learn_proc.LearningProc();
		 
		 //3. 전처리 시작
		 
		 
	 }

}
