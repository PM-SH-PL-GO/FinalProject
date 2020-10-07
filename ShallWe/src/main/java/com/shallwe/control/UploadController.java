package com.shallwe.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shallwe.exception.AddException;
import com.shallwe.exception.ModifyException;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/upload/*")
public class UploadController {
	
	@Autowired private TutorService service;
	@Autowired private ServletContext application;
	@Autowired private ServletContext c;
	@Autowired private TutorController tutorController;
	
	
	
	private String realPath;
	   
	   @PostConstruct
	   public void initController() {
		   
	      this.realPath = c.getRealPath("/files/tutorCareer/");
	  }
	
	//파일 업로드 이메서드는 마지막으로 하는일(업로드일은 여기서 처리한다) 
	// 랜덤으로 난수값을 정해주고 + 오리지날 파일값을 더해서 저장해주는곳이고
	// 파일 크기는 루트 컨텍스트에서 확인이 가능하다 변경도 가능하지만 되도록 이면 10mb트로 처리 하도록했다 건들지 말것!
	public String saveFile(MultipartFile file) {
		// 파일 용량은 루트 컨텍스트에서 확인이 가능함
		UUID uuid = UUID.randomUUID();
		String uploadPath = application.getRealPath("/files/tutorImages");
		//파일 중복 되지 않기 위해 사용함
		String saveName = uuid+"_"+ file.getOriginalFilename();	
		File saveFile = new File(uploadPath,saveName);
		
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
		log.info("업로드된 파일의 경로는 " + uploadPath);
		
		return saveName;
		
	}
	//커리어 파일 저장소: 경찬
	public String craeerFiles(MultipartFile files) {
		
		UUID uuid = UUID.randomUUID();
		String uploadPath = application.getRealPath("/files/tutorCareer");
		String saveName = uuid+"_"+ files.getOriginalFilename();	
		File saveFile = new File(uploadPath,saveName);
		
		try {
			
			files.transferTo(saveFile);
			//업로드 파일에 saveFile이라는 껍데기 입힘
			System.out.println("파일크기:" + saveFile.length() + "파일사이즈:" + files.getSize());
			
		} catch (IllegalStateException e) {
			//즉 브라우져에 보낼 데이터를 버퍼에 쓴 이후로는 redirect나 forward를 할수 없을떄 일어난다(forward나 redirect)
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	log.info( "이 업로드한 파일은" +files);
	log.info("이 업로드된 파일이다" + saveName);
	log.info("업로드된 파일의 경로는 " + uploadPath);
	
	return saveName;
	
	}
	
	
	//pdf 파일 뷰어
	@RequestMapping(value="/pdf.do",produces = "application/pdf;charset=utf-8")	
	@ResponseBody
	public ResponseEntity<Byte[]> showPdf(String fileName)throws IOException{
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + fileName);
		
		String path = realPath + fileName;
		log.info("sfsfsdfs@@@@@@@@@@@@@@@@@@@@@@@@: " + path);
		
		File file =  new File((path));
		FileInputStream fis = new FileInputStream(file);
		InputStreamResource inputStreamResource = new InputStreamResource(fis);
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentLength(file.length());
		headers.add("Content-Disposition", "inline");
		
		return new ResponseEntity(inputStreamResource, headers, HttpStatus.OK);

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
	@PostMapping(value="/addTutor")
	public ResponseEntity<String> addTutor(Tutor tutor,
											  MultipartFile tutor_img1,
											  MultipartFile tutor_career_file1,HttpSession session
											 ) 
											  throws AddException{
		
		System.out.println("jsp넘어온 데이터:" + tutor);
		log.info("이미지파일:" + tutor_img1);
		log.info("이력서파일:" + tutor_career_file1);
		
		String tutor_id = (String)session.getAttribute("loginInfo");

		if (tutor_id == null) {
			throw new AddException("예외발생: 로그인 안되서 발생");
		}
	
		Member m = new Member();
		m.setMember_id(tutor_id);
		
		String tutor_fileName = saveFile(tutor_img1);
		String tutor_careerfile = craeerFiles(tutor_career_file1);
		
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
	
	//강사신청정보 수정: 경찬
	@PostMapping(value="updateTutor")
	public ResponseEntity<String> updateTutor(HttpSession session,
											 Tutor tutor1,
											 MultipartFile tutor_img1,
											 MultipartFile tutor_career_file1,
											 @RequestParam Map<String,Object> tutor
											)throws ModifyException{
		
		System.out.println("jsp넘어온 데이터:" + tutor);
		log.info("이미지파일:" + tutor_img1);
		
		String tutor_id = (String)session.getAttribute("loginInfo");	
		Member member = new Member();
		member.setMember_id(tutor_id);
		tutor.put("tutor_id", tutor_id);		
		String tutor_img = saveFile(tutor_img1);		
		String tutor_career_file = craeerFiles(tutor_career_file1);
		
		tutor1.setMember(member);
		tutor1.setTutor_img(tutor_img);
		tutor1.setTutor_career_file(tutor_career_file);
		
		tutor1.setMember(member);
		tutor1.setTutor_img(tutor_img);
		
		try {
			
			service.tutorUpdate(tutor1,tutor);
			
			return ResponseEntity.status(HttpStatus.OK).body("수정완료");
			
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("수정이실패하였습니다");

		}
	
	}
	
	//강사사진 수정
	@PostMapping(value="/changeImg")
	public ResponseEntity<String> changeImg(Tutor tutor ,MultipartFile tutor_img1, HttpSession session
			,HttpServletResponse response) throws ModifyException{
		
		
		String member_id = (String) session.getAttribute("loginInfo");
		Member member = new Member();
		member.setMember_id(member_id);
		String tutor_img = saveFile(tutor_img1);
		
		tutor.setMember(member);
		log.info("@@@@@@@@@@@@@@@@@강사 정보:" + tutor);
		tutor.setTutor_img(tutor_img);
		response.setContentType("text/html; charset=UTF-8");
		
		
		try {
			
			PrintWriter out = response.getWriter();
			service.tutorImage(tutor);
			out.println("<script>alert('사진이수정되었습니다'); location.href='/shallwe/tutor/showTutor';</script>");
			out.flush();
			out.close();
			
		} catch (ModifyException e) {
			
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("수정이실패하였습니다");
		} catch (IOException e) {
			
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("수정이실패하였습니다");
		}
		
		return ResponseEntity.status(HttpStatus.OK).body("수정완료");
	}
		
	//강사이력서파일변경:경찬
	@PostMapping(value="/changeCareer")
	public ResponseEntity<String> changeCareer(Tutor tutor ,MultipartFile tutor_career_file1,
												HttpSession session,
												HttpServletResponse response) throws ModifyException{
		
		String member_id = (String) session.getAttribute("loginInfo");
		Member member = new Member();
		member.setMember_id(member_id);
		String tutor_career_file = craeerFiles(tutor_career_file1);
		
		tutor.setMember(member);
		tutor.setTutor_career_file(tutor_career_file);
		response.setContentType("text/html; charset=UTF-8");
		
		try {
			
			PrintWriter out = response.getWriter();
			service.tutorCareer(tutor);
			out.print("<script>alert('파일이변경되었습니다'); location.href='/shallwe/tutor/showTutor';</script>");
			out.flush();
			out.close();
		} catch (ModifyException e) {
			
			e.printStackTrace();
			
			
		} catch (IOException e) {
		
			e.printStackTrace();
		} 
		
		return ResponseEntity.status(HttpStatus.OK).body("파일변경완료");
	}
	

		
	
}
