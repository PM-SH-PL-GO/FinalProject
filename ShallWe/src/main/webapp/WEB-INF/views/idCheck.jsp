<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Shallwe-아이디 찾기</title>
   <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
   <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
   <link href="${contextPath}/css/idCheck.css">
   <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   <script src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
   <script src="${contextPath }/js/idCheck.js" />
  
    </head>
    <body>
      <form action="idEmailCheck" method="post">
      <jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
        <h1>ID CHECK</h1>
        
        <fieldset>	
<!--           <legend><span class="number">1</span> Your basic info</legend> -->
          <label for="name">이름:</label>
          <input type="text" id="name" name="user_name">
          
          <label for="email">Email:</label>
          <span hidden="hidden" class="mailR" style="color: red; font-size: 0.8em;"><i>이메일 형식이 맞지 않습니다</i></span>
          <input type="email" id="email" name="user_email">
        </fieldset>
          <div style="margin:3em;">
			  <br>
			<button type="button" class="btn btn-primary btn-lg resume" 
			id="load2" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Order">CHECK!</button>
		 </div>
      </form>
    </body>
</html>