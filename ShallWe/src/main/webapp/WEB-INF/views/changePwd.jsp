<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Shallwe-비밀번호 변경</title>
   <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
   <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   <script
  src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
  <link href="${contextPath}/css/changePwd.css">
  <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
  <script src="${contextPath}/js/changePwd.js"/>
 </head>
<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include> 
    <body>
      <form action="changePassword" method="post">
        <h1>Password</h1>
    
        <fieldset>
          <label for="name">아이디:</label>
           <span hidden="hidden" class="idR" style="color: red; font-size: 0.8em;"><i>아아디가올바르지 않습니다.</i></span>
          <input type="text" id="insertId" name="idCheck" placeholder="ex)홍길동">
          
           <label for="name">핸드폰:</label>
           <span hidden="hidden" class="PhoneR" style="color: red; font-size: 0.8em;"><i>핸드폰번호를 올바르게 입력해주세요</i></span>
          <input type="text" id="phoneNumber" name="phoneCheck"placeholder="'-'추가해서 입력해주세요">
          
           <label for="password">임시비밀번호:</label>
          <span hidden="hidden" class="pwdR" style="color: red; font-size: 0.8em;"><i>비밀번호를 다시 입력해주세요</i></span>
          <input type="password" id="temporary" name="temporary">
          
          <label for="password">변경할번호:</label>
          <span hidden="hidden" class="pwdR" style="color: red; font-size: 0.8em;"><i>비밀번호를 다시 입력해주세요</i></span>
          <input type="password" id="password" name="changePasswrod">
        </fieldset>
          <div style="margin:3em;">
			  <br>
			<button type="button" class="btn btn-primary btn-lg resume" 
			id="load2" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Order">CHECK!</button>
		 </div>
      </form>
    </body>
</html>