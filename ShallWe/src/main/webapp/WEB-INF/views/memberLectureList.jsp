<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>학생강의목록</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/shallwe/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="/shallwe/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/slicknav.css">
<link rel="stylesheet" href="/shallwe/assets/css/animate.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/hamburgers.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/magnific-popup.css">
<link rel="stylesheet" href="/shallwe/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
<link rel="stylesheet" href="/shallwe/assets/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<c:forEach items="${mlthlist}" var="m" varStatus="status1"/>
<script>
alert(${m.lecture.lecture_id});
console.log(${mlthlist});

</script>
<body>
	<main>
		<!--? 강의목록 Start -->
		<div class="popular-directorya-area section-padding40 fix">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-80">
							<h2>강의 목록</h2>
						</div>
					</div>
				</div>
				<div class="directory-active">
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties1.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>12,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/cancel.png" width="30px"
										alt="강의취소요청" title="강의취소요청">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties1.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>12,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/cancel.png" width="30px"
										alt="강의취소요청" title="강의취소요청">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties2.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>12,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/cancel.png" width="30px"
										alt="강의취소요청" title="강의취소요청">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties3.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>12,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/cancel.png" width="30px"
										alt="강의취소요청" title="강의취소요청">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties1.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>12,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/cancel.png" width="30px"
										alt="강의취소요청" title="강의취소요청">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
				</div>
			</div>
		</div>
		<!--? 강의목록 End -->

		<!--? 완료 Start -->
		<div
			class="popular-directorya-area border-bottom section-padding40 fix">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-80">
							<h2>완료 목록</h2>
						</div>
					</div>
				</div>
				<div class="directory-active">
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties1.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>10,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/performance.png" width="30px"
										alt="강사후기보기" title="강사후기보기">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties2.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>10,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/performance.png" width="30px"
										alt="강사후기보기" title="강사후기보기">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties3.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>10,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/performance.png" width="30px"
										alt="강사후기보기" title="강사후기보기">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
					<div class="properties pb-20">
						<div class="properties__cardseo">
							<div class="properties__imgseo overlay1">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties1.png"
									alt=""></a>
							</div>
							<div class="properties__caption">
								<h3>
									<a href="#">강의 제목</a>
								</h3>
								<h6>2020-08-30 ~ 2020-08-30</h6>
								<h6>강사 이름</h6>
								<h6>현재인원: 3 / 최대인원: 15</h6>
							</div>
							<div
								class="properties__footer d-flex justify-content-between align-items-center">
								<h3>10,000원</h3>
								<div class="heart">
									<img src="/shallwe/assets/img/gallery/performance.png" width="30px"
										alt="강사후기보기" title="강사후기보기">
								</div>
							</div>
						</div>
					</div>
					<!-- Single -->
				</div>
			</div>
		</div>
		<!--? 완료 End -->
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