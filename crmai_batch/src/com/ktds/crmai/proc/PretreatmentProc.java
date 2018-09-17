package com.ktds.crmai.proc;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import com.ktds.crmai.db.TableDAO;
import com.ktds.crmai.vo.CampaignData;

public class PretreatmentProc {

	public void PretreatmentProc(String encoding) {
		
		TableDAO dao = new TableDAO();
		BufferedReader br = null;
		String line;
		
		
		try {
			//1. 학습데이터 대상을 가져온다.
			ArrayList<CampaignData> list = dao.selectCampaign();

			//2. Flag 변경
			dao.updateCampaign(list, 2);
			
			//3. 데이터를 분석 DB 에 Insert
			for(CampaignData data : list) {
				System.out.println(data.toString());
				br = new BufferedReader(new InputStreamReader(new FileInputStream(data.getCam_ifilename()), encoding));
	            while ((line = br.readLine()) != null) {
	            	//System.out.println(data.getCam_id() + " line :: " + line);
	            }
			}
			

		
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
