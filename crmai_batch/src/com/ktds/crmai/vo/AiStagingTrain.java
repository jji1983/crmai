package com.ktds.crmai.vo;

import java.util.Enumeration;
import java.util.Hashtable;

public class AiStagingTrain {
	
	private int cam_id;
	private int st_itype;
	private Hashtable<String, String> column = new Hashtable<String, String>();
	
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
	public Hashtable<String, String> getColumn() {
		return column;
	}
	public void setColumn(Hashtable<String, String> column) {
		this.column = column;
	}
	
	public void setColumn(String key, String value) {
		this.column.put(key, value);
	}
	
	public void setColumn(String[] columns) {
		
		int key = 1;
		for(String column : columns) {
			
			this.column.put("ST_C" + key, column);
			
			key++;
		}
		
		//this.column.put(key, value);
	}
	public String toQuery() {
		StringBuilder query_h = new StringBuilder();
		StringBuilder query_b = new StringBuilder();
		int flag = 0;
		
		query_h.append("insert into AI_STAGING_TRAIN(ST_SEQ, cam_id, ");
		
		query_b.append("values(ST_SEQ_T.NEXTVAL, '" + cam_id + "', ");
		Enumeration<String> keys = column.keys();
		while(keys.hasMoreElements()) {
			
			String key = keys.nextElement();
			String value = column.get(key);
		
			if(flag == 0) {
				query_h.append(key);
				query_b.append("\'" + value +"\'");
				flag = 1 ;
			}else{
				
				query_h.append(", " + key);
				query_b.append(", \'" + value + "\'");
			}
		}
		query_h.append(") ");
		query_b.append(") ");
		
		//System.out.println("query :: " + query_h.toString() + query_b.toString());
		return query_h.toString() + query_b.toString();
	}
	
	public String toString() {
		StringBuilder sb = new StringBuilder();
		
		sb.append("cam_id :: " + cam_id + "\n");
		sb.append("st_itype :: " + st_itype + "\n");
		
		Enumeration<String> keys = column.keys();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			String value = column.get(key);
		
			sb.append(key + " :: " + value + "\n");
		}
		
		return sb.toString();
	}
	

}