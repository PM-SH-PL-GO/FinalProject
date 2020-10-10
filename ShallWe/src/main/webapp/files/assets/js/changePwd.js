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