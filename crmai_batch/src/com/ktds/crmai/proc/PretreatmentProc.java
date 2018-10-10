package com.ktds.crmai.proc;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
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
				int feature = 0;
				String[] columns = null;
				ArrayList<AiStaging> arrayList = new ArrayList<AiStaging>();
				System.out.println(data.toString());
				br = new BufferedReader(new InputStreamReader(new FileInputStream(data.getCam_ifilename()), encoding));
				System.out.println(data.getCam_id() + " start :: " + DateTool.getTimestamp());
	            while ((line = br.readLine()) != null) {
	            	AiStaging train = new AiStaging();
	            	
	            	//System.out.println(data.getCam_id() + " line :: " + line);
	            	columns = line.split("\\" + cvsSplitBy);
	            	
	            	//3.1 스테이징DB(TRAIN) Insert
	            	train.setCam_id(data.getCam_id());
	            	train.setSt_itype(4);
	            	train.setColumnTrain(columns);
	            	
	            	//System.out.println(train.toQuery());
	            	arrayList.add(train);
	            
	            	int nowNum = columns.length;
	            	
	            	if(nowNum > feature) {
	            		feature = nowNum;
	            		data.setIcnum(feature);
	            	}
	            }
	            System.out.println(data.getCam_id() + " ing :: " + DateTool.getTimestamp());
	            
	            cam_msg = dao.insertAI_STAGING_TRAIN_BATCH(data, arrayList);
	            
	            System.out.println(data.getCam_id() + " end :: " + DateTool.getTimestamp() + " :: cam_msg[" + cam_msg + "]");
	            
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
