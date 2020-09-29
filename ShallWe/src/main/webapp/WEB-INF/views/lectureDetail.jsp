<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set value="${lectDetail.lecture}" var="lecture" />
<fmt:formatDate var="startDt" value="${lecture.lecture_start_dt}" pattern="yyyy-MM-dd" />
<fmt:formatDate var="endDt" value="${lecture.lecture_end_dt}" pattern="yyyy-MM-dd" />

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>강의 상세 정보</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="/shallwe/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/slicknav.css">
<link rel="stylesheet" href="/shallwe/assets/css/flaticon.css">
<link rel="stylesheet"
	href="/shallwe/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="/shallwe/assets/css/gijgo.css">
<link rel="stylesheet" href="/shallwe/assets/css/animate.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/animated-headline.css">
<link rel="stylesheet" href="/shallwe/assets/css/magnific-popup.css">
<link rel="stylesheet" href="/shallwe/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
<link rel="stylesheet" href="/shallwe/assets/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
<%-- 화면 호출시 바로 조회 해와야할 데이터 처리 영역 --%>
<%-- 강사-카테고리별 후기 조회--%>
$(document).ready(function() {
	var $reviewAreaObj = $('#reviewArea');
	// 강사별, 카테고리별 리뷰 목록 조회
	$.ajax({
		url : "${contextPath}/reviewList"
		, data : {"tutor_id": "${lecture.tutor.member.member_id}",
				  "category_id":"${lecture.lectureCategory.lecture_category_id}"}
		, success : function (responseData) {
			$reviewAreaObj.append(responseData);
		}
	}); // end of ajax
	
	// 강의신청, 강의결제페이지 호출
	var $applyBtnObj = $('#applyBtn');
	$applyBtnObj.on("click", function() {
		$.ajax({
			url: "${contextPath}/insertMemberLectureHistory"
			, method: "POST"
			, data : {"lecture_category_id" : "${lecture.lectureCategory.lecture_category_id}" ,
					  "lecture_id" : "${lecture.lecture_id}"}
			, success: function(responseData) {
				let responseObj = JSON.parse(responseData);
				if (responseObj.status == "success") {
					alert("강의 신청이 정상적으로 되었습니다.");
				} else {
					alert("강의 신청에 실패했습니다.");
					$("#applyBtn").focus();
				}
			} 
		}); 
	}); // end of 강의신청, 강의결제페이지 호출 
	
	let letidValue = $("input[name=listlecture_id]").val();
	$("div[name=gotoDe]").click(function(){
		location.href = "/shallwe/lectures/detail?lecture_id=" +letidValue;		
	});

	let letidendValue = $("input[name=listendlecture_id]").val();
	$("div[name=gotoDeend]").click(function(){
		location.href = "/shallwe/lectures/detail?lecture_id=" +letidendValue;		
	});
	return false;
}); // end of scriptLoad
</script>
</head>
<body>
	<main>
		<!--? Start Align Area -->
		<div class="whole-wrap">
			<div class="container  box_1170">
				<div class="section-top-border">
					<div class="row">
						<div class="col-md-3">
							<img src="/shallwe/lecture/${lecture.lecture_img}" alt=""
								class="img-fluid">
						</div>
						<div class="col-md-9 mt-sm-20">
							<h3 class="mb-20">${lecture.lecture_title}</h3>
							<div class="d-flex">
								<h6 class="mr-10">상태:</h6>
								<h6>${lecture.lecture_state}</h6>
							</div>
							<div class="d-flex">
								<h6 class="mr-10">장소:</h6>
								<h6>${lectDetail.lecture_location}</h6>
							</div>
							<div class="d-flex">
								<h6 class="mr-10">인원:</h6>
								<h6>${lecture.lecture_current}/${lecture.lecture_max}</h6>
							</div>
							<div class="d-flex">
								<h6 class="mr-10">카테고리:</h6>
								<h6>${lecture.lectureCategory.lecture_category_id}</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex">
					<a href="#introduce"><h5 style="margin: 10px;">강의 소개</h5></a> <a
						href="#curriculum"><h5 style="margin: 10px;">교육 과정</h5></a> <a
						href="#prepared"><h5 style="margin: 10px;">준비물</h5></a> <a
						href="#caution"><h5 style="margin: 10px;">유의사항</h5></a> <a
						href="#tutorReview"><h5 style="margin: 10px;">첨부파일</h5></a> <a
						href="#filename"><h5 style="margin: 10px;">강사후기</h5></a>
				</div>
				<div class="section-top-border">
					<h4 class="mb-30" id="introduce">강의 소개</h4>
					<div class="row">
						<div class="col-md-8">
							<p>${lectDetail.lecture_introduce}</p>
							<h4 class="mb-30 mt-30" id="curriculum">교육 과정</h4>
							<ul class="unordered-list">${lectDetail.lecture_curriculum}
							</ul>
							<h4 class="mb-30 mt-30" id="prepared">준비물</h4>
							<p>${lectDetail.lecture_prepared}</p>
							<h4 class="mb-30 mt-30" id="caution">유의사항</h4>
							<p>${lectDetail.lecture_caution}</p>
							<h4 class="mb-30 mt-30" id="filename">첨부파일</h4>
							<p>${lectDetail.lecture_fileName}</p>
							<h4 class="mb-30 mt-30" id="tutorReview">강사후기</h4>
							<!-- 후기영역 -->
							<div class="mb-30 mt-30" id="reviewArea"></div>
						</div>
						<div class="col-md-4"
							style="border-radius: 8px; border: 1px solid #eee; padding: 20px">
							<img src="/shallwe/tutorImages/${lecture.tutor.tutor_img}" alt=""
								class="img-fluid">
							<div class="d-flex mt-10">
								<h6 class="mr-10">강사:</h6>
								<h6>
									<a href="#">${lecture.tutor.tutor_nickname}</a>
								</h6>
							</div>
							<div class="d-flex mt-10">
								<h6 class="mr-10">강사평점:</h6>
								<h6>
									<a href="#">${lecture.tutor.tutor_score}</a>
								</h6>
							</div>
							<h4 class="mt-30">
								<fmt:formatNumber value="${lecture.lecture_price}"
									pattern="#,###" />
								원
							</h4>
							<a href="#" id="applyBtn" class="genric-btn primary-border mt-10">신청</a>
							<a href="#" class="genric-btn primary-border mt-10">찜하기</a>
							<div class="d-flex mt-10">
								<h6 class="mr-10">수강일시:</h6>
								<h6 class="date mr-10">${startDt}-${endDt}</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>
	<!-- JS here -->

	<script src="/shallwe/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="/shallwe/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/shallwe/assets/js/popper.min.js"></script>
	<script src="/shallwe/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="/shallwe/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="/shallwe/assets/js/owl.carousel.min.js"></script>
	<script src="/shallwe/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="/shallwe/assets/js/wow.min.js"></script>
	<script src="/shallwe/assets/js/animated.headline.js"></script>
	<script src="/shallwe/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="/shallwe/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="/shallwe/assets/js/jquery.nice-select.min.js"></script>
	<script src="/shallwe/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script src="/shallwe/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="/shallwe/assets/js/jquery.counterup.min.js"></script>
	<script src="/shallwe/assets/js/waypoints.min.js"></script>
	<script src="/shallwe/assets/js/jquery.countdown.min.js"></script>
	<script src="/shallwe/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script src="/shallwe/assets/js/contact.js"></script>
	<script src="/shallwe/assets/js/jquery.form.js"></script>
	<script src="/shallwe/assets/js/jquery.validate.min.js"></script>
	<script src="/shallwe/assets/js/mail-script.js"></script>
	<script src="/shallwe/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="/shallwe/assets/js/plugins.js"></script>
	<script src="/shallwe/assets/js/main.js"></script>


</body>
</html>