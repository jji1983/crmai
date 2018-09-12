package com.ktds.crmai.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping(value="/file")
public class FileController {
	private static Logger logger = LoggerFactory.getLogger(FileController.class);
	
	private String baseDir = "D:" + File.separator + "TEMP" + File.separator; // c:\temp 디렉토리를 미리 만들어둔다.
	
	
	@RequestMapping(value = "/Upload_Pretreatment") // method = RequestMethod.GET 
	public ResponseEntity<Object> fileUpload(
		@RequestParam("user_id") String user_id,
		@RequestParam("inputCamName") String inputCamName,
		@RequestParam("inputCamDesc") String inputCamDesc,
		@RequestParam("cam_type") String cam_type,
        @RequestParam("file") MultipartFile[] files) { 

        if(files != null && files.length > 0){
            // windows 사용자라면 "c:\temp\년도\월\일" 형태의 문자열을 구한다.
            String formattedDate = baseDir + new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd").format(new Date());
            File f = new File(formattedDate);
            if(!f.exists()){ // 파일이 존재하지 않는다면
                f.mkdirs(); // 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
            }
 
            for(MultipartFile file : files) {
                String contentType = file.getContentType();
                String name = file.getName();
                String originalFilename = file.getOriginalFilename();
                long size = file.getSize();
 
                String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
                String saveFileName = formattedDate + File.separator + uuid; // 실제 저장되는 파일의 절대 경로
 
                // 아래에서 출력되는 결과는 모두 database에 저장되야 한다.
                // pk 값은 자동으로 생성되도록 한다.
                System.out.println("user_id :" + user_id);
                System.out.println("inputCamName :" + inputCamName);
                System.out.println("inputCamDesc :" + inputCamDesc);
                System.out.println("cam_type :" + cam_type);
                System.out.println("contentType :" + contentType);
                System.out.println("name :" + name);
                System.out.println("originalFilename : " + originalFilename);
                System.out.println("size : " + size);
                System.out.println("saveFileName : " + saveFileName);
 
                // 실제 파일을 저장함.
                // try-with-resource 구문. close()를 할 필요가 없다. java 7 이상에서 가능
                try(
                        InputStream in = file.getInputStream();
                        FileOutputStream fos = new FileOutputStream(saveFileName)){
                    int readCount = 0;
                    byte[] buffer = new byte[512];
                    while((readCount = in.read(buffer)) != -1){
                        fos.write(buffer,0,readCount);
                    }
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            } // for
        } // if
 
      //응답과 함깨 HttpStatus를 지정할 수 있습니다.
      ResponseEntity<Object> response = new ResponseEntity<Object>("success", HttpStatus.OK);
		
		return response; 
	} 
	//uuid생성 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
}
