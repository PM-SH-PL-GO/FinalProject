<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="memberId" value="${sessionScope.loginInfo}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shallwe-함께 배우는 교육공간</title>
     <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="/shallwe/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/slicknav.css">
    <link rel="stylesheet" href="/shallwe/assets/css/flaticon.css">
    <link rel="stylesheet" href="/shallwe/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="/shallwe/assets/css/gijgo.css">
    <link rel="stylesheet" href="/shallwe/assets/css/animate.min.css">
    <link rel="stylesheet" href="/shallwe/assets/css/animated-headline.css">
	<link rel="stylesheet" href="/shallwe/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="/shallwe/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
	<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
	<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
	<link rel="stylesheet" href="/shallwe/assets/css/style.css">
	<style>
.menu-wrapper
{float:left;}

.mr-40
{margin-left: 20px}
.mr-40
{text-align: center;}
.header-btns a i
{vertical-align: bottom;}

.header-area .menu-wrapper .main-menu ul li a i
{font-size: 50px}
.btn{
background : #00dbd5;
font-size: 16px;
}
.btn::before {
	background: #009994;
}
.registered{
	margin-right: -150px;
	
}

a.community{
cursor: pointer;
}
#tutorSetBtn{
color: white;
}
#tutorLectureBtn{
color: white;
}
.menu-wrapper{
margin-left:5%;
}
#tutorSetBtn{
 margin-bottom: 15px;
}

#studBoard, #faq{
font-size: 20px;}
</style>
<script>
$(function(){
	//----------강사여부 확인 LOAD START---------
		var $topbarBtn = $('#tutorOrLecture');
		var topbarBtnData = "";
		if("${memberId}"==null||"${memberId}"==""){
			topbarBtnData = "<a class=\"btn\" id=\"tutorSetBtn\">강사 등록</a>"
			$topbarBtn.html(topbarBtnData);				

			
		}else{
			$.ajax({
				url:"${contextPath}/member/tutorYN"
				,success:function(data){
					if(data=='N'){
						topbarBtnData = "<a class=\"btn\" id=\"tutorSetBtn\">강사 등록</a>"
					}else{
						topbarBtnData = "<a class=\"btn\" id=\"tutorLectureBtn\">강사회원입니다.</a>"
// 						topbarBtnData = "<a class=\"btn\" id=\"tutorLectureBtn\">내 강의보기(강사)</a>"
					}
					$topbarBtn.html(topbarBtnData);	
			
				}
				,error:function(data){
				}
			});
			
		}
	
	//----------강사여부 확인 LOAD END---------
	//----------로그인 버튼 CLICK START---------
	$("a#login").click(function(){
		location.href = "${contextPath}/userLogin";
	});
	//----------로그인 버튼 CLICK END---------
	
	//----------FAQ CLICK START---------
	$("#faq").click(function(){
		location.href = "${contextPath}/board/faqList";
	});
	//----------FAQ CLICK END---------
	
	//----------강의등록 버튼 CLICK START---------	
// 	$("#tutorSetBtn").click(function(){
	$("#tutorOrLecture").on("click","#tutorSetBtn",function(){
		if("${sessionScope.loginInfo}" == null ||"${sessionScope.loginInfo}" == ""){
			alert("로그인 후 강의 등록이 가능합니다.");
		}else{
			location.href = "${contextPath}/instructor";		
		}
	});
	//----------강의등록 버튼 CLICK END---------	
	
	//----------강사 강의등록 버튼 CLICK START---------		
// 	$("#tutorLectureBtn").click(function(){
	$("#tutorOrLecture").on("click","#tutorLectureBtn",function(){
		location.href = "${contextPath}/lectures/tutorLecture";		
	});
	//----------강사 강의등록 버튼 CLICK START---------		
	
	//----------스터디게시판 CLICK START---------	
	$("#studBoard").click(function(){
		location.href = "${contextPath}/board/studyBoard";
	});
	//----------스터디게시판 CLICK END---------	

	//----------자유게시판 CLICK START---------	
	$("#freeBoard").click(function(){
		location.href = "${contextPath}/freeBoard";
	});
	//----------자유게시판 CLICK END---------	

	//----------회원가입 CLICK START---------		
	$("#signUp").click(function(){
		location.href = "${contextPath}/member/signup";
	});
	//----------회원가입 CLICK END---------		
	
	//----------내 정보보기 CLICK START---------	
	$("#myInfo").click(function(){
		location.href = "${contextPath}/myinfoTutorInfo";
	});
	//----------내 정보보기 CLICK END---------	

	//----------내 강의보기 CLICK START---------	
	$("#myLecture").click(function(){
		location.href = "${contextPath}/lectures/memberLecture";
	});
	//----------내 강의보기 CLICK END---------	
	
	//----------내 찜목록보기 CLICK START---------	
	$("#wishList").click(function(){
		location.href = "${contextPath}/member/wishlist";
	});
	//----------내 강의보기 CLICK END---------	
	
	//----------내 찜목록보기 CLICK START---------	
	$("#myInfoTutorInfo").click(function(){
		location.href = "${contextPath}/tutor/showTutor";
	});
	//----------내 강의보기 CLICK END---------	

	//----------로그아웃 CLICK START---------	
	$("#signOut").click(function(){
		$.ajax({
			url:"${contextPath}/member/memberLogout"
			,method:"POST"
			,success:function(data){
				var responseObj = JSON.parse(data);
				if(responseObj.status =="success"){
					alert("로그아웃");
					location.reload();
					
				}else{
					alert("로그아웃 실패");
				}
			}
		});
	});
	//----------로그아웃 CLICK END---------	
});

</script>
</head>
<body>
  <!-- topbar Start -->
  <header>
        <div class="header-area header-transparent">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div
						class="menu-wrapper d-flex align-items-center justify-content-between">
						<!-- Logo -->
						<div class="logo">
							<a href="${contextPath}"><img src="${contextPath}/assets/img/logo/shallwelogo.png" alt="" style="width: 160px;" ></a>
								
						</div>
						<!-- Main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a id="studBoard" class="community">공부 게시판</a>
										</li>
									<li><a id="faq" class="community">FAQ</a>
										</li>

								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="main-header header-stick  registered">
				<div class="container-fluid">
					<div class="menu-wrapper d-flex align-items-center justify-content-between" style="float: right;margin-right: 12%;">
						<!-- Header-btn -->
						<div class="header-btns d-none d-lg-block f-right" id="tutorOrLecture">
						</div>
						<div class="main-menu f-right d-none d-lg-block ">
							<nav>
								<ul id="navigation">
									<li><a href="#"><i class="ti-user"></i></a>
										<ul class="submenu">
										<c:choose>
											<c:when test="${empty memberId}">
												<li><a id ="login" class="community">로그인</a></li>
												<li><a id ="signUp" class="community">회원가입</a></li>
											</c:when>
											<c:otherwise>
												<li><a id ="myInfo" class="community">내 정보보기</a></li>
												<li><a id ="myInfoTutorInfo" class="community">내 강사 정보보기</a></li>
												<li><a id ="wishList" class="community">내 찜목록보기</a></li>
												<li><a id ="myLecture" class="community">내 수강목록</a></li>
												<li><a id ="signOut" class="community">로그아웃</a></li>
											</c:otherwise>
										</c:choose>
										</ul>
									</li>
								</ul>
							</nav>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
        <!-- topbar End -->
    </header>

</body>
</html>