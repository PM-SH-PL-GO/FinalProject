<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>강의 등록</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/shallwe/assets/img/favicon.ico">

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
<link rel="stylesheet"
	href="/shallwe/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
<link rel="stylesheet" href="/shallwe/assets/css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
	$(function() {
		$("#lectureImgFile").on('change', function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preImage').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$('#insertBtn').on(
				"click",
				function() {
					let form = $("#formLectureRegistration")[0];
					let formData = new FormData(form);
					formData.append("lecture_img",
							$("#lectureImgFile")[0].files[0]);
					formData.append("lecture_filename",
							$("#lectureCFile")[0].files[0]);
					let lectureTitleValue = $("#lectureTitle").val();
					let lectureIntroValue = $("#lectureIntro").val();
					if (lectureTitleValue == "") {
						alert("제목을 입력하세요.");
						$("lectureTitleValue").focus();
					} else if (lectureIntroValue == "") {
						alert("강의 소개를 입력하세요.");
						$("lectureIntroValue").focus();
					} else {
						if (confirm("등록된 강의는 수정할 수 없습니다! 등록하시겠습니까?") == true) {
							$.ajax({
								url : "${contextPath}/lectures/insert",
								method : "POST",
								contentType : false,
								processData : false,
								data : formData,
								success : function(data) {
									let responseObj = JSON.parse(data);
									if (responseObj.status == "success") {
										alert("강의 등록이 정상적으로 되었습니다.");
									} else {
										alert("강의 등록에 실패했습니다.");
										$("lectureTitleValue").focus();
									}
								}
							});
							return false;
						} else {
							return;
						}
					}
				});
	});
</script>

<body>
	<!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
	<!-- topbar End -->
	<main>
		<!--? Start Align Area -->
		<div class="whole-wrap mt-100">
			<div class="container box_1170">
				<div class="section-top-border">
					<h3 class="mb-30">강의 등록</h3>
					<div class="row">
						<div class="col-md-12 mt-sm-20">
							<form id="formLectureRegistration"
								${pageContext.request.contextPath}/updatetNoticePro.do"
								method="post"
								enctype="multipart/form-data" name="noticeForm">
								<img id="preImage"
									src="${pageContext.request.contextPath}/files/lecture/${noticeVO.lectureImgFile}"
									width="300px" alt="" class="img-fluid d-block"> <input
									type="file" id="lectureImgFile" name="lecture_img"
									class="mt-10" accept="imags/*">
								<h6 class="mt-10">강의 제목${contextPath}</h6>
								<div class="mt-10">
									<input type="text" value="제목ㅎ" name="lecture.lecture_title"
										placeholder="몇글자 이내" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required
										class="single-input" id="lectureTitle">
								</div>
								<h6 class="mt-10">카테고리</h6>
								<div class="form-select col-md-4 mt-10">
									<select id="lectCate"
										name="lecture.lectureCategory.lecture_category_id">
										<c:forEach items="${tutorlist}" var="tl" varStatus="i">
											<option value="${tl.lectureCategory.lecture_category_id}">${tl.lectureCategory.lecture_category_name}</option>
										</c:forEach>
										<input type="hidden" name="lecture.tutor.member.member_id"
										value="${tutorlist[0].member.member_id}" />
									</select>
								</div>
								<h6 class="mt-10">강의 소개</h6>
								<div class="mt-10">
									<textarea class="single-textarea" id="lectureIntro"
										name="lecture_introduce" style="height: 300px;"
										placeholder="몇글자 이내" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required>
										강의 소개
										</textarea>
								</div>
								<h6 class="mt-10">교육 과정</h6>
								<div class="mt-10">
									<textarea class="single-textarea" id="curiculum"
										name="lecture_curriculum" style="height: 300px;"
										placeholder="몇글자 이내" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required>
										교육과정
										</textarea>
								</div>
								<h6 class="mt-10">강의 장소</h6>
								<div class="input-group-icon d-flex mt-10">
									<div class="icon">
										<i class="fa fa-globe" aria-hidden="true"></i>
									</div>
									<input type="text" name="lecture_location" value="장소소"
										placeholder="장소" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '장소'" required class="single-input">
								</div>
								<h6 class="mt-10">강의 날짜</h6>
								<div class="d-flex mt-10">
									<div class="d-block">
										<h6 class="mt-10 col-md-5">시작일</h6>
										<input type="date" name="lecture.lecture_start_dt"
											value="2020-09-22" class="single-input" id="firstDate">
									</div>
									<div class="col-md-1"></div>
									<div class="d-block">
										<h6 class="mt-10 col-md-5">종료일</h6>
										<input type="date" name="lecture.lecture_end_dt"
											value="2020-10-10" class="single-input" id="lastDate">
									</div>
								</div>
								<h6 class="mt-10">인원</h6>
								<div class="d-flex mt-10">
									<input type="text" name="lecture.lecture_min" value="1"
										id="pMin" placeholder="최소" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '최소'" required
										class="single-input col-md-1 mr-10"> <input
										type="text" name="lecture.lecture_max" value="3" id="pMax"
										placeholder="최대" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '최대'" required
										class="single-input col-md-1">
								</div>
								<h6 class="mt-10">준비물</h6>
								<div class="mt-10">
									<input type="text" name="lecture_prepared" value="준비물"
										placeholder="몇글자 이내" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required
										class="single-input-primary" id="prepared">
								</div>
								<h6 class="mt-10">유의사항</h6>
								<div class="mt-10">
									<input type="text" name="lecture_caution" value="유의"
										placeholder="몇글자 이내" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required
										class="single-input-accent" id="caution">
								</div>
								<h6 class="mt-10">금액</h6>
								<div class="mt-10 d-flex">
									<input type="text" name="lecture.lecture_price" value="10"
										placeholder="10000" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '10000'" required
										class="single-input-accent col-md-2" id="price">
									<h5 class="mt-10">원</h5>
								</div>
								<h6 class="mt-10">첨부파일등록</h6>
								<input type="file" id="lectureCFile" name="lecture_filename"
									class="mt-10" accept="imags/*">
								<div class="mt-70">
									<input type="button" class="genric-btn primary-border"
										id="insertBtn" value="등록"> <input type="button"
										class="genric-btn primary-border" id="updateBtn" value="수정">
								</div>
								<input type="hidden" name="lecture.lecture_state" value="승인대기" />
							</form>
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