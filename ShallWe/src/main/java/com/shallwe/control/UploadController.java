package com.shallwe.control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.shallwe.exception.AddException;
import com.shallwe.exception.ModifyException;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="upload")
public class UploadController {
	
	@Autowired private TutorService service;
	@Autowired private ServletContext application;
	
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
	
	//PDF파일 이미지로 변환 : 경찬
	@RequestMapping(value="/pdf",method=RequestMethod.GET)	
	public void pdf(HttpServletRequest request, HttpServletResponse response ,String f) {

		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		 
		try{
			
//			 String fileName = "/files/tutorCareer";
			 String uploadPath = application.getRealPath("/files/tutorCareer/"+f);
			 log.info("보여줄 pdf:" + uploadPath);
			 File file = new File(((HttpSession) request).getServletContext().getRealPath(uploadPath));
			 log.info("보여줄 pdf 파일:" + file);
		    // 보여주기
			 response.setContentType("application/pdf");
			 response.setHeader("Content-Description", "JSP Generated Data");
		    // 다운로드
		    //response.addHeader("Content-Disposition", "attachment; filename = " + file.getName() + ".pdf");
		 
		    fis = new FileInputStream(file);
		    int size = fis.available();
		    
		    byte[] buf = new byte[size];
		    int readCount = fis.read(buf);
		 
		    response.flushBuffer();
		 
		    bos = new BufferedOutputStream(response.getOutputStream());
		    bos.write(buf, 0, readCount);
		    bos.flush();
		} catch(Exception e) {
			e.printStackTrace();
		    response.setContentType("text/html;charset=euc-kr");
		    PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
			    out.println("alert('파일 오픈 중 오류가 발생하였습니다.');");
			    out.println("</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} finally{
		    try{
		        if(fis != null) fis.close();
		        if(bos != null) bos.close();
		    } catch(IOException e){
		        e.printStackTrace();
		    }    
		}
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
											  MultipartFile tutor_career_file1,HttpSession session) 
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
	
	//강사신청정보 수정: 경찬
	@PostMapping(value="updateTutor")
	public ResponseEntity<String> updateTutor(HttpSession session,
											 Tutor tutor
											)throws ModifyException{
		
		String member_id = (String) session.getAttribute("loginInfo");
		Member member = new Member();
		member.setMember_id(member_id);	
		tutor.setMember(member);
		log.info("@@@@@@@@@@@@@강사정보:" + tutor);
		try {
			
			service.tutorUpdate(tutor);
			return ResponseEntity.status(HttpStatus.OK).body("수정완료되었습니다");
		} catch (Exception e) {
			e.printStackTrace();
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
			
		} catch (ModifyException e) {
			
			e.printStackTrace();
			
			
		} catch (IOException e) {
		
			e.printStackTrace();
		} 
		
		return ResponseEntity.status(HttpStatus.OK).body("파일변경완료");
	}
	
		
		
	
}
