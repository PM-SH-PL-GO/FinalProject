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
	<link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/gijgo.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/animated-headline.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/slick.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/style.css">
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
color: white !important;
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
.myInfoTutorInfo{
color: white !important;
}
.menu-wrapper{
margin-left:5%;
}
#tutorSetBtn{
 margin-bottom: 15px;
}

#studBoard, #faq{
font-size: 20px;}

.submenu .side{
left: -177px !important;
top: -17px!important;
background: #00b3ad!important;
}
.col-lg-8{
max-width: 95%;
}
.col-sm-6{
padding-left: 0px;
}
</style>
<script>
$(function(){
	//----------강사여부 확인 LOAD START---------
		var $topbarBtn = $('#tutorOrLecture');
		var $tutorInfoBtn = $('#tutorInfoBtn');
	
		var topbarBtnData = "";
		var tutorInfoBtn = "";
		if("${memberId}"==null||"${memberId}"==""){
			topbarBtnData = "<a class=\"btn\" id=\"tutorSetBtn\">강사 등록</a>"
			$topbarBtn.html(topbarBtnData);				
		}else{
			$.ajax({
				url:"${contextPath}/member/tutorYN"
				,success:function(tutor){
					if(tutor.length==0){
						topbarBtnData = "<a class=\"btn\" id=\"tutorSetBtn\">강사 등록</a>"						
					}else{
						console.log(tutor[0].member.tutor_YN);
							tutorInfoBtn += "<a>강사정보</a>"
							tutorInfoBtn += "<ul class=\"submenu side\" >"
							tutorInfoBtn += "<li><a class=\"community myInfoTutorInfo\">내 강사 정보보기</a></li>"
							tutorInfoBtn += "<li><a class=\"community myInfoTutorLecture\">내 강의 목록</a></li>"
							tutorInfoBtn += "<li><a class=\"community addLecture\">강의신청</a></li></ul>"
							// 에러나요...ㅎ_ㅎ
							if(tutor[0].member.tutor_YN=='Y'){
								topbarBtnData = "<a class=\"btn myInfoTutorInfo\">강사회원입니다.</a>"
							}else{
								topbarBtnData = "<a class=\"btn\">예비강사입니다.</a>"
							}
					}
					$topbarBtn.html(topbarBtnData);	
					$tutorInfoBtn.html(tutorInfoBtn);
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
	$("#tutorOrLecture").on("click","#tutorSetBtn",function(){
		if("${sessionScope.loginInfo}" == null ||"${sessionScope.loginInfo}" == ""){
			alert("로그인 후 강의 등록이 가능합니다.");
		}else{
			location.href = "${contextPath}/instructor";		
		}
	});
	//----------강의등록 버튼 CLICK END---------	
	
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
		location.href = "${contextPath}/member/myinfo";
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
	
	//----------내  강사정보보기(버튼) CLICK START---------	
	$(".myInfoTutorInfo").click(function(){
		location.href = "${contextPath}/tutor/showTutor";
	});
	//----------내 강사정보보기(버튼) CLICK END---------	
	
	//----------내  강사정보보기 CLICK START---------	
	$("#tutorInfoBtn").on("click",".myInfoTutorInfo",function(){
		location.href = "${contextPath}/tutor/showTutor";
	});
	//----------내 강사정보보기 CLICK END---------	
	
	//----------내 강사 강의목록 CLICK START---------	
	$("#tutorInfoBtn").on("click",".myInfoTutorLecture",function(){
		var $topbarBtn = $('#tutorSetBtn').html();
		if($topbarBtn=="예비강사입니다."){
			alert("강사 승인 대기 상태입니다. 강사 승인 후 이용가능합니다.");
		}else{
		location.href = "${contextPath}/lectures/tutorLecture";	
		}
	});
	//----------내 강사 강의목록 CLICK END---------	
	
	//----------내  강사정보보기 CLICK START---------	
	$("#tutorInfoBtn").on("click",".addLecture",function(){
		var $topbarBtn = $('#tutorSetBtn').html();
		if($topbarBtn=="예비강사입니다."){
			alert("강사 승인 대기 상태입니다. 강사 승인 후 이용가능합니다.");
		}else{		
		location.href = "${contextPath}/lectures/insert";
		}
	});
	//----------내 강사정보보기 CLICK END---------	

	//----------로그아웃 CLICK START---------	
	$("#signOut").click(function(){
		$.ajax({
			url:"${contextPath}/member/memberLogout"
			,method:"POST"
			,success:function(data){
				if(data != 0){
					alert("로그아웃");
					location.reload();
					location.href = "${contextPath}";
					
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
        <div class="header-area header-transparent" style="z-index: 999">
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
												<li><a>회원정보</a>
													<ul class="submenu side" >
		                                           		 <li><a id ="myInfo" class="community">내 정보보기</a></li>
		                                           		 <li><a id ="wishList" class="community">내 찜목록보기</a></li>
		                                           		 <li><a id ="myLecture" class="community">내 수강목록</a></li>
                                        			</ul>
                                    			</li>
												<li id="tutorInfoBtn">
												</li>
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