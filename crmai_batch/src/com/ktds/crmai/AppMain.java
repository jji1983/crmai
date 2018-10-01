package com.ktds.crmai;

import com.ktds.crmai.proc.LearningProc;
import com.ktds.crmai.proc.PretreatmentProc;

public class AppMain {
	
	 public static void main(String[] args) {
		 
		 PretreatmentProc proc = new PretreatmentProc();
		 
		 proc.PretreatmentProc();
		 
		 
		 LearningProc learn_proc = new LearningProc();
		 
		 learn_proc.LearningProc();
		 
	 }

}
