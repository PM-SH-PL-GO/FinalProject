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


		$("input#userName").keypress(function(e){
			
			
			localStorage.test;
			localStorage.getItem('userName');
			
			});


		$("input#userName").focus(function(){
			
			 let $saveId = $('input#userName').val();
			 localStorage.test = $saveId;
			 localStorage.setItem('userName',$saveId);
			 
			 
			});
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
				//유효성 검사 (지우면 안됌)
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
						   let $url = "/shallwe/";
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
				 
				 // 유효성 떄문에 놔둔것이니 지우지 말아주세요
			 }/*  else if(idR.test($idValCheck) == false){
				 
				 $("input#idInsert").select();
				 $msgIdFor.show();
				 
			
			 } */ else if($("input#emailInsert").val()==""){
		
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
			let $url = "/shallwe/idCheck";
			location.href = $url;
		 });

// 회원가입 페이지 이동
	$("#signup").click(function(){
		loation.href = "/shallwe/member/signup";
	});
 });