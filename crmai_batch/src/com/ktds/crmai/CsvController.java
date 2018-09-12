package com.ktds.crmai;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Hashtable;

import com.ktds.crmai.db.TableDAO;
import com.ktds.crmai.vo.TableMake_Query;

public class CsvController {

	 public static void main(String[] args) {
		 
		 String path = "D:\\python\\숙제_20180524\\CSV\\";
		 String fileName = "cam_1805.csv";
		 String encoding = "utf-8";
		 String cvsSplitBy = ",";
		 String tableName = "asdf_CAM_1";
		 
		 run(tableName, path, fileName, encoding, cvsSplitBy);
	 }

     private static void run(String tableName, String path, String fileName, String encoding, String cvsSplitBy) {
        BufferedReader br = null;
        String line;
        
        String[] column = null;
        int flag =  1;
        int columnLen = 0;
        Hashtable<String, Integer> column_maxValue = new Hashtable<String, Integer>();
        ArrayList<String> list = new ArrayList<>();
        String fileFullPath = path + fileName;
        
        StringBuilder insertHeaderQuery = new StringBuilder();
                
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(fileFullPath), encoding));
            while ((line = br.readLine()) != null) {
            	if(flag == 1)
            	{
            		System.out.println("line column :: " + line);
            		
//            		String test="Sunday MONDAY";
//            		test = test.toUpperCase();
//            		test = test.toLowerCase();
            		
            		//대문자 -> 소문자
            		line = line.toLowerCase();
            		column = line.split("\\" + cvsSplitBy);
            		columnLen = column.length;
            		
            		System.out.println("columnLen :: " + column.length);
            		
            		insertHeaderQuery.append("insert into " + tableName + "(");
            		
            		for(int i = 0; i < column.length; i++) {
            			
            			//1.colunm 자리수가 MAX 30 (표준) :: ORA-00972: 식별자의 길이가 너무 깁니다
            			//ex : INDV_INFO_HANDL_CSGN_AGREE_YN_1
            			if(column[i].length() > 30 ) {
            				System.err.println("ORA-00972: 식별자의 길이가 너무 깁니다 :: " + column[i] + " :: " + column[i].length());
            				break;
            			}
            			
            			if(i == (column.length - 1)) {
            				insertHeaderQuery.append(column[i] + ") ");
            			}else {
            				insertHeaderQuery.append(column[i]+",");	
            			}
            		}
            		
            		flag = 2;
            		continue;
            	}
            	
                String[] field = line.split("\\" +cvsSplitBy);
                
                if(columnLen != field.length) {
                	//System.err.println("columnLen["+columnLen+"] :: field["+field.length+"]" + " line::[" +line + "]");
                	continue;
                }
                StringBuilder insertBodyQuery = new StringBuilder();
                insertBodyQuery.append("values(");
                for(int i = 0; i < field.length; i++) {
                	int maxTemp = field[i].length();
                	
                	if(column_maxValue.get(column[i]) == null) {
                		column_maxValue.put(column[i], maxTemp);
                	}
                	
                	int maxValue = column_maxValue.get(column[i]);
//                	System.out.println("maxTemp[" + maxTemp + "] :: maxValue[" +maxValue+ "]");
                	
                	if(maxTemp > maxValue){
                		column_maxValue.put(column[i], maxTemp);
                	}
                	
                	if(i == (field.length - 1)) {
                		insertBodyQuery.append("\'" + field[i] + "\'");
                	}else{
                		insertBodyQuery.append("\'" + field[i] + "\',");
                	}
                }
                insertBodyQuery.append(")");
                
                //System.out.println("insertQuery :: " + insertHeaderQuery.toString() + insertBodyQuery.toString());
                
                list.add(insertHeaderQuery.toString() + insertBodyQuery.toString());
                //break;
            }
            
            
            for(int i = 0; i < columnLen; i++) {
            	//System.out.println("columnName[" + column[i] + "] :: maxLen[" + column_maxValue.get(column[i]) + "]");
            }
            
            TableMake_Query query = new TableMake_Query();
            
            query.setTableName(tableName);
            query.setTableColumnName(column, column_maxValue);
            
            System.out.println(query.toString());
            
            TableDAO dao = new TableDAO();
            
            dao.create_table(query);
            
            dao.insertData_Pretreatment(list);
            
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
	 
}
