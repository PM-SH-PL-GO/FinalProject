<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>강사신청 정보 수정</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <script 
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"> </script>
   <script src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
  
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
.wrapper{
  height: 100%;
  width: 300px;
  position: relative;
}
.wrapper .menu-btn{
  position: absolute;
  left: 20px;
  top: 10px;
  background: #4a4a4a;
  color: #fff;
  height: 45px;
  width: 45px;
  z-index: 9999;
  border: 1px solid #333;
  border-radius: 5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}
#btn:checked ~ .menu-btn{
  left: 247px;
}
.wrapper .menu-btn i{
  position: absolute;
  transform: ;
  font-size: 23px;
  transition: all 0.3s ease;
}
.wrapper .menu-btn i.fa-times{
  opacity: 0;
}
#btn:checked ~ .menu-btn i.fa-times{
  opacity: 1;
  transform: rotate(-180deg);
}
#btn:checked ~ .menu-btn i.fa-bars{
  opacity: 0;
  transform: rotate(180deg);
}
#sidebar{
  position: fixed;
  background: #404040;
  height: 100%;
  width: 270px;
  overflow: hidden;
  left: -270px;
  transition: all 0.3s ease;
}
#btn:checked ~ #sidebar{
  left: 0;
}
#sidebar .title{
  line-height: 65px;
  text-align: center;
  background: #333;
  font-size: 25px;
  font-weight: 600;
  color: #f2f2f2;
  border-bottom: 1px solid #222;
}
#sidebar .list-items{
  position: relative;
  background: #404040;
  width: 100%;
  height: 100%;
  list-style: none;
}
#sidebar .list-items li{
  padding-left: 40px;
  line-height: 50px;
  border-top: 1px solid rgba(255,255,255,0.1);
  border-bottom: 1px solid #333;
  transition: all 0.3s ease;
}
#sidebar .list-items li:hover{
  border-top: 1px solid transparent;
  border-bottom: 1px solid transparent;
  box-shadow: 0 0px 10px 3px #222;
}
#sidebar .list-items li:first-child{
  border-top: none;
}
#sidebar .list-items li a{
  color: #f2f2f2;
  text-decoration: none;
  font-size: 18px;
  font-weight: 500;
  height: 100%;
  width: 100%;
  display: block;
}
#sidebar .list-items li a i{
  margin-right: 20px;
}
#sidebar .list-items .icons{
  width: 100%;
  height: 40px;
  text-align: center;
  position: absolute;
  bottom: 100px;
  line-height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}
#sidebar .list-items .icons a{
  height: 100%;
  width: 40px;
  display: block;
  margin: 0 5px;
  font-size: 18px;
  color: #f2f2f2;
  background: #4a4a4a;
  border-radius: 5px;
  border: 1px solid #383838;
  transition: all 0.3s ease;
}
#sidebar .list-items .icons a:hover{
  background: #404040;
}
.list-items .icons a:first-child{
  margin-left: 0px;
}
/* .content{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  color: #202020;
  z-index: -1;
  width: 100%;
  text-align: center;
} */
.content .header{
  font-size: 45px;
  font-weight: 700;
}
.content p{
  font-size: 40px;
  font-weight: 700;
}
 *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

/*form {*/
.cer{
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}
.form2 {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
  margin-left: 230px;
 
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
.uploadImage{

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
.file2{

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

  .cer {
    max-width: 480px;
    margin-right: 45%;
    margin-top: 50px;
  
   
  }
    .form2 {
    max-width: 480px;
    margin-top: -680px;
    margin-left: 60%;
  }
  .content{
  
  margin-top: 100px;
  }

}

#tutor_info{

	position: fixed;
	right: 300px;
	bottom:120px;


}

  .filebox  { 
  
   display: inline-block;  
   padding: .5em .75em; 
   color: #FFFFFF; 
   font-size: inherit; 
   line-height: normal; 
   vertical-align: middle; 
   background-color: #00DBD5; 
   cursor: pointer; 
   border: 1px solid #00DBD5;
   border-bottom-color: #00DBD5; 
   border-radius: .25em;
   width: 100%;
   position: center;
   text-align: center;
   
   }
   
   .filebox2  { 
  
   display: inline-block;  
   padding: .5em .75em; 
   color: #FFFFFF; 
   font-size: inherit; 
   line-height: normal; 
   vertical-align: middle; 
   background-color: #00DBD5; 
   cursor: pointer; 
   border: 1px solid #00DBD5;
   border-bottom-color: #00DBD5; 
   border-radius: .25em;
   width: 100%;
   position: center;
   text-align: center;
   
   }

</style>
<script>
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
//                  formData.append("tutor_img1", $("input[name=tutor_img1]")[0].files[0]);
//                  formData.append("tutor_career_file1", $("input[name=tutor_career_file1]")[0].files[0]);
                 //파일 업로드 formdata end 
               	
               // 최종 submit 버튼
                let $tutor = confirm('강사신청서 수정을 진행하시겠습니까?');
                let $nickName = $('input#nickName').val();
            		// 체크된 값을 넘김  
            	let totalChecked = 0;
				let tutor_category_id = [];
    	        $("input:checkbox[type='checkbox']:checked").each(function (index) {
    	        	tutor_category_id.push($(this).val());	        	
    	    	   });  // 체크된 값을 넘김 end
    	        console.log(tutor_category_id);
    	        
				// url 유효성 검사 
				let $urlCheck = $('input#link').val();

				//서버통신 시작
				if(checkUrl.test($urlCheck) == false){
					
					 $('input#link').select();
					alert("주소양식을 맞춰주세요");
					return false;
					// url 유효성 검사 end

					//체크 갯수제한 두기
				} else if ($nickName == '') {
					alert("닉네임을 입력해주세요");
					return false;

			   }else if($tutor == true){ 
					
				
					$.ajax({
					
					url:'${contextPath}/upload/updateTutor'
				   ,method:"POST"
				   ,processData: false
				   ,contentType: false
				   ,data: formData
				   ,success:function(){

					alert("강사등록 신청을 수정되었습니다");
					location.href = "http://localhost/shallwe/"
								 
				
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

						url:'${contextPath}/tutor/updateNickName'
					   ,method:"POST"
					   ,data:{tutor_nickName:$tutor_nickName}
					   ,success: function(data){
						   
					   		if(data != 0){
					   			console.log(data);
						   		alert("중복된아이디입니다");
						   		
						   		} else if(data == 0){
						   			console.log(data);
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

</script>
  </head>
  <jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include> 
  <body>
    <div class="wrapper">
      <input type="checkbox" id="btn" hidden>
      <label for="btn" class="menu-btn">
        <i class="fas fa-bars"></i>
        <i class="fas fa-times"></i>
      </label>
      <nav id="sidebar">
        <div class="title">
				Side Menu</div>
				<ul class="list-items">
				<li><a href="#"><i class="fas fa-home"></i>Home</a></li>
				<li><a href="#"><i class="fas fa-sliders-h"></i>Clients</a></li>
				<li><a href="#"><i class="fas fa-address-book"></i>Services</a></li>
				<li><a href="#"><i class="fas fa-cog"></i>Settings</a></li>
				<li><a href="#"><i class="fas fa-stream"></i>Features</a></li>
				<li><a href="#"><i class="fas fa-user"></i>About us</a></li>
				<li><a href="#"><i class="fas fa-globe-asia"></i>Languages</a></li>
				<li><a href="#"><i class="fas fa-envelope"></i>Contact us</a></li>
				<div class="icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
</ul>
</nav>
    </div>
  
<div class="content">
 <h1>강사 신청 정보 수정</h1>
 <form method="post" enctype="multipart/form-data" id="fileUpload" accept-charset="">
 <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
 <div class="cer" >
    <div style="margin:3em;"> 
		<br>
		<div class="filebox">
		<label for="ex_file">등록된 이미지</label>
         <br>
         </div>
			 <img  id="select_img" name="dell_imags" src="${contextPath}/tutorImages/${t.tutor_img}" style="width:100%;max-width:100%;"/>
			 <br />
		 </div> 
        <fieldset> 	 
          <legend><span class="number">1</span>강사 기본정보 </legend>       
          <label for="name">닉네임:</label>
          <input type="text" id="nickName" name="tutor_nickname" placeholder="ex)카드값죠체리" value="${t.tutor_nickname}">
          <input type="button" class="checkNickName" value ="닉네임중복확인"><br /><br />
        
           <label for="email">링크:</label>
          <input type="text" id="link" name="tutor_link" placeholder="ex)https://www.instagram.com/" value="${t.tutor_link}">
         <span hidden="hidden" class="checkUrl" style="color: red; font-size: 0.8em;"><i>[주소양식이 맞지 않습니다]</i></span>
           <div style="margin:4em; margin-top:10px;">
			<br>
		 </div>
        </fieldset>
	</div>
</c:forEach>


		<div class="form2" id = "tutor_info" style="width: 500px">
        <fieldset>
        <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
          <legend><span class="number">2</span> 강사 프로필</legend>
          <label for="coment">강사 한마디:</label>
          <textarea id="coment" name="tutor_introduce" placeholder="강사한마디">${t.tutor_introduce}</textarea>
          <br><br>
  		</c:forEach>
          <label>강의 선택:</label>
       
          <br />
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="IT">
          <label class="light" for="development">IT 정보기술</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="HO">
          <label class="light" for="design">HOBBY 취미</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="MA">
          <label class="light" for="business">Marketing 마케팅</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="DE">
          <label class="light" for="business">Design 디자인</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="CA">
          <label class="light" for="business">Employment 취업</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="BU">
          <label class="light" for="business">Business 비지니스</label>
           <br />
         
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="LE">
          <label class="light" for="business">Learning 학습</label>
          <br />
          
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="SP"> 
           <label class="light" for="business">Sports 스포츠</label> 
          <br /> 
            
        </fieldset>
       <div style="margin:3em;">
			<button type="submit" id="addTutor" class="btn btn-primary btn-lg resume" 
			id="load1" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing Order">수정이완료 되셨나요??</button>
			<br>
			
			</div>
      </div>
      </form>

</div>

</body>
</html>
    