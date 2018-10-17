package com.ktds.crmai.proc;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.ktds.crmai.db.TableDAO;
import com.ktds.crmai.util.DateTool;
import com.ktds.crmai.vo.AiStaging;
import com.ktds.crmai.vo.CampaignData;

public class PretreatmentProc {

	public void PretreatmentProc() {
		
		TableDAO dao = new TableDAO();
		BufferedReader br = null;
		String encoding = "UTF-8";
		String cvsSplitBy = ",";
		String line;
		String cam_msg = null;
		String type = "cam_itype";
		String type1 = "st_itype";
		String tableName = "AI_STAGING_TRAIN";
		CampaignData dataTemp = null;
		
		try {
			//1. 학습데이터 대상을 가져온다.
			ArrayList<CampaignData> list = dao.selectCampaign(type);
			
			if(list == null || list.isEmpty()) {
				System.out.println("PretreatmentProc :: 조건 대상이 없음");
				return;
			}else {
				System.err.println("PretreatmentProc :: 조건 대상이 있음");
			}

			//2. Flag 변경
			dao.updateCampaign(list, type,  2, cam_msg);
			
			//3. 데이터를 분석 DB 에 Insert
			System.out.println("Insert start :: " + DateTool.getTimestamp());
			for(CampaignData data : list) {
				
				dataTemp = data;
				
				int feature = 0;
				int maxCnt = 0;
				String[] columns = null;
				ArrayList<AiStaging> arrayList = new ArrayList<AiStaging>();
				System.out.println(data.toString());
				br = new BufferedReader(new InputStreamReader(new FileInputStream(data.getCam_ifilename()), encoding));
				System.out.println(data.getCam_id() + " start :: " + DateTool.getTimestamp());
				
				Path path = Paths.get(data.getCam_ifilename());
				long lineCount = Files.lines(path).count();
				
	            while ((line = br.readLine()) != null) {
	            	AiStaging train = new AiStaging();
	            	
	            	//System.out.println(data.getCam_id() + " line :: " + line);
	            	columns = line.split("\\" + cvsSplitBy);
	            	
	            	//3.1 스테이징DB(TRAIN) Insert
	            	train.setCam_id(data.getCam_id());
	            	train.setSt_itype(4);
	            	train.setColumn(columns);
	            	
	            	//System.out.println(train.toQuery());
	            	arrayList.add(train);
	            	
	            	int nowNum = columns.length;
	            	
	            	if(nowNum > feature) {
	            		System.err.println("##### " + columns[0] + " || nowNum :: " + nowNum + " || feature :: " + feature);
	            		feature = nowNum;
	            		data.setIcnum(feature);
	            	}
	            	
	            	// OutOfMemory를 고려하여 만건 단위로 커밋
	                if( (maxCnt % 50000) == 0){
	     	           cam_msg = dao.insertAI_STAGING(data, arrayList, tableName, type1);
	     	            
	     	           int value = maxCnt;
	     	           int total = (int) lineCount; 
	     	           double rate = (double)((double)value/(double)total) * 100; 
	     	           
	     	           rate = rate * 100;
	     	           
	     	           String dispPattern = "##%";
	     	           DecimalFormat form = new DecimalFormat(dispPattern);
	     	           System.out.println(DateTool.getTimestamp()  + " :: " + data.getCam_id() + " TOTAL ["+ String.format("%,d", lineCount)+"] :: ING[" + String.format("%,d", maxCnt) + "] :: Percent[" + form.format(rate) + "]");
	     	            
	     	           //초기화.
	     	           arrayList = new ArrayList<AiStaging>();
	                }
	            	
	            	maxCnt++;
	            }
	            
	            //마지막 남은 값을 처리.
	            cam_msg = dao.insertAI_STAGING(data, arrayList, tableName, type1);
	            System.out.println(DateTool.getTimestamp()  + " :: " + data.getCam_id() + " TOTAL ["+ String.format("%,d", lineCount)+"] :: ING[" + String.format("%,d", maxCnt) + "] :: Percent[100%]");
	            
	            //3.2 캠페인 정보 업데이트 피쳐 갯수
	        	System.out.println("feature len[" + feature + "]");
	        	
	        	if(cam_msg != null) {
	        		dao.updateCampaign(data, type, 3, cam_msg);
	        	}else {
	        		dao.updateCampaign(data, type, 7, cam_msg);
	        	}
			}
			System.out.println("Insert end :: " + DateTool.getTimestamp());
		
		} catch (FileNotFoundException e) {
            e.printStackTrace();
            dao.updateCampaign(dataTemp, type, 3, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            dao.updateCampaign(dataTemp, type, 3, e.getMessage());
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
