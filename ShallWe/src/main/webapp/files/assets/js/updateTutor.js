$(function(){
	
        	function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#select_img').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("input[name=tutor_img1]").change(function() {
                readURL(this);
            });

            // 강사 소개 멘트 자수 제한
            $('textarea#coment').on('keyup', function() {
				if($(this).val().length > 300) {
			alert("글자수는 300자로 이내로 제한됩니다.");
					$(this).val($(this).val().substring(0, 300));
				}
			});
            
			//url 유효성검
        	let checkUrl = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
			let $msgUrl = $('span.checkUrl');
			$msgUrl.hide();
			//url end
			
			//체크 갯수 유효성 검사
			$("input[type='checkBox']").on('click',function(e){
				let $checkCnt = $("input:checkbox[name='lectureCategory.lecture_category_id']:checked").length;
				if($checkCnt > 3){
					$(this).attr("checked",false)
					$("input:checkbox[name='lectureCategory.lecture_category_id']:checked").prop('checked', false);
					alert("전공분야는 최대 3개 까지 선택가능합니다");
					}
				});
			//체크 갯수 유효성 검사 end
			
			
			 //---------버튼시작-------------------\\ 
			$('button#addTutor').click(function(e){
				
				//파일 업로드 formdata  
				 let form = $('#fileUpload')[0];
	             let formData = new FormData(form);
                 formData.append("tutor_img1", $("input[name=tutor_img1]")[0].files[0]);
                 formData.append("tutor_career_file1", $("input[name=tutor_career_file1]")[0].files[0]);
                 //파일 업로드 formdata end 
               	
               // 최종 submit 버튼
                let $tutor = confirm('강사신청서 수정을 진행하시겠습니까?(주의)기존의 있던 정보들은 삭제됩니다.');
                // 닉네임 벨류값
                let $nickName = $('input#nickName').val(); 
                // 이미지 벨류값   
                let $fileCheck = $("input[name=tutor_img1]").val();
                // 파일 벨류값
              	let $careerCheck = $("input[name=tutor_career_file1]").val();
            		// 체크된 값을 넘김  
            	let totalChecked = 0;
				let tutor_category_id = [];
    	        $("input:checkbox[type='checkbox']:checked").each(function (index) {
    	        	tutor_category_id.push($(this).val());	        	
    	    	   });  // 체크된 값을 넘김 end
    	       
    	        
				// url 유효성 검사 
				let $urlCheck = $('input#link').val();

				//서버통신 시작
				if(checkUrl.test($urlCheck) == false){
					
					 $('input#link').select();
					alert("주소양식을 맞춰주세요");
					return false;
					// url 유효성 검사 end

				}else if($fileCheck == ""){
					  
                    alert("사진을 올려주세요");
                    return false;
		             
				}else if ($careerCheck == ""){

						alert("PDF파일을 올려주세요");
						return false;
					
					}else if ($nickName == '') {
						
				alert("닉네임을 입력해주세요");
				return false;

			    }else if($tutor == true){ 
						
					$.ajax({
					
					url:'/shallwe/upload/updateTutor'
				   ,method:"POST"
				   ,processData: false
				   ,contentType: false
				   ,data: formData
				   ,success:function(){
				
					alert("강사등록 신청을 수정되었습니다");
					location.href = "/shallwe"
								 
				
					} // end of success
  		 		 }); // end of ajax
				} else {
					alert("수정이 취소되었습니다");
					location.reload();
					e.preventDefault();

				} // end of confirm
				return false;
	});// tutor_add end of click
	 //---------버튼 end-------------------\\ 
	 
	 
	 
    //닉네임중복 확인  
			$('input.checkNickName').click(function(){
			let $tutor_nickName = $('input#nickName').val();
				
					$.ajax({

						url:'/shallwe/tutor/updateNickName'
					   ,method:"POST"
					   ,data:{tutor_nickName:$tutor_nickName}
					   ,success: function(data){
						   
					   		if(data != 0){
					   			
						   		alert("중복된아이디입니다");
						   		
						   		} else if(data == 0){
						   		
									$("input.checkNickName").attr("value","사용가능합니다");
									alert("사용가능한 아이디입니다");
							   		
							   		}

						   }//end of success
						
					});// end of ajax
				return false;
				});//end of Nicknameclick

				var
				doSomething = function() {
					/* do something with Error */
				},
				submitAction = function() {
					setTimeout(doSomething, 0);
				    return false;
				};
				$('form').bind('submit', submitAction);
		
});    