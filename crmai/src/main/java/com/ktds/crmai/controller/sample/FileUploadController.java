package com.ktds.crmai.controller.sample;

import java.io.File;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ktds.crmai.controller.FileController;

@Controller
public class FileUploadController {
	
	private static Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @RequestMapping(value = "/sample/fileUpload")
    public String fileUp(MultipartHttpServletRequest multi) {
         
    	logger.info("path :: fileUp");
    	
        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/";
        
        
        
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
         
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
                         
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         
        System.out.println("id : " + multi.getParameter("id"));
        System.out.println("pw : " + multi.getParameter("pw"));
         
        return "/sample/ajaxUpload";
    }

}
