<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Shallwe-강사등록</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,100,900);
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-weight: bolder;
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

.list-items .icons a:first-child{
  margin-left: 0px;
}

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
    margin-right: 50%;
    margin-top: 50px;
  
   
  }
    .form2 {
    max-width: 480px;
    margin-top: -680px;
    margin-left: 55%;
  }
  .content{
  
  margin-top: 100px;
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
#tutor_info{

	float:left;
	right: 300px;
	bottom:175px;
	height: 600px;
	width: 80%;
	margin-top: -1050px;

}
</style>
    <script 
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"> </script>
   <script src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
   <script src="${contextPath}/js/instructor.js"></script>
  </head>
  <jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include> 
  <body>
<div class="content">

 <br />
 <form method="post" enctype="multipart/form-data" id="fileUpload" accept-charset="">
 <div class="cer" >
    <div style="margin:3em;"> 
		<br>
			 <img  id="select_img" src="https://www.flaticon.com/kr/premium-icon/icons/svg/3201/3201254.svg" 
			 alt = "사진을 올려주세요!" style="width:100%;max-width:100%; position: center;"/>
			 <br />
			 <div class="filebox">
		<label for="ex_file">자기자신을표현해주세요</label>
         <input hidden="hidden class="uploadImage" type="file" name="tutor_img1" accept="imags/*" id="ex_file"/>
         <br>
         </div>
		 </div> 
        <fieldset> 	 
          <legend><span class="number">1</span>강사 기본정보 </legend>       
          <label for="name">닉네임:</label>
          <input type="text" id="nickName" name="tutor_nickname" placeholder="ex)카드값죠체리">
          <input type="button" class="checkNickName" value ="닉네임중복확인"><br /><br />
        
           <label for="email">링크:</label>
          <input type="text" id="link" name="tutor_link" placeholder="ex)https://www.instagram.com/">
         <span hidden="hidden" class="checkUrl" style="color: red; font-size: 0.8em;"><i>[주소양식이 맞지 않습니다]</i></span>
           <div style="margin:4em; margin-top:10px;">
           <div class="filebox2">
    		<label for="PDF">활동이력을 PDF 로올려주세요</label>
           <input class = "file2" type="file" name="tutor_career_file1" accept="imags/*," id ="PDF">
             </div>
			<br>
		 </div>
        </fieldset>
	</div>
		<div class="form2" id = "tutor_info">
        <fieldset>
          <legend><span class="number">2</span> 강사 프로필</legend>
          <label for="coment">강사 한마디:</label>
          <textarea id="coment" name="tutor_introduce" placeholder="강사한마디"></textarea>
          <br><br>
     
          <label>강의 선택:</label>
          <br />
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="IT">
          <label class="light" for="development">IT 정보기술</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="LA">
          <label class="light" for="design">Language 언어</label>
          <br />
            
          <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="MA">
          <label class="light" for="business">Marketing 마케팅</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="DE">
          <label class="light" for="business">Design 디자인</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="CA">
          <label class="light" for="business">Career 실무역량</label>
           <br />
           
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="BU">
          <label class="light" for="business">Business 비지니스</label>
           <br />
         
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="MU">
          <label class="light" for="business">Music 음악</label>
          <br />
          
           <input type="checkbox" id="classCheck" name ="lectureCategory.lecture_category_id" value="SP"> 
           <label class="light" for="business">Sports 스포츠</label> 
          <br /> 
             
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
<%-- <jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include>  --%>
    