<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>ChangePassowrd</title>
   <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
   <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   <script
  src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
  
<style>
 *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
 
}

form {

  max-width: 300px;
  margin: 130px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
 
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #3BABE4;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {

  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #00DBD5;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #00DBD5;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #00DBD5;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}
</style>
<script>
$(function(){
	
/* 	$('.resume').on('click', function() {
	    var $this = $(this);
	  $this.button('loading');
	    setTimeout(function() {
	       $this.button('reset');
	   }, 2000);
	}); */

	
	let $msgId = $("span.idR");
	let $msgId1 = $("span.PhoneR"); 
	let $msgId2 = $("span.pwdR"); 
	

	let idR = /^([a-z0-9_]){4,16}$/;
	let telR =/^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;

	$("button#load2").click(function(){
		
			let $pwdVal = $("input#password").val();
			let $idVal = $("input#insertId").val();
			let $phoneVal = $("input#phoneNumber").val();
			let $temporary = $("input#temporary").val();
			
			if(idR.test($idVal) == false){
				$("input#insertId").select();
				$msgId.show();
				
			} else if(telR.test($phoneVal) == false) {
				$("input#phoneNumber").select();
				let $msgId1 = $("span.PhoneR"); 
				
			} else {
				
				let today = new Date();   

				$.ajax({

					url:"/shallwe/member/changePassword"
				   ,method: 'POST'   
 				   ,data:{member_id:$idVal,
 				   		  member_pwd:$pwdVal,
 				   		  member_phone:$phoneVal,
 				   		  member_temporary:$temporary}
		   		  	
				   ,success:function(data){
					   console.log(data)
					   let responseObj = JSON.parse(data);
					   if(responseObj.status == 'success'){
						   
						   let pwdCheck = confirm(today.toLocaleDateString() + " 기준으로 비밀번호를 변경하시겠습니까?");
						   
						 
						   } else if(pwdCheck == true){

							   alert("비밀번호가변경되었습니다");
							   location.href = "/shallwe/userLogin";
						   
						   } else if(pwdCheck == false){
							   
							   alert("비밀번호가 변경되지 않았습니다");
							   location.reload();
							   e.preventDefault();
							   
						   } else {

							   alert("정보가 일치하지 않습니다");
							   
							   }
						   
					   }

					});

				}
		});

});

</script>  
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