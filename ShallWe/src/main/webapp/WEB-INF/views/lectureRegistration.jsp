<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>DirectoryListing</title>
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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<script>
	$(function() {
		$('#insertBtn').on("click", function() {
			let lectureTitleValue = $("#lectureTitle").val();
			let lectureIntroValue = $("#lectureIntro").val();
			let curiculumValue = $("#curiculum").val();
			var select_city_value = function (select_city_obj){
				var select_city = select_city_obj.selectedIndex;
				var selected_city_value = select_city_obj.options[select_city].value;
			};
			var select_town_value = function (select_town_obj){
				var select_town = select_town_obj.selectedIndex;
				var selected_town_value = select_town_obj.options[select_town].value;
			};
			let locationValue = $("#location").val() + &nbsp; + select_city_value + &nbsp; + select_town_value;
			let firstDateValue = $("#firstDate").val();
			let lastDateValue = $("#lastDate").val();
			let pMinValue = $("#pMin").val();
			let pMaxValue = $("#pMax").val();
			let preparedValue = $("#prepared").val();
			let cautionValue = $("#caution").val();
			let priceValue = $("price").val();
			if (lectureTitleValue == "") {
				alert("제목을 입력하세요.");
				$("lectureTitleValue").focus();
			} else if (lectureIntroValue == "") {
				alert("강의 소개를 입력하세요.");
				$("lectureIntroValue").focus();
			} else {
				$.ajax({
					url : "/shallwe/Lectures/insert",
					method : "POST",
					data : {
						'lecture.lecture_title' : lectureTitleValue
						'lecture_introduce' : lectureIntroValue
						'lecture_curriculum' : curiculumValue
						'lecture_location' : locationValue
						'lecture.lecture_start_dt' : firstDateValue
						'lecture.lecture_end_dt' : lastDateValue
						'lecture.lecture_min' : pMinValue
						'lecture.lecture_max' : pMaxValue
						'lecture_prepared' : preparedValue
						'lecture_caution' : cautionValue
						'lecture.lecture_price' : priceValue
					},
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
			}
		});
	});
</script>
<body>
	<main>
		<!--? Start Align Area -->
		<div class="whole-wrap">
			<div class="container box_1170">
				<div class="section-top-border">
					<h3 class="mb-30">강의 등록</h3>
					<div class="row">
						<div class="col-md-12 mt-sm-20">
							<form action="#">
								<img src="assets/img/elements/d.jpg" alt=""
									class="img-fluid d-block"> <input type="file"
									name="lectureImg" value="사진 등록"
									class="genric-btn primary-border mt-10">
								<h6 class="mt-10">강의 제목</h6>
								<div class="mt-10">
									<input type="text" name="first_name" placeholder="몇글자 이내"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required
										class="single-input" id="lectureTitle">
								</div>
								<h6 class="mt-10">카테고리</h6>
								<div class="form-select col-md-3 mt-10" id="default-select">
									<select>
										<option value="1">IT</option>
										<option value="1">요리</option>
									</select>
								</div>
								<h6 class="mt-10">강의 소개</h6>
								<div class="mt-10">
									<textarea class="single-textarea" id="lectureIntro"
										style="height: 300px;" placeholder="몇글자 이내"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required></textarea>
								</div>
								<h6 class="mt-10">교육 과정</h6>
								<div class="mt-10">
									<textarea class="single-textarea" id="curiculum"
										style="height: 300px;" placeholder="몇글자 이내"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required></textarea>
								</div>
								<h6 class="mt-10">강의 장소</h6>
								<div class="input-group-icon d-flex mt-10">
									<div class="icon">
										<i class="fa fa-globe" aria-hidden="true"></i>
									</div>
									<div class="form-select col-md-3" id="default-select"
										onchange="select_city_value">
										<select>
											<option value="1">서울</option>
											<option value="2">경기도</option>
										</select>
									</div>
									<div class="form-select col-md-3" id="default-select"
										onchange="select_town_value">
										<select>
											<option value="1">강남구</option>
											<option value="2">강동구</option>
											<option value="3">안양</option>
										</select>
									</div>
									<input type="text" name="first_name" placeholder="세부주소"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '세부주소'" required
										class="single-input col-md-6" id="location">
								</div>
								<h6 class="mt-10">강의 날짜</h6>
								<div class="d-flex mt-10">
									<div class="d-block">
										<h6 class="mt-10 col-md-5">시작일</h6>
										<input type="date" name="first_date" class="single-input"
											id="firstDate">
									</div>
									<div class="col-md-1"></div>
									<div class="d-block">
										<h6 class="mt-10 col-md-5">종료일</h6>
										<input type="date" name="last_date" class="single-input"
											id="lastDate">
									</div>
								</div>
								<h6 class="mt-10">인원</h6>
								<div class="d-flex mt-10">
									<input type="text" name="first_name" id="pMin" placeholder="최소"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '최소'" required
										class="single-input col-md-1 mr-10"> <input
										type="text" name="first_name" id="pMax" placeholder="최대"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '최대'" required
										class="single-input col-md-1">
								</div>
								<h6 class="mt-10">준비물</h6>
								<div class="mt-10">
									<input type="text" name="first_name" placeholder="몇글자 이내"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required
										class="single-input-primary" id="prepared">
								</div>
								<h6 class="mt-10">유의사항</h6>
								<div class="mt-10">
									<input type="text" name="first_name" placeholder="몇글자 이내"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '몇글자 이내'" required
										class="single-input-accent" id="caution">
								</div>
								<h6 class="mt-10">금액</h6>
								<div class="mt-10 d-flex">
									<input type="text" name="first_name" placeholder="10000"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '10000'" required
										class="single-input-accent col-md-2" id="price">
									<h5 class="mt-10">원</h5>
								</div>
								<a href="#" class="genric-btn primary-border mt-10">첨부파일등록</a>
								<div class="mt-70">
									<input type="submit" class="genric-btn primary-border" id="insertBtn" value="등록">
									<input type="submit" class="genric-btn primary-border" id="updateBtn" value="수정">
								</div>
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