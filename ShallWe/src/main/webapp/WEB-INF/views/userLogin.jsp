<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css > -->
<!-- <link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css>
<link rel="stylesheet" href=https://fonts.googleapis.com/css?family=Roboto>
 -->
 <link rel="styleshee" href=https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css>
 <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
 <style>
 body {
  font-family: 'Open Sans',sans-serif;
  font-weight: 500;
  color:#fff 
}
.info p {
  text-align:center;
 
  text-transform:none;
  font-weight:600;
  font-size:15px;
  margin-top:2px
}

.info i {
  color:#55acee;
}

h1 {
  text-align:center; 
  
  text-shadow: 1px 1px 0px #FFF;
  margin:50px 0px 0px 0px
}

h2 {
  font-size: 20px;
  font-weight: 600;
  
}

h3 {
  font-size: 17px;
  font-weight: 600;
}

a {
  color:white;		
  text-decoration: inherit;
  }

a:hover {
  text-decoration: inherit;
}

hr {
  position: relative;
  margin-top: 10%;
  border: 1px solid #fff;
  border-radius: 50px;
  opacity: 0.15;
}

.content {

  position: absolute;
  
  right: 0;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 900px;
 /*  background: #f2f2f2; */
  z-index:3;
  background-image: url('https://images.unsplash.com/photo-1599687266197-6c66c083b39c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80');
  background-repeat : no-repeat;
  background-size: 100%;
  background-position: center;
  background-origin: content-box;
  
}

.container {
  display: block;
  position: relative;
  width: 530px;
  height: 679px;
  margin: auto;
  margin-top: 180px; 
  box-shadow: 1px 5px 10px 1px #333;
  overflow:hidden;
  
}

img.bg-img {
  display: block;
  position: absolute;
  margin: auto;
  overflow: auto;
}

.menu {
  position: relative;
  padding: 15% 13% 0 13%;
}

.menu h2 {
  display: inline;
  margin: 20px;
  padding-bottom: 3px;
  border-bottom: 3px solid #3BABE4;
}
a:not(.active) {
  cursor:inherit;
}
a:not(.active2) {
  cursor:inherit;
}
.menu .active h2 {
  border-bottom: 0 solid #1161ee;
  color: #AEAEAE;
  transition: color 0.5s ease-in;
}

.menu .active2 h2 {
  border-bottom: 0 solid #1161ee;
  color: #AEAEAE;
  transition: color 0.5s ease-in;
}


.connexion {
    position: absolute;
    padding: 15% 13%;
    width: 74%;
    left:0px;
    transition: all 0.7s;
}

.connexion h2 {
    display: inline;
    margin: 20px;
    padding-bottom: 3px;
    border-bottom: 2px solid #1161ee;
}

.connexion h4 {

    margin-bottom: 0;
    margin-top: 20px;
    text-align: center;
    color: #ffffff;
  /*   opacity: 0.3; */
}

.connexion h4:hover {
    opacity: 0.8;
    transition: all 0.1s ease-in;
}

label {
    display: block;
    margin-top: 10px;
    padding: 5px 10px;
    font-size: 15px;
    font-weight: 600;
    
}

input {

    display: block;
    width: 100%;
    margin: auto;
    padding: 13px;
    border: 3px;
    border-radius: 20px;
    font-family: "Roboto",sans-serif; 
    opacity: 0.5;
   	font-size: 25px;
   	font-style: oblique;
    font-weight: bold;
  	

}

input p {

  /*  color: #fff; */
/*     opacity: 3; */
}

input.submit {

	position:relative;
	right: 20px;
    width: 100%;
    margin: 20px;
    padding: 10px;
    font-size: 17px;
    font-weight: 700;
    color: #fff;
    opacity: 1;
    background-color: #00DBD5;
    cursor: pointer;
}

.check label {
    float: left;
    width: 10%;
    margin-left: 5%;
    
}

.check h3 {
    padding: 15px;
}

.checkbox {
    display: none;
}

.checkbox:checked + svg .path-moving {

    -webkit-transition: stroke .4s,stroke-dasharray .4s,stroke-dashoffset .4s cubic-bezier(.3,.8,.6,1.5);
    transition: stroke .4s,stroke-dasharray .4s,stroke-dashoffset .4s cubic-bezier(.3,.8,.6,1.5);
    stroke-dasharray: 25 90;
    stroke-dashoffset: 0;
    background-color:  black;
    
}


.path-moving,
.path-back {
    fill: none;
    stroke: #1161ee;
    stroke-width: 3px;
    stroke-linecap: round;
    stroke-linejoin: round;
}

.path-moving {
    -webkit-transition: stroke .4s,stroke-dasharray .4s,stroke-dashoffset .4s;
    transition: stroke .4s,stroke-dasharray .4s,stroke-dashoffset .4s;
    stroke: #ffffff;
    stroke-dasharray: 110;
    stroke-dashoffset: -32;
}
.enregistrer {
    position: absolute;
    padding: 15% 13%;
    width: 74%;
    right:0px;
    transition: all 0.7s;
}
.enregistrer2 {
    position: absolute;
    padding: 15% 13%;
    width: 74%;
    right:0px;
    transition: all 0.7s;
}
.active-section {
    position: absolute;
    right:500px;
}
.remove-section {
    position: absolute;
    left: 500px;
}
.active-section2 {
    position: absolute;
    right:500px;
}
.remove-section2 {
    position: absolute;
    left: 500px;
}

 </style>
 
 <script>
 $(function(){

	 $('.btn-enregistrer').click(function() {
		 
		   $('.connexion').addClass('remove-section');
		 	$('.enregistrer').removeClass('active-section');
		   $('.btn-enregistrer').removeClass('active');
		   $('.btn-connexion').addClass('active');
		 });

		 $('.btn-connexion').click(function() {
		   $('.connexion').removeClass('remove-section');
		 	$('.enregistrer').addClass('active-section');	
		   $('.btn-enregistrer').addClass('active');
		   $('.btn-connexion').removeClass('active');
		 });
		 
// 	아이디 입력란 유효성 검사 //
	
	//아이디 비밀번호 에러 메세지//
		let $msgMail = $("span.mailR");
		let $msgPwd = $("span.pwdChk");
		let $msgId = $("span.idR");
		let $msgIdFor = $("span.idFor");
		
   // 정규식 아이디 비밀번호 체크
		let nameR = /^[가-힣]{2,16}$/;
	    let idR = /^([a-z0-9_]){4,16}$/;
	    let pwdR = /^[a-zA-Z0-9!@#$%^&*?_~]{4,16}$/;
	    let mailR= /^[A-Z0-9+_.-]+@[A-Z0-9.-]+$/i;
	    let telR =/^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;

//로그인-------
			
		 $('input#signin').click(function(){
			 
			 let $idVal = $("input#userName").val();
			 let $pwdVal = $("input#userPassword").val();
			 
			if($("input#userName").val() == "") {
				$("span#one_help").slideDown(2000); //0.1초 동안 슬라이드로 내려오면서 보이기
				$("span#one_help").slideUp(2000); //0.1초 동안 슬라이드로 올라가면서 감추기
				$("span#one_help").css("color","red"); 
				return false;
				
			} else if(idR.test($idVal) == false){
			//아이디 [영어/숫자/언더바 사용가능/4~16자] 맞지 않으면 에러메세지
				$("input#userName").select();
				$msgId.show();
				
			} else if($("input#userPassword").val()== ""){
				 
				$("span#one_Password").slideDown(1000); //0.1초 동안 슬라이드로 내려오면서 보이기
				$("span#one_Password").slideUp(2000); //0.1초 동안 슬라이드로 올라가면서 감추기
				$("span#one_Password").css("color","red"); 
				return false;
				
			} /* else if(pwdR.test(pwdVal) == false){
				// 비밀번호 맞지 않으면 비밀번호가 일치하지 않습니다 에러메세지 
				$("input#userPassword").select();
				$msgPwd.show();
			} */ else {

				$.ajax({
					url:"/shallwe/member/memberLogin"
				   ,method:"POST"
				   ,data:{member_id:$idVal,member_pwd:$pwdVal}
				   ,success:function(data){
					   let responseObj = JSON.parse(data);
					   if(responseObj.status == "success"){
						   
						   alert('로그인성공');
						   let $url = "/shallwe/?member_id="+$idVal+"&member_pwd="+$pwdVal;
						   location.href= $url;
						   
						   } else{
							   
							   alert("로그인실패");
							   location.reload();
							   
						   }
					   }//end of success
					});// end of ajax
				}//end of else
		 }); // end of click

//로그인-------END----------------
		 
// 		 비밀번호 찾기 이메일
		 
		 $("input#Password").click(function(){
			 
			 let $idValCheck = $("input#idInsert").val();
		     let $mailCheck = $("input#emailInsert").val();
		     
		
			 if($("input#idInsert").val()==""){
				
				 $("span#one_id").slideDown(2000);
				 $("span#one_id").slideUp(2000);
				 $("span#one_id").css("color","red");
				 
			 } else if(idR.test($idValCheck) == false){
				 
				 $("input#idInsert").select();
				 $msgIdFor.show();
				 
			
			 } else if($("input#emailInsert").val()==""){
		
				 $("span#one_email").slideDown(2000);
				 $("span#one_email").slideUp(2000);
				 $("span#one_email").css("color","red");
				 
			 } else if(mailR.test($mailCheck) == false){
				 
				 $("input#emailInsert").select();
				 $msgMail.show();
			 } else {

				 $.ajax({
						
						url:"/shallwe/email/pwdEmailCheck"
					   ,method:'POST'
					   ,data:{member_name:$idValCheck,member_email:$mailCheck}
					   ,success:function(data){
							let responseObj = JSON.parse(data)
							console.log(data);
							if(responseObj.status == 'success'){
								 
										alert("이메일이 전송되었습니다.");
										location.href = "/shallwe/userLogin";
									
							}else{
		
								alert("정보를 다시 입력해주세요");
						}
				      }	//end of success 
				   });// end of ajax
				 } //end of else
		 }); //end of email click

		// 임시비밀번호발급
		 $("input#RandomPassword").click(function(){
			 let $idValCheck = $("input#idInsert").val();
		     let $mailCheck = $("input#emailInsert").val();
		     
		     $.ajax({
					
					url:"/shallwe/email/randomPwd"
				   ,method:'POST'
				   ,data:{member_name:$idValCheck,member_email:$mailCheck}
				   ,success:function(data){
						let responseObj = JSON.parse(data)
						console.log(data);
						if(responseObj.status == 'success'){
							 
									alert("임시비밀번호가 발급되었습니다");
						}else{
	
							alert("정보를 다시 입력해주세요");
					}
			      }	//end of success
			   });// end of ajax
			 });//end of click 


//아이디 찾기 페이지 이동
		 $("input#idCheck").click(function(){

			 let $url = "http://localhost/shallwe/idCheck";
			location.href = $url;
			 
		 });

		 $

		
 });
 </script>
</head>
<body>
<body> 
<h1>Login & registration </h1>
    <div class="info"><a href="https://www.grandvincent-marion.fr" target="_blank">
<!--     <p> Made with <i class="fa fa-heart"></i> by Marion Grandvincent </p></a> -->
    </div>
  
<div class="content">
	<div class="container">
	
			<div class="menu">
				<a href="#connexion" class="btn-connexion"><h2>SIGN IN</h2></a>
				 <a href="#enregistrer" class="btn-enregistrer active" id = PWDCHECK><h2>Forgot Password?</h2></a>
			</div>
			<div class="connexion">
				<div class="contact-form">
					<label>USERNAME</label>
					<span hidden="hidden" class="idR" style="color: red; font-size: 0.8em;"><i>[영어/숫자/언더바 사용가능/4~16자]</i></span>
					<input placeholder="name" name="member_id" type="text" id="userName">
					<span hidden="hidden" id="one_help">Name must be filled out!</span>
					
					<label>PASSWORD</label>
					<span hidden="hidden" class="pwdChk" style="color: red; font-size: 0.8em;"><i>비밀번호가 일치하지 않습니다</i></span>
					<input placeholder="password" name="member_pwd" type="password" id="userPassword">
					<span hidden="hidden" id="one_Password">Password must be filled out!</span>
					
					<div class="check">
						<label>				
							<input id="check" type="checkbox" class="checkbox">
								<svg xmlns="http://www.w3.org/2000/svg" width="26px" height="23px">
									<path class="path-back"  d="M1.5,6.021V2.451C1.5,2.009,1.646,1.5,2.3,1.5h18.4c0.442,0,0.8,0.358,0.8,0.801v18.398c0,0.442-0.357,0.801-0.8,0.801H2.3c-0.442,0-0.8-0.358-0.8-0.801V6"/>
									<path class="path-moving" d="M24.192,3.813L11.818,16.188L1.5,6.021V2.451C1.5,2.009,1.646,1.5,2.3,1.5h18.4c0.442,0,0.8,0.358,0.8,0.801v18.398c0,0.442-0.357,0.801-0.8,0.801H2.3c-0.442,0-0.8-0.358-0.8-0.801V6"/>
								</svg>
						</label>
						<h3>Keep me signed in</h3>
					</div>
					<input class="submit" value="SIGN IN" type="submit" id ="signin">
					<input class="submit" value="SIGN UP" type="submit" id ="signup">
					<input class="submit" value="ID CHECK" type="submit" id ="idCheck">
				</div>
				
			</div>
			
			<div class="enregistrer active-section">
				<div class="contact-form">
					<label>USERNAME</label>
					<span hidden="hidden" class="idFor" style="color: red; font-size: 0.8em;"><i>[영어/숫자/언더바 사용가능/4~16자]</i></span>
					<input placeholder="" type="text" id="idInsert"><span hidden="hidden" id="one_id">Name must be filled out!</span>
					
					<label>E-MAIL</label>
					<span hidden="hidden" class="mailR" style="color: red; font-size: 0.8em;"><i>이메일 형식이 맞지 않습니다</i></span>
					<input placeholder="" type="text" id="emailInsert"><span hidden="hidden" id="one_email">Email must be filled out!</span>
					<div class="check">
						
				</div>
					<input class="submit" value="RandomPassword" type="submit" id="RandomPassword">	
				</div>
					<input class="submit" value="Password Check" type="submit" id="Password">
					
			
			</div>
	</div>

</div>

</body> 

</body>
</html>