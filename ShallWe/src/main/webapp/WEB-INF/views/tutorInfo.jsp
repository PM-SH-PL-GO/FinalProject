<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Shallwe-강사정보</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="basic.css" />
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="css/core.css">
  	<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
  	<link rel="stylesheet" href="${contextPath}/assets/css/tutorInfo.css">
  	 <script 
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"> </script>
	<script src="${contextPath}/js/tutorInfo.js"></script>
  </head>

  <body>
   <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
    <div class="body-center">
      <div class="container-center">
        <div class="header">
          <h1>
        	${t.member.member_name}
        	<span id="tutor_id" value="${t.member.member_id}">${t.member.member_id}</span>
        	
          </h1>
          <div class="herder-border"></div>
          <br />
        </div>
        
        <div class="profile">
        <div class="box">
           <img src="${contextPath}/tutorImages/${t.tutor_img}" class="img"/>
          </div>
          <br />
          <div class="filebox">
          </div>
           </div> 
          <div class="title">
          <br />
            <h6>profile</h6>
            <div class="title-border"></div>
          </div>
          <div class="person-detail">
            <p>
            <label for="name">닉네임:</label>
              <span id="nickName">${t.tutor_nickname}</span><br />
            </p>
          </div>
          <div class="profile-detail">
            <p>
         	<label for="nickName">이메일:</label>
         	${t.member.member_email}<br />
            </p>
          </div>
          <div class="title">
            <h6>education</h6><br />
            <div class="title-border"></div>
          </div>
          <div class="education">
            <p>
            </p>
            
             <label id="tutor_craeer">강사활동:</label>
             	  <button class = "career" id="${t.tutor_career_file}"><span>PDF 보기</span></button>
             	  <input hidden="hidden" id="pdfId" value="${t.member.member_id}">
             	  <iframe></iframe>
            
            <form method="post" enctype="multipart/form-data" id="fileUpload" action="${contextPath}/upload/changeCareer">      
                 <%-- <a href="${contextPath}/tutorImages/${t.tutor_career_file}"><li>강사커리어</li></a></p><br> --%>       
           	 <br />
            	 <label>PDF 파일변경:</label>		         
		           <input  class = "file2" type="file" name="tutor_career_file1" accept="imags/*," id ="PDF">
		           <br />
	        	    <input type="submit" value="업로드" style ="width: 70px; position: relative; left: 95px;">
	        </form>	    
             </p><br>         
           	<label id="tutor_craeer">SNS:</label>
           	<li>${t.tutor_link}</li><br />
           	<label id="tutor_introduce">강사한마디:</label>
           	<li>${t.tutor_introduce}</li><br />
           	<label id ="tutor_yn">강사등록여부:</label>
           	<c:if test="${t.member.tutor_YN eq 'Y'}">
	           	<li>승인</li>
           	</c:if>
           	<c:if test="${t.member.tutor_YN eq 'N' && empty t.tutorReject.reject_reason}">
	           	<li>승인대기</li>
           	</c:if>
           	<c:if test="${t.member.tutor_YN eq 'N' && not empty t.tutorReject.reject_reason}">
	           	<li>반려</li><br>
	           	<label id ="tutor_reject">강사반려여부:</label>
	           	<li>${t.tutorReject.reject_reason}</li>
           	</c:if>
           	<br />
            </p>
          </div>
              </c:forEach>
          <div class="skill">
            <div class="skill-title">
              <h4>SKILLS</h4>
              <div class="skill-border"></div>
            </div>
            <div class="skill-content">
              <ul>
                <li></li>
                 <c:forEach var ="t" items ="${tutor}" begin="0" end="3">
                <li>${t.lectureCategory.lecture_category_name}</li>
                 </c:forEach>
              </ul>
            </div>
          </div>
          <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
          	<c:if test="${t.member.tutor_YN eq 'Y'}">
          <a href="#" class="action-button shadow animate blue" id="updateTutor">등록정보수정</a>
             </c:if>
     		<c:if test="${not empty t.tutorReject.reject_reason}">
         	<span></span>
         	</c:if> 
         	<c:if test="${empty t.tutorReject.reject_reason and t.member.tutor_YN eq 'N'}">
         	 <a href="#" class="action-button shadow animate blue" id="ModifyTutor">신청정보확인수정</a>	
         	 <a href="#" class="action-button shadow animate blue" id="cancleTutor">강사신청취소</a>
          	</c:if> 
 	 	</c:forEach>
        </div>
      </div>
    </div>
  </body>

</html>