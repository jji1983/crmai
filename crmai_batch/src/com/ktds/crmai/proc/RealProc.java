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

public class RealProc {

	public void RealProc() {
		
		TableDAO dao = new TableDAO();
		BufferedReader br = null;
		String encoding = "UTF-8";
		String cvsSplitBy = ",";
		String line;
		String cam_msg = null;
		String type = "cam_rtype";
		CampaignData dataTemp = null;
		
		try {
			//1. 학습데이터 대상을 가져온다.
			ArrayList<CampaignData> list = dao.selectCampaign(type);
			
			if(list == null || list.isEmpty()) {
				System.out.println("RealProc :: 조건 대상이 없음");
				return;
			}

			//2. Flag 변경
			dao.updateCampaign(list, type,  2, cam_msg);
			
			//3. 데이터를 분석 DB 에 Insert
			System.out.println("Insert start :: " + DateTool.getTimestamp());
			for(CampaignData data : list) {
				
				dataTemp = data;
				
				int feature = 0;
				String[] columns = null;
				ArrayList<AiStaging> arrayList = new ArrayList<AiStaging>();
				System.out.println(data.toString());
				
				br = new BufferedReader(new InputStreamReader(new FileInputStream(data.getCam_rfilename()), encoding));
				System.out.println(data.getCam_id() + " start :: " + DateTool.getTimestamp());
				
	            while ((line = br.readLine()) != null) {
	            	AiStaging real = new AiStaging();
	            	
	            	//System.out.println(data.getCam_id() + " line :: " + line);
	            	columns = line.split("\\" + cvsSplitBy);
	            	
	            	//3.1 RealDB update
	            	
	            	//st_seq, cam_id, st_c1, method, predict, succ_prob, fail_prob, result
	            	real.setSt_seq(columns[0]);
	            	real.setCam_id(data.getCam_id());
	            	real.setSt_c1(columns[2]);
	            	real.setTrain_method(columns[3]);
	            	real.setPredict(columns[4]);
	            	real.setSucc_prob(columns[5]);
	            	real.setFail_prob(columns[6]);
	            	
	            	if(columns.length == 8) {
	            		real.setResult(columns[7]);	
	            	}else {
	            		real.setResult("0");
	            	}
	            	
	            	//System.out.println(train.toQuery());
	            	arrayList.add(real);
	            	
	            }
	            System.out.println(data.getCam_id() + " ing :: " + DateTool.getTimestamp());
	            
	            //업데이트
	            cam_msg = dao.insertAI_STAGING_Real(data, arrayList);
	            
	            System.out.println(data.getCam_id() + " end :: " + DateTool.getTimestamp() + " :: cam_msg[" + cam_msg + "]");
	            
	            //3.2 캠페인 정보 업데이트 피쳐 갯수
	        	System.out.println("cam_msg[" + cam_msg + "]");
	        	
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
