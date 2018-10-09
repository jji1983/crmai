package com.ktds.crmai.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.ktds.crmai.model.AIPredict;
import com.ktds.crmai.model.AI_CAMPAIGN;
import com.ktds.crmai.service.CampaignService;
import com.ktds.crmai.service.PredictService;
import com.ktds.crmai.service.PretreatmentService;
import com.ktds.crmai.service.StagingService;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping(value="/file")
public class FileController {
	private static Logger logger = LoggerFactory.getLogger(FileController.class);
	private String baseDir = "D:" + File.separator + "TEMP" + File.separator; // D:\temp 디렉토리를 미리 만들어둔다.
	
	@Autowired
	CampaignService campaignService;
	
	@Autowired
	PredictService predictService;
	
	@RequestMapping(value = "/Upload_Pretreatment") // method = RequestMethod.GET 
	public ResponseEntity<Object> fileUpload_Pretreatment(
		@RequestParam("user_id") String user_id,
		@RequestParam("inputCamName") String inputCamName,
		@RequestParam("inputCamDesc") String inputCamDesc,
		@RequestParam("cam_type") String cam_type,
		@RequestParam("cam_autoyn") String cam_autoyn,
        @RequestParam("file_train") MultipartFile[] file_train,
        @RequestParam("file_test") MultipartFile[] file_test) { 
		
		ResponseEntity<Object> response = new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
		
		logger.info("Upload_Pretreatment :: user_id ::{}, inputCamName :: {}, inputCamDesc :: {}",user_id, inputCamName, inputCamDesc );
		
		AI_CAMPAIGN campaign = campaignService.selectCampaignSeq();
		logger.info("Upload_Pretreatment :: user_id ::{}, inputCamName :: {}, inputCamDesc :: {}, cam_id :: {} ",user_id, inputCamName, inputCamDesc,  campaign.getCam_seq());
		
		campaign.setAdm_id(user_id);
		campaign.setCam_name(inputCamName);
		campaign.setCam_desc(inputCamDesc);
		campaign.setCam_type(cam_type);
		campaign.setCam_autoyn(cam_autoyn);
		
		logger.info("### file_train check {}, {} :: file_test check {}, {}", file_train, file_train.length, file_test, file_test.length);
        
        // windows 사용자라면 "c:\temp\년도\월\일" 형태의 문자열을 구한다.
        String fullPath = baseDir + user_id;
        File f = new File(fullPath);
        if(!f.exists()){ // 파일이 존재하지 않는다면
            f.mkdirs(); // 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
        }
 
        MultipartFile file_t1 = file_train[0];
        MultipartFile file_t2 = file_test[0];
        
        long size_t1 = file_t1.getSize();
        long size_t2 = file_t2.getSize();
        if(size_t1 == 0 || size_t2 == 0) {
    	   
    	   response = new ResponseEntity<Object>("FAIL::학습파일/대상자 파일은 필수 입니다.", HttpStatus.OK);
    	   
    	   logger.info("### size_t1 {}, size_t2{}", size_t1, size_t2);
       }else{
    	   String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
    	   
    	   String contentType_t1 = file_t1.getContentType();
           String name_t1 = file_t1.getName();
           String originalFilename_t1 = file_t1.getOriginalFilename();
           String saveFileName_t1 = fullPath + File.separator + uuid +"_"+campaign.getCam_seq() + "_" +name_t1; // 실제 저장되는 파일의 절대 경로
           
           String contentType_t2 = file_t2.getContentType();
           String name_t2 = file_t2.getName();
           String originalFilename_t2 = file_t2.getOriginalFilename();
           String saveFileName_t2 = fullPath + File.separator + uuid +"_"+campaign.getCam_seq() + "_" +name_t2; // 실제 저장되는 파일의 절대 경로
 
           // 아래에서 출력되는 결과는 모두 database에 저장되야 한다.
           // pk 값은 자동으로 생성되도록 한다.
//           logger.debug("user_id :" + user_id);
//           logger.debug("inputCamName :" + inputCamName);
//           logger.debug("inputCamDesc :" + inputCamDesc);
//           logger.debug("cam_type :" + cam_type);
//           logger.debug("cam_autoyn :" + cam_autoyn);
//           logger.debug("contentType :" + contentType_t1);
//           logger.debug("name :" + name_t1);
//           logger.debug("originalFilename : " + originalFilename_t1);
//           logger.debug("size_t : " + size_t1);
//           logger.debug("saveFileName : " + saveFileName_t1);
 
           campaign.setCam_ifilename(saveFileName_t1);
           campaign.setCam_itype("1");
        	
           // 실제 파일을 저장함.
           // try-with-resource 구문. close()를 할 필요가 없다. java 7 이상에서 가능
           try(
              InputStream in = file_t1.getInputStream();
              FileOutputStream fos = new FileOutputStream(saveFileName_t1)){
              int readCount = 0;
              byte[] buffer = new byte[512];
              while((readCount = in.read(buffer)) != -1){
            	  fos.write(buffer,0,readCount);
              }
           }catch(Exception ex){
                ex.printStackTrace();
           }
           
    	   campaign.setCam_otype("1");
    	   campaign.setCam_ofilename(saveFileName_t2);
               
           // 실제 파일을 저장함.
           // try-with-resource 구문. close()를 할 필요가 없다. java 7 이상에서 가능
           try(
              InputStream in = file_t2.getInputStream();
              FileOutputStream fos = new FileOutputStream(saveFileName_t2)){
              int readCount = 0;
              byte[] buffer = new byte[512];
              while((readCount = in.read(buffer)) != -1){
            	  fos.write(buffer,0,readCount);
              }
           }catch(Exception ex){
                ex.printStackTrace();
           }
           
           logger.info("### Upload_Pretreatment Insert {}", campaign);
           campaignService.insertCampaign(campaign);
       }
       
        logger.info("### response {}", response);
        
	  return response; 
	}
	
	@RequestMapping(value = "/downloadGuide", method = RequestMethod.GET)
	public ResponseEntity<byte[]> downloadGuideFile() throws Exception {

	 String GuideFile = "\\resources\\static\\file\\CRM_MarketingPlatform(Admin)_20180928.pdf";
	 
	 Path path = Paths.get(GuideFile);
		
	 byte[] array = Files.readAllBytes(path);
	 String fileName = "attachment; filename=CRM_MarketingPlatform(Admin)_20180928.pdf";

	 HttpHeaders responseHeaders = new HttpHeaders();
	 responseHeaders.set("charset", "utf-8");
	 responseHeaders.setContentType(MediaType.valueOf("application/pdf"));
	 responseHeaders.setContentLength(array.length);
	 responseHeaders.set("Content-disposition", fileName);

	 return new ResponseEntity<byte[]>(array, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/downPredict", method = RequestMethod.GET, produces = "text/csv")
    @ResponseBody
    public void downloadPredict(
    	@RequestParam("pr_succVal") String pr_succVal,
    	@RequestParam("pr_totalVal") String pr_totalVal,
    	@RequestParam("cam_id") String cam_id,
    	HttpServletResponse response){
		
		logger.info("downloadPredict :: pr_succVal ::{}, pr_totalVal :: {}, cam_id :: {}",pr_succVal, pr_succVal, cam_id );
		
        //List<String> ids = Arrays.asList("1312321","312313");
        //String NEW_LINE_SEPARATOR = "\n";
        
        //CSV file header
        //Object[] FILE_HEADER = {"Token Number", "Token Expiry Date", };
        //CSVPrinter csvPrinter = null;
        
        //response.setContentType ("application/csv");
        //response.setHeader ("Content-Disposition", "attachment; filename=\"nishith.csv\"");
        
        PrintWriter writer = null;
        try {
        	writer = response.getWriter();
        	
        	 AIPredict pre = new AIPredict(Integer.parseInt(cam_id));
        	
        	List<AIPredict> list = predictService.selectAllPredictList(pre);
        	
        	Gson gson = new Gson();			
        	String tagsAsJson = gson.toJson((list));
        	
        	writer.write(tagsAsJson);
        	
        	/*
        	
            csvPrinter = new CSVPrinter(new BufferedWriter(writer), CSVFormat.DEFAULT.withRecordSeparator(NEW_LINE_SEPARATOR));
            //Create CSV file header
            csvPrinter.printRecord(FILE_HEADER);
            
            for (AIPredict predict : list) {
	            try {
	                csvPrinter.printRecord(predict.toString());
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
            }
            */
            
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        
                writer.flush();
                writer.close();
        
        }
        
    }

  
	
	
	
	//uuid생성 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
}
