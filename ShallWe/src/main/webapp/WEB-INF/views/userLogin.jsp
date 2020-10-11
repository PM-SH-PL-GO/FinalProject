<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shallwe-로그인</title>
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
<link rel="styleshee" href=https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css>
<link rel="stylesheet" href="${contextPath}/assets/css/login.css">
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="${contextPath}/js/login.js"></script>
</head>
<body>
<body> 
<h1>로그인</h1>
    <div class="info">
    <a href="https://www.grandvincent-marion.fr" target="_blank">
<!--     <p> Made with <i class="fa fa-heart"></i> by Marion Grandvincent </p></a> -->
    </div>
<div class="content">
	<div class="container">	
			<div class="menu">
				<a href="#connexion" class="btn-connexion"><h2 >로그인</h2></a>
				 <a href="#enregistrer" class="btn-enregistrer active" id = PWDCHECK style="color: black;"><h2>비밀번호 찾기</h2></a>
			</div>
			<div class="connexion">
				<div class="contact-form">
					<label >ID</label>
					<span hidden="hidden" class="idR" style="color: red; font-size: 0.8em;"><i>[영어/숫자/언더바 사용가능/4~16자]</i></span>
					<input placeholder="name" name="member_id" type="text" id="userName">
					<span hidden="hidden" id="one_help">Name must be filled out!</span>
					
					<label >PASSWORD</label>
					<span hidden="hidden" class="pwdChk" style="color: red; font-size: 0.8em;"><i>비밀번호가 일치하지 않습니다</i></span>
					<input placeholder="password" name="member_pwd" type="password" id="userPassword">
					<span hidden="hidden" id="one_Password">Password must be filled out!</span>
					
					<div class="check">
						<label>				
							<input id="check" type="checkbox" class="checkbox">
								
						</label>
					</div>
					<input class="submit" value="로그인" type="submit" id ="signin">
					<input class="submit" value="회원가입" type="submit" id ="signup">
					<input class="submit" value="아이디 찾기" type="submit" id ="idCheck">
				</div>
				
			</div>
			
			<div class="enregistrer active-section">
				<div class="contact-form">
					<label >USERNAME</label>
					<span hidden="hidden" class="idFor" style="color: red; font-size: 0.8em;"><i>[영어/숫자/언더바 사용가능/4~16자]</i></span>
					<input placeholder="" type="text" id="idInsert"><span hidden="hidden" id="one_id">Name must be filled out!</span>
					
					<label >E-MAIL</label>
					<span hidden="hidden" class="mailR" style="color: red; font-size: 0.8em;"><i>이메일 형식이 맞지 않습니다</i></span>
					<input placeholder="" type="text" id="emailInsert"><span hidden="hidden" id="one_email">Email must be filled out!</span>
					<div class="check">
						
				</div>
					<input class="submit" value="임시비밀번호 받기" type="submit" id="RandomPassword">	
				</div>
					<input class="submit" value="임시비밀번호 체크" type="submit" id="Password">
					
			
			</div>
	</div>

</div>

</body> 
</body>
</html>
