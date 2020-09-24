package com.shallwe.control;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.shallwe.exception.AddException;
import com.shallwe.service.LectureService;
import com.shallwe.service.TutorService;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class UploadController {
	
	@Autowired TutorService service;
	@Autowired
	LectureService leservice;
	@Autowired
	private static final String UPLOAD_PATH = "/Users/chan/Desktop/Web/FinalProject/ShallWe/src/main/webapp/files/tutorImages";
	private static final String LECTURE_UPLOAD_PATH = "C:\\Users\\pc\\Desktop\\FinalProject\\ShallWe\\src\\main\\webapp\\files\\lecture";
	
	//파일 업로드 이메서드는 마지막으로 하는일(업로드일은 여기서 처리한다) 
	// 랜덤으로 난수값을 정해주고 + 오리지날 파일값을 더해서 저장해주는곳이고
	// 파일 크기는 루트 컨텍스트에서 확인이 가능하다 변경도 가능하지만 되도록 이면 10mb트로 처리 하도록했다 건들지 말것!
	public String saveFile(MultipartFile file) {
		// 파일 용량은 루트 컨텍스트에서 확인이 가능함
		UUID uuid = UUID.randomUUID();
		
		String saveName = uuid+"_"+ file.getOriginalFilename();
		//파일 중복 되지 않기 위해 사용함
		File saveFile = new File(UPLOAD_PATH,saveName);
		

			try {
				
				file.transferTo(saveFile);
				//업로드 파일에 saveFile이라는 껍데기 입힘
				System.out.println("파일크기:" + saveFile.length() + "파일사이즈:" + file.getSize());
				
			} catch (IllegalStateException e) {
				//즉 브라우져에 보낼 데이터를 버퍼에 쓴 이후로는 redirect나 forward를 할수 없을떄 일어난다(forward나 redirect)
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		log.info( "이 업로드한 파일은" +file);
		log.info("이 업로드된 파일이다" + saveName);
		log.info("업로드된 파일의 경로는 " + UPLOAD_PATH);
		
		return saveName;
		
	}
	
	// 파일 배열로 받아와서 집어넣기: 경찬
	public  ResponseEntity<String> upload(MultipartFile[] uploadFiles) {
		
		String tutor_img ="";
		for(MultipartFile f : uploadFiles) {
			
			tutor_img += saveFile(f);
		}
		ResponseEntity<String> responseEntity = ResponseEntity.status(HttpStatus.OK).body(tutor_img);
		return responseEntity;
		
	}

	//강사등록: 경찬
	@RequestMapping(value="/addTutor",method = RequestMethod.POST)
	public ResponseEntity<String> addTutor(Tutor tutor,
											  MultipartFile tutor_img1,
											  MultipartFile tutor_career_file1) 
											  throws AddException{
		
		System.out.println("jsp넘어온 데이터:" + tutor);
		log.info("이미지파일:" + tutor_img1);
		log.info("이력서파일:" + tutor_career_file1);
		
		String tutor_id = "championcom"; 
		// 테스트용 아이디입니다
		
		if (tutor_id == null) {
			throw new AddException("예외발생: 로그인 안되서 발생");
		}
	
		Member m = new Member();
		m.setMember_id(tutor_id);
		
		String tutor_fileName = saveFile(tutor_img1);
		String tutor_careerfile = saveFile(tutor_career_file1);
		
		tutor.setMember(m);
		tutor.setTutor_img(tutor_fileName);
		tutor.setTutor_career_file(tutor_careerfile);
		
		try {
			
			service.insertTutor(tutor);
			
		} catch (AddException e) {
			
			e.printStackTrace();
		}
		
		ResponseEntity<String> responseEntity = ResponseEntity.status(HttpStatus.OK).body(tutor_id);
		
		return responseEntity;
		
	}
	// 강사 강의 등록 : 동일
//			@PostMapping(value = "/insert")
//			public String insertLecture(LectureDetail lectDe, MultipartFile lecture_img) throws AddException {
//				
//				log.info("JSP에서 넘어온 랙처 이미지" + lecture_img);
////				ModelAndView mnv = new ModelAndView();
//				try {
//					leservice.insertLecture(lectDe.getLecture(), lectDe);
////					mnv.setViewName("/success");
//				} catch (AddException e) {
//					e.printStackTrace();
////					mnv.setViewName("/fail");
////					mnv.addObject("errorMsg", e.getMessage());
//				}
//				ResponseEntity<String> responseEntity = ResponseEntity.status(HttpStatus.OK).body(tutor_id);
//				return responseEntity;
//			}

	
}
