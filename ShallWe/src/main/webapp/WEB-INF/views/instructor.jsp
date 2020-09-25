<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Animated Sidebar Menu | CodingLab</title>
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

			$('button#addTutor').click(function(){
				
				 let form = $('#fileUpload')[0];
	             let formData = new FormData(form);
                 formData.append("tutor_img1", $("input[name=tutor_img1]")[0].files[0]);
                 formData.append("tutor_career_file1", $("input[name=tutor_career_file1]")[0].files[0]);
            
				let tutor_category_id = [];
    	        $("input:checkbox[name='category']:checked").each(function (index) {
    	        	tutor_category_id.push($(this).val());
   
    	        });
    
				$.ajax({
					
					url:'/shallwe/upload/addTutor'
				   ,method:"POST"
				   ,processData: false
				   ,contentType: false
				   ,data: formData
					,success:function(){

						   let $tutor = confirm('강사등록을 원하십니까?');
							 
							 if ($tutor == true ) {
								 
								location.href = "http://localhost/shallwe/"
								 
							} else {	
								alert("취소하셧습니다");
								location.reload; 
								
							}
					    
					} // end of success
  		 		 }); // end of ajax
 		 		 return false;
	});// end of click
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
 <h1>강사 등록</h1>
 <form method="post" enctype="multipart/form-data" id="fileUpload" accept-charset="">
 <div class="cer" >
    <div style="margin:3em;"> 
		<br>
         <input class="uploadImage" type="file" name="tutor_img1" accept="imags/*"/>
         <br>
			 <img  id="select_img" src="#" alt = "your image" style="width:100%;max-width:100%;"/>
			 <br />
		 </div> 
        <fieldset> 	 
          <legend><span class="number">1</span>강사 기본정보 </legend>       
          <label for="name">닉네임:</label>
          <input type="text" id="nickName" name="tutor_nickname" placeholder="ex)카드값죠체리">
          
          <!-- <label for="email">이메일:</label>
          <input type="email" id="email" name="user_email" placeholder="ex)newDate@gmail.com" id="gmail"> -->
          
           <label for="email">링크:</label>
          <input type="text" id="rink" name="tutor_link" placeholder="ex)https://www.instagram.com/">
          
           <div style="margin:4em; margin-top:10px;" >
           <input  class = "file2" type="file" name="tutor_career_file1" accept="imags/*,">
            
			<br>
		 </div>
        </fieldset>
	</div>
	

		<div class="form2" id = "tutor_info">
        <fieldset>
          <legend><span class="number">2</span> 강사 프로필</legend>
          <label for="coment">강사 한마디:</label>
          <textarea id="coment" name="tutor_introduce" placeholder="강사한마디"></textarea>
          
          <!-- <label for="job">직업선택:</label>
          <select id="job" name="user_job">
            <optgroup label="Web Development">
              <option value="frontend_developer">Front-End Developer</option>
              <option value="backend_developer">Back-End Developer</option>
              <option value="fullstack_developer">Full-Stack Developer</option>
              <option value="web_designer">Web Designer</option>
            </optgroup>
            <optgroup label="Mobile Development">
              <option value="android_developer">Android Developer</option>
              <option value="ios_developer">iOS Developer</option>
              <option value="mobile_designer">Mobile Designer</option>
            </optgroup>
            <optgroup label="Business">
              <option value="business_owner">Business Owner</option>
              <option value="freelancer">Freelancer</option>
            </optgroup>
          </select> -->
          
          <br><br>
     
          <label>강의 선택:</label>
          <br />
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="IT">
          <label class="light" for="development">IT</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="HO">
          <label class="light" for="design">HOBBY(취미)</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="DE">
          <label class="light" for="business">디자인</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="CA">
          <label class="light" for="business">취업</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="BU">
          <label class="light" for="business">비지니스</label>
           <br />
         
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="LE">
          <label class="light" for="business">학습</label>
          
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="SP">
          <label class="light" for="business">스포츠</label>
          <br />
          
          <input hidden="hidden" name ="lectureCategory.lecture_category_id1">
          <input hidden="hidden" name ="lectureCategory.lecture_category_id2">
          <input hidden="hidden" name ="lectureCategory.lecture_category_id3">
          
          
            
        </fieldset>
       <div style="margin:3em;">
			<button type="submit" id="addTutor" class="btn btn-primary btn-lg resume" 
			id="load1" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing Order">준비되셨다면 등록해주세요</button>
			<br>
			
			</div>
      </div>
      </form>

</div>



</body>
</html>
    