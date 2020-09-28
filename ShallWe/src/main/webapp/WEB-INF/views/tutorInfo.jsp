<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="basic.css" />
     <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="css/core.css">
  	 <script 
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"> </script>
    <style>
    html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}
body {
  line-height: 1;
}
ol,
ul {
  list-style: none;
}
blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

.body-center {
  margin: 0 auto;
  /* border: 1px solid blue; */
  margin: 0 auto;
  width: 66%;
}

.container-center {
  width: 66%;
  margin: 0 auto;
  /* border: 1px solid red; */
}

.header h1 {
  margin-top: 40px;
  font-weight: bold;
  font-size: 2.5rem;
}

.herder-border {
  margin-top: 24px;
  border-bottom: 2px solid #000000;
}

 /* .head-photo {
  width: 300px;
  height: 300px;
  margin: 50px 0;
} */
.title {
  text-transform: uppercase;
  font-weight: bold;
  position: relative;
}

.title h4 {
  display: inline-block;
  margin-right: 10px;
  font-size: 1.5rem;
  color: black;
}

.title h6 {
  display: inline-block;
  color: #a00404;
  top: 0px;
  font-size: 1.2rem;
  position: absolute;
}

.title-border {
  margin-top: 10px;
  margin-bottom: 15px;
  border-bottom: 1px solid #000000;
}

.person-detail p {
  line-height: 1.5rem;
  margin-bottom: 20px;
}

.profile-detail p {
  line-height: 1.5rem;
  margin-bottom: 50px;
}
.education {
  line-height: 2rem;
  margin-bottom: 50px;
}

.skill {
  color: white;
  background-color: #415165;
  padding-top: 20px;
}

.skill-title {
  text-align: center;
  margin: 0 auto;
  width: 80%;
}

.skill-title h2 {
  margin-right: 5px;
  font-size: 1.5rem;
  display: inline-block;
}

.skill-title h4 {
  font-size: 1.2rem;
  display: inline-block;
}

.skill-border {
  margin-top: 10px;
  margin-bottom: 30px;
  border-bottom: 1px solid white;
}

.skill-content {
  /* text-align: center; */
  padding-bottom: 10px;
  width: 20%;
  margin: 0 auto;
  margin-bottom: 50px;
}

.skill-content ul {
  /* text-align: center; */
  border-left: 1px solid #96a9c4;
}

.skill-content li {
  margin-bottom: 1rem;
  text-align: left;
  font-weight: 100;
  font-size: 1.1rem;
  margin-left: 20px;
}

body
{
	padding: 50px;
}

.animate
{
	transition: all 0.1s;
	-webkit-transition: all 0.1s;
}

.action-button
{
	position: relative;
	padding: 10px 40px;
  margin: 0px 10px 10px 0px;
  float: left;
	border-radius: 10px;
	font-family: 'Pacifico', cursive;
	font-size: 25px;
	color: #FFF;
	text-decoration: none;	
}

.blue
{
	background-color: #3498DB;
	border-bottom: 5px solid #2980B9;
	text-shadow: 0px -2px #2980B9;
}
.action-button:active
{
	transform: translate(0px,5px);
  -webkit-transform: translate(0px,5px);
	border-bottom: 1px solid;
}
.box {

    width: 250px;
    height: 250px; 
    border-radius: 70%;
    overflow: hidden;
}
.img{
width: 100%;
    height: 100%;
    object-fit: cover;


}


    </style>
<script>
$(function(){

	
	$('a#dellTutor').click(function(e){
	let $dell = confirm("강사신청을취소하시겠습니까?");
	if($dell == true){

		$.ajax({
			url:"/shallwe/tutor/dellTutor"
		   ,mehod: "GET"
		   ,success: function(data){		   
			alert("강사신청을취소하셨습니다.");
			location.href = "http://localhost/shallwe/"
		
		   }//end of success
		});//end of ajax 

		} else if($dell == false) {
			
			alert("취소되었습니다");
			e.preventDefault();

	  }
	}); // end of buttonClick
});
</script>
  </head>
 
  <body>
   <c:forEach var ="t" items ="${tutor}" begin="0" end="0">
    <div class="body-center">
      <div class="container-center">
        <div class="header">
          <h1>
        	${t.member.member_name}
        	<span id="tutor_id" value="${t.member.member_id}">${t.member.member_id}</span>
          </h1>
          <div class="herder-border"></div>
          <br />
        </div>
        
        <div class="profile">
        <div class="box">
          <img src="${contextPath}/tutorImages/${t.tutor_img}" class="img"/>
          </div>
          <br />
          <div class="title">
          <br />
            <h6>profile</h6>
            <div class="title-border"></div>
          </div>
          <div class="person-detail">
            <p>
            <label for="name">닉네임:</label>
              <span id="nickName">${t.tutor_nickname}</span><br />
            </p>
          </div>
          <div class="profile-detail">
            <p>
         	<label for="nickName">이메일:</label>
         	${t.member.member_email}<br />
            </p>
          </div>
          <div class="title">
            <h6>education</h6><br />
            <div class="title-border"></div>
          </div>
          <div class="education">
            <p>
              <label id="tutor_craeer">강사활동:</label>
              <a href="${contextPath}/tutorImages/${t.tutor_career_file}"><li>강사커리어</li></a></p><br>
           	<label id="tutor_craeer">SNS:</label>
           	<li>${t.tutor_link}</li><br />
           	<label id="tutor_introduce">강사한마디:</label>
           	<li>${t.tutor_introduce}</li><br />
           	<label id ="tutor_yn">강사등록여부:</label>
           	<li>${t.member.tutor_YN}</li>
            </p>
          </div>
              </c:forEach>
          <div class="skill">
            <div class="skill-title">
              <h4>SKILLS</h4>
              <div class="skill-border"></div>
            </div>
            <div class="skill-content">
              <ul>
                <li></li>
                 <c:forEach var ="t" items ="${tutor}" begin="0" end="3">
                <li>${t.lectureCategory.lecture_category_name}</li>
                 </c:forEach>
              </ul>
            </div>
          </div>
          <a href="#" class="action-button shadow animate blue" id="dellTutor">강사신청취소</a>
           <a href="#" class="action-button shadow animate blue" id="dellTutor">신청정보수정</a>
        </div>
      </div>
    </div>
  </body>
 
</html>