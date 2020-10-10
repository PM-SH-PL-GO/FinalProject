$(function(){
	

	let mailR= /^[A-Z0-9+_.-]+@[A-Z0-9.-]+$/i;
	let $msgMail = $("span.mailR");

	$("button#load2").click(function(){
			let $nameVal = $("input#name").val();
			let $emailVal = $("input#email").val();
			
			if(mailR.test($emailVal) == false){
				 
				 $("input#email").select();
//				 $msgMail.show();
				 $("input#email").type = "text";
				 
			 } else {
					$.ajax({
						
						url:"/shallwe/email/idEmailCheck"
					   ,method:'POST'
					   ,data:{member_name:$nameVal,member_email:$emailVal}
					   ,success:function(data){
							let responseObj = JSON.parse(data)
							if(responseObj.status == 'success'){
								 
										alert("이메일이 전송되었습니다.");
										location.href = "/shallwe/userLogin";
									
							}else{
		
								alert("정보를 다시 입력해주세요");

						}
				   }	   

				});
			 }
		});

	
});