$(function(){

	
	$('a#cancleTutor').click(function(e){
	let $dell = confirm("강사신청을취소하시겠습니까?");
	
	if($dell == true){

		$.ajax({
			url:"/shallwe/tutor/dellTutor"
		   ,mehod: "POST"
		   ,success: function(data){		   
			alert("강사신청을취소하셨습니다.");
			location.href = "/shallwe"
		
		   }//end of success
		});//end of ajax 

		} else if($dell == false) {
			
			alert("취소되었습니다");
			e.preventDefault();

	  }
	}); // end of buttonClick

	$("button.career").click(function(e){

		let $pdf = $('input#pdfId').val();
		
		
		let id = $(this).attr("id");
		$iframe = $("iframe");
		 let url = "/shallwe/upload/pdf.do?tutor_id=" + $pdf + "&fileName=" + id;	
		 $iframe.attr("src", url).show();
			
		});

	$('a#ModifyTutor').click(function(){
			let $url = "/shallwe/tutor/showUpdateTutor";
		    location.href= $url;
		
		});
	
	
});