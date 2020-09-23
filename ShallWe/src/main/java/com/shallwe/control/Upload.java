package com.shallwe.control;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.LectureDetail;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class Upload {
	
	@Autowired
	LectureService service;
	
	private static final String UPLOAD_PATH = "/Users/chan/Desktop/Web/F/ShallWe/src/main/webapp/files/tutorImages";
	
//	파일 업로드
	@RequestMapping(value="upload",method = RequestMethod.POST)
	public String saveFile(@RequestParam(value="file")MultipartFile file) {
		
		UUID uuid = UUID.randomUUID();
		String saveName = uuid+"_"+ file.getOriginalFilename();
		//파일 중복 되지 않기 위해 사용함
		
		File saveFile = new File(UPLOAD_PATH,saveName);
		
		try {
			file.transferTo(saveFile);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		System.out.println( "이 업로드한 파일은" +file);
		System.out.println("이 업로드된 파일이다" + saveName);
		
		return "/instructor";
	}
	
	// 강사 강의 등록 : 동일
		@PostMapping(value = "/insert")
		public String insertLecture(LectureDetail lectDe, MultipartFile lecture_img) throws AddException {
			
			log.info("JSP에서 넘어온 랙처 이미지" + lecture_img);
//			ModelAndView mnv = new ModelAndView();
			try {
				service.insertLecture(lectDe.getLecture(), lectDe);
//				mnv.setViewName("/success");
			} catch (AddException e) {
				e.printStackTrace();
//				mnv.setViewName("/fail");
//				mnv.addObject("errorMsg", e.getMessage());
			}
			return mnv;
		}
	
	
	
}
