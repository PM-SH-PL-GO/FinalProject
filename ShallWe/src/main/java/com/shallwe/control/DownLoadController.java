package com.shallwe.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shallwe.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller

@RequiredArgsConstructor
public class DownLoadController {
	
	@Autowired private BoardService service;
	
	@Autowired public static final String DOWNLOAD_PATH = "/Users/chan/Desktop/Web/FinalProject/ShallWe/src/main/webapp/files/studyBoard";
	
	@RequestMapping(value="fileDownload",method = RequestMethod.POST)
	public void fileDownload(@RequestParam HashMap<String, Object>file ,HttpServletResponse response,MultipartFile multi) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		String fileName = multi.getOriginalFilename();
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName+ "\"");
		//이 이름으로 헤더가 이미 존재한다면 , 새로운 값으로대체 없다면 새로운 헤더값으로추가
		File f =  new File(DOWNLOAD_PATH,fileName);
		InputStream inputStream = null;
		
		try {
			
			inputStream = new FileInputStream(f);
			IOUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer(); // 응답
			
		} catch (IOException e) {
			 e.printStackTrace();
			 log.error("[FILE_DOWNLOAD_IOEXCEPTION]", e);
		} finally {

			IOUtils.closeQuietly(inputStream);
		}
		
		

	}
}
