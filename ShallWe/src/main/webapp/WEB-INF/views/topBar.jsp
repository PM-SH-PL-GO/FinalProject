<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

 .header-btns
{margin-left: 410px} 
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
</style>
<script>
$(function(){
	//----------로그인 버튼 CLICK START---------
	$("a#login").click(function(){
		location.href = "/shallwe/userLogin";
	});
	//----------로그인 버튼 CLICK END---------
	
	//----------FAQ CLICK START---------
	$("#faq").click(function(){
		location.href = "/shallwe/board/faqList";
	});
	//----------FAQ CLICK END---------
	
	//----------강의등록 버튼 CLICK START---------	
	$("#tutorSetBtn").click(function(){
		if("${sessionScope.loginInfo}" == null ||"${sessionScope.loginInfo}" == ""){
			alert("로그인 후 강의 등록이 가능합니다.");
		}else{
			location.href = "/shallwe/instructor";		
		}
	});
	//----------강의등록 버튼 CLICK END---------	
	
	//----------강사 강의등록 버튼 CLICK START---------		
	$("#tutorLectureBtn").click(function(){
		location.href = "/shallwe/tutorLectureList";		
	});
	//----------강사 강의등록 버튼 CLICK START---------		
	
	//----------스터디게시판 CLICK START---------	
	$("#studBoard").click(function(){
		location.href = "/shallwe/board/studyBoard";
	});
	//----------스터디게시판 CLICK END---------	

	//----------자유게시판 CLICK START---------	
	$("#freeBoard").click(function(){
		location.href = "/shallwe/freeBoard";
	});
	//----------자유게시판 CLICK END---------	

	//----------회원가입 CLICK START---------		
	$("#signUp").click(function(){
		location.href = "/shallwe/signup";
	});
	//----------회원가입 CLICK END---------		
	
	//----------내 정보보기 CLICK START---------	
	$("#myInfo").click(function(){
		location.href = "/shallwe/myinfo";
	});
	//----------내 정보보기 CLICK END---------	

	//----------내 강의보기 CLICK START---------	
	$("#myLecture").click(function(){
		location.href = "/shallwe/memberLectureList";
	});
	//----------내 강의보기 CLICK END---------	

	//----------로그아웃 CLICK START---------	
	$("#signOut").click(function(){
		$.ajax({
			url:"/shallwe/member/memberLogout"
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
							<a href="/shallwe"><img
								src="/shallwe/assets/img/logo/shallwelogo.png" alt=""></a>
						</div>
						<!-- Main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="#">커뮤니티</a>
										<ul class="submenu">
											<li><a id="studBoard" class="community">공부 게시판</a></li>
											<li><a id="freeBoard" class="community">자유게시판</a></li>
											<li><a id="faq" class="community">FAQ</a></li>
										</ul></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="main-header header-stick  registered">
				<div class="container-fluid">
					<div class="menu-wrapper d-flex align-items-center justify-content-between" style="float: right; margin-right: 100px">
						<!-- Header-btn -->
						<div class="header-btns d-none d-lg-block f-right">
							<c:choose>
								<c:when test="${empty tutorId}">
									<a class="btn" id="tutorSetBtn">강사 등록</a>
								</c:when>
								<c:otherwise>
									<a class="btn" id="tutorLectureBtn">내 강의보기(강사)</a>
								</c:otherwise>
							</c:choose>
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
												<li><a id ="myLecture" class="community">내 강의보기</a></li>
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