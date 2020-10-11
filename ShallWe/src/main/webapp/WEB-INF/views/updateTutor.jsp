<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Shallwe-강사신청 정보 수정</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <script 
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"> </script>
   <script src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
  	<link href="${contextPath}/assets/css/updateTutor.css">
	<script src="${contextPath}/js/updateTutor.js"></script>
  </head>
  <jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include> 
  <br />
  <body>
<div class="content">

 <form method="post" enctype="multipart/form-data" id="fileUpload" accept-charset="">
 <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
 <div class="cer" >
    <div style="margin:3em;"> 
		<br>
			 <img id="select_img" name="dell_imags" src="https://www.flaticon.com/kr/premium-icon/icons/svg/3201/3201254.svg" 
			 alt = "사진을 올려주세요!" style="width:100%; max-width:100%; " />
			 <br />
			 
			 <div class="filebox">
		<label for="ex_file">강사님의 사진을 등록해주세요</label>
         <input hidden="hidden" class="uploadImage" type="file" name="tutor_img1" accept="imags/*"id="ex_file"/>
         <br>
         </div>
		 </div> 
        <fieldset> 	 
          <legend><span class="number">1</span>강사 기본정보 </legend>       
          <label for="name">닉네임:</label>
          <input type="text" id="nickName" name="tutor_nickname" placeholder="ex)카드값죠체리" value="${t.tutor_nickname}">
          <input type="button" class="checkNickName" value ="닉네임중복확인" style="background-color: #00DBD5; border-radius: 5px;
           border: 1px solid #00DBD5;"><br /><br />
        
           <label for="email">링크:</label>
          <input type="text" id="link" name="tutor_link" placeholder="ex)https://www.instagram.com/" value="${t.tutor_link}">
         <span hidden="hidden" class="checkUrl" style="color: red; font-size: 0.8em;"><i>[주소양식이 맞지 않습니다]</i></span>
          <div class="filebox2">
          <label for="PDF">활동이력을 PDF 로올려주세요</label>
           <input class = "file2" type="file" name="tutor_career_file1" accept="imags/*," id ="PDF">
           </div>
        </fieldset>
	</div>
</c:forEach>


		<div class="form2" id = "tutor_info">
        <fieldset>
        <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
          <legend><span class="number">2</span> 강사 프로필</legend>
          <label for="coment">강사 한마디:</label>
          <textarea id="coment" name="tutor_introduce" placeholder="강사한마디" value="${t.tutor_introduce}"></textarea>
          <br><br>
  		</c:forEach>
          <label>강의 선택:</label>
          <br />
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="IT">
          <label class="light" for="development">IT 정보기술</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="HO">
          <label class="light" for="design">Language 언어</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="MA">
          <label class="light" for="business">Marketing 마케팅</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="DE">
          <label class="light" for="business">Design 디자인</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="CA">
          <label class="light" for="business">Career 실무역량</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="BU">
          <label class="light" for="business">Business 비지니스 컨설팅</label>
           <br />
         
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="LE">
          <label class="light" for="business">Music 음악</label>
          <br />
          
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="SP"> 
           <label class="light" for="business">Sports 스포츠</label> 
          <br /> 
             
        </fieldset>
       <div style="margin:3em;">
			<button type="submit" id="addTutor" class="btn btn-primary btn-lg resume" 
			id="load1" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing Order">준비되셨다면 등록해주세요</button>
			<br>
			
			</div>
      </div>
      </form>

</div>

</body>
</html>
<%-- <jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include> --%>
    