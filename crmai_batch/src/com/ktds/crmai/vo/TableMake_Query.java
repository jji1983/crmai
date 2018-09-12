package com.ktds.crmai.vo;

import java.util.Hashtable;

public class TableMake_Query {

	private StringBuilder query_hearder = new StringBuilder();
	private int hearderFlag = 0;
	
	
	public void setTableName(String tableName){
	
		if(this.hearderFlag == 1) {
			System.out.println("이미 등록 됨.");
			return;
		}
		
		this.query_hearder.append("CREATE TABLE ");
		this.query_hearder.append(tableName);
		this.query_hearder.append("(");
		
		this.hearderFlag = 1;
	}
	
	public void setTableColumnName(String[] columns, Hashtable<String, Integer> column_maxValue) {
		
		for(int i =0; i < columns.length; i++) {
			
			int maxVal = column_maxValue.get(columns[i]);
			
			System.out.println(columns[i] + " :: " + maxVal);
			
			if(maxVal < 9){maxVal = 20;	}
			//System.out.println(maxVal);
			
			if(maxVal < 19){maxVal = 100;}
			//System.out.println(maxVal);
			
			maxVal *= 10;
						
			//System.out.println(maxVal + " :: " + i + " :: " + columns.length);
			
			if(i == (columns.length - 1)) {
				System.out.println(columns[i] + " VARCHAR2("+maxVal+")");
				this.query_hearder.append( columns[i] + " VARCHAR2("+maxVal+")");
			}else {
				System.out.println(columns[i] + " VARCHAR2("+maxVal+"),");
				this.query_hearder.append( columns[i] + " VARCHAR2("+maxVal+"), ");
			}
			
		}
		this.query_hearder.append(")");
	}
	
	
	public String toString() {
		return query_hearder.toString();
	}
	
	 
}
