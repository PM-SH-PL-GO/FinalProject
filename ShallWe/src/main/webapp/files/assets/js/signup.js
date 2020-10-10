//<!--id duplicate check click Start-->
//		function ()
//		$(".btn_type3").on("click",function(){
//			if()
	
	
//		});				
//<!--id duplicate check click End-->				

//<!--Email select option start-->
function InsertTitle(str) {
	if(str !=""){
		document.getElementById("domain").value = str;
		document.getElementById("domain").readOnly = true;
		document.getElementById("domain").style.background = "#DCDCDC";
	}else{
		document.getElementById("domain").value = "";
		document.getElementById("domain").readOnly = false;
		document.getElementById("domain").style.background = "#FFFFFF";
		document.getElementById("domain").focus();
		
	}
}				
//<!--Email select option end-->



//<!-- Sign Up Start-->					
function signUp(){
	var checkArray = new Array();
	$("input[name=favorites]:checked").each(function(){
		checkArray.push($(this).val());

		for(check in checkArray){
		$('#favorite1').val(checkArray[0]);
		$('#favorite2').val(checkArray[1]);
		$('#favorite3').val(checkArray[2]);
		};
	});
	var memPhone = null;
	var memPhone1 = $("#memberPhone1").val(); 
	var memPhone2 = $("input[name=memberPhone2]").val(); 
	var memPhone3 =  $("input[name=memberPhone3]").val();
	memPhone =  memPhone1+memPhone2+memPhone3;
	$("#memberPhone").val(memPhone);
	
	var memEmail = $("#memEmail").val();
	var memDomain = $("#domain").val();
	var memberEmail = null; 
	memberEmail = memEmail+"@"+memDomain;
	$("#memberEmail").val(memberEmail);
	
	$.ajax({
		url:"/shallwe/member/signup",
		type:"POST",
		data:$("#signupform").serialize(),
		success:function(response){
			if(response=="success"){
				alert("반갑습니다. 회원가입이 완료되었습니다.^^");
				location.href= "/shallwe";
			}else if(response!="success"){
				alert("뭔가잘못되었습니다");
			}
		}
	})
				return false;
}
//<!-- Sign Up End-->	
