package com.ktds.crmai.vo;

import java.util.Enumeration;
import java.util.Hashtable;

public class AiStaging {
	
	private int cam_id;
	private int st_itype;
	private int st_otype;
	private Hashtable<String, String> column_train = new Hashtable<String, String>();
	private Hashtable<String, String> column_test = new Hashtable<String, String>();
	
	
	
	public int getCam_id() {
		return cam_id;
	}
	public void setCam_id(int cam_id) {
		this.cam_id = cam_id;
	}
	
	public int getSt_itype() {
		return st_itype;
	}
	public void setSt_itype(int st_itype) {
		this.st_itype = st_itype;
	}
	public Hashtable<String, String> getColumnTrain() {
		return column_train;
	}
	public void setColumnTrain(Hashtable<String, String> column_train) {
		this.column_train = column_train;
	}
	
	public void setColumnTrain(String key, String value) {
		this.column_train.put(key, value);
	}
	
	public void setColumnTrain(String[] columns) {
		
		int key = 1;
		for(String column : columns) {
			
			this.column_train.put("ST_C" + key, column);
			
			key++;
		}
		
	}
	
	
	public int getSt_otype() {
		return st_otype;
	}
	public void setSt_otype(int st_otype) {
		this.st_otype = st_otype;
	}
	public Hashtable<String, String> getColumnTest() {
		return column_test;
	}
	public void setColumnTest(Hashtable<String, String> column_test) {
		this.column_test = column_test;
	}
	
	public void setColumnTest(String key, String value) {
		this.column_test.put(key, value);
	}
	
	public void setColumnTest(String[] columns) {
		
		int key = 1;
		for(String column : columns) {
			
			this.column_test.put("ST_C" + key, column);
			
			key++;
		}
		
	}
	
	public String toQueryTrain(int cNum, int st_itype) {
		StringBuilder query_h = new StringBuilder();
		StringBuilder query_b = new StringBuilder();
		int flag = 0;
		
		
		query_h.append("insert into AI_STAGING_TRAIN(ST_SEQ, cam_id, st_itype, ");
		
		query_b.append("values(ST_SEQ_T.NEXTVAL, '" + cam_id + "', " + st_itype + ", ");
		Enumeration<String> keys = column_train.keys();
		while(keys.hasMoreElements()) {
			
			String key = keys.nextElement();
			String value = column_train.get(key);
		
			if(key.equals("ST_C" + cNum)) {
				continue;
			}
			
			if(flag == 0) {
				query_h.append(key);
				query_b.append("\'" + value +"\'");
				flag = 1 ;
			}else{
				
				query_h.append(", " + key);
				query_b.append(", \'" + value + "\'");
			}

		}
		
		String temp = column_train.get("ST_C" + cNum);
		if(temp != null) {
			//System.out.println("######### 널이 아님 " + "ST_C" + cNum + " :: " + temp);
			
			query_h.append(", ST_C200 ");
			query_b.append(", '" + temp + "'");
		}
		
		
		query_h.append(") ");
		query_b.append(") ");
		
		//System.out.println("query :: " + query_h.toString() + query_b.toString());
		return query_h.toString() + query_b.toString();
	}
	
	public String toStringTrain() {
		StringBuilder sb = new StringBuilder();
		
		sb.append("cam_id :: " + cam_id + "\n");
		sb.append("st_itype :: " + st_itype + "\n");
		
		Enumeration<String> keys = column_train.keys();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			String value = column_train.get(key);
		
			sb.append(key + " :: " + value + "\n");
		}
		
		return sb.toString();
	}
	
	
	
	public String toQueryTest(int cNum, int st_itype) {
		StringBuilder query_h = new StringBuilder();
		StringBuilder query_b = new StringBuilder();
		int flag = 0;
		
		
		query_h.append("insert into AI_STAGING_TEST(ST_SEQ, cam_id, st_otype, ");
		
		query_b.append("values(ST_SEQ_T.NEXTVAL, '" + cam_id + "', " + st_otype + ", ");
		Enumeration<String> keys = column_test.keys();
		while(keys.hasMoreElements()) {
			
			String key = keys.nextElement();
			String value = column_test.get(key);
		
			if(key.equals("ST_C" + cNum)) {
				continue;
			}
			
			if(flag == 0) {
				query_h.append(key);
				query_b.append("\'" + value +"\'");
				flag = 1 ;
			}else{
				
				query_h.append(", " + key);
				query_b.append(", \'" + value + "\'");
			}

		}
		
		String temp = column_train.get("ST_C" + cNum);
		if(temp != null) {
			//System.out.println("######### 널이 아님 " + "ST_C" + cNum + " :: " + temp);
			
			query_h.append(", ST_C200 ");
			query_b.append(", '" + temp + "'");
		}
		
		
		query_h.append(") ");
		query_b.append(") ");
		
		//System.out.println("query :: " + query_h.toString() + query_b.toString());
		return query_h.toString() + query_b.toString();
	}
	
	public String toStringTest() {
		StringBuilder sb = new StringBuilder();
		
		sb.append("cam_id :: " + cam_id + "\n");
		sb.append("st_otype :: " + st_otype + "\n");
		
		Enumeration<String> keys = column_test.keys();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			String value = column_train.get(key);
		
			sb.append(key + " :: " + value + "\n");
		}
		
		return sb.toString();
	}
	

}
