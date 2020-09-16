<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shallwe-함께 배우는 교육공간</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
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
<style>
/** 목록 스타일 초기화 및 중앙 배치, 가로 폭 지정 */
ul {
	padding: 0;
	margin: 50px auto;
	list-style: none;
	width: 800px;
}

/** 제목 영역의 초기화 처리 */
.title {
	padding: 0;
	margin: 0;
/* 	border: 1px solid #000; */
}

/** 링크의 클릭 영역 확대 및 배경 및 폰트 처리 */
.title>a {
	display: block;
	padding: 2px;
	font-size: 14px;
	font-weight: bold;
	text-indent: 12px;
	text-decoration: none;
	color: white;
	height: 32px;
	line-height: 32px;
	background: #8f8f8f;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	/*그라디언트 지정*/
	background: linear-gradient(top, #cecece 0%, #8f8f8f 100%);
	background: -moz-linear-gradient(top, #cecece, #8f8f8f);
	background: -webkit-gradient(linear, left top, left bottom, from(#cecece),
		to(#8f8f8f));
}

/** 현재 활성화된 요소에 적용할 배경이미지 지정 */
.selected {
	background: #2288dd !important;
	color: #fff !important;
	/*그라디언트 지정*/
	background: linear-gradient(top, #6bb2ff 0%, #2288dd 100%) !important;
	background: -moz-linear-gradient(top, #6bb2ff, #2288dd) !important;
	background: -webkit-gradient(linear, left top, left bottom, from(#00dbd5),
		to(#009994)) !important;
}

/** 내용 영역 */
.content {
	margin: 0;
	background: #D4D0C8;
	padding: 10px;
	height: 200px;
	overflow-y: auto;
	border-radius: 5px;
	-webkit-border-radius: 5px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {

				/** 초기화 처리*/

				// 첫 번재 항목이 펼쳐져 있도록 처리
				$(".collapsible:eq(0) a").addClass("selected"); //첫번째 항목만 selected 클래스를 적용
				$(".collapsible").not(":eq(0)").find(".content").hide(); //첫번째 항목 이외의 content를 숨김

				/** 링크에 대한 클릭 이벤트 처리 */
				$(".collapsible .title a").click(
						function() {
							$(this).toggleClass("selected");
							//클릭된 나 자신을 제외한 나머리 링크들은 slected 클래스를 무조건 제거
							$(".collapsible .title a").not(this).removeClass(
									"selected");

							// 펼칠 내용 영역 선택
							var target = $(this).parents(".collapsible").find(
									".content");

							// 나머지 내용 영역을 선택
							var other = $(".collapsible .title a").not(this)
									.parents(".collapsible").find(".content");

							// 애니메이션으로 열고 닫기 처리
							target.slideToggle(300);
							other.slideUp(300);

							// 링크 페이지 이동 중지
							return false;
						});
			});
</script>
</head>
<body>
	<!-- ? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="/shallwe/assets/img/logo/loder.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
	<header> </header>
	<main>
		<ul>
			<li class="collapsible">
				<h2 class="title">
					<a href="#html5">[서비스 소개] shallwe는 어떻게 이용하나요?</a>
				</h2>
				<p class="content">
					shallwe는각 분야의 전문가가 제공하는 서비스와 상품을 거래할 수 있는 프리랜서 마켓입니다. shallwe의
					이용방법은 아래 안내를 참고해 주세요. <br>✱ 목차 <br>01. 원하는 서비스를 찾는 방법 <br>02. 적합한 서비스를
					선택하는 방법 <br>03. 전문가에게 문의하는 방법 <br>04. 성공적으로 거래 완료하는 방법
				</p>
			</li>
			<li class="collapsible">
				<h2 class="title">
					<a href="#css3">[이용방법] 전문가와 어떻게 커뮤니케이션해야 할까요?</a>
				</h2>
				<p class="content">shallwe에서 거래되는 무형 서비스의 특성상, 최종 작업물은 의뢰인-전문가의 소통에
					따라 결정됩니다. 이에 따라 거래의 전 과정에서 의뢰인의 요구 사항을 구체적이고 명확하게 전달하는 것이 중요합니다.

					커뮤니케이션 방법은 아래의 안내를 참고해 주세요.</p>
			</li>
			<li class="collapsible">
				<h2 class="title">
					<a href="#api">[가입/인증] 회원가입은 어떻게 진행하나요?</a>
				</h2>
				<p class="content">만 14세 이상의 개인이라면 누구나 무료로 회원가입하실 수 있습니다.</p>
			</li>
		</ul>
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