<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shallwe-함께 배우는 교육공간</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/hamburgers.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<style>
.left_menu {
	float: left;
	width: 30%
}

.left_menu_result {
	text-align: center;
}
.right_menu { 
		float : right;
}
</style>
<!-- script area -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var $searchTextObj = $("section.left_menu").find("input#searchText");
		var $searchBtnObj = $("button#searchBtn");
		var $condition ="";
		var $searchContent ="";

		$searchTextObj.focus();
		$searchCondition.change(function(e) {
			condition = $(this).val();
		});
		
		console.log(condition);
		
		// 검색하기 earchTextObj 검색어 찾기
		$searchBtnObj.click(function(e) {
			$searchContent = $searchTextObj.val();
			
			// 검색조건에 따른 검색 요청
			$.ajax ({
				url : ""
				, method : "POST"
				, data : { "searchCondition" : $condition , "searchContent" : $searchContent }
				, success : function () {
					alert("검색 요청 성공!");
				}
			}); //end of ajax
			
		});
		

		
		
		
		//강의상세화면으로 이동
		var $lectureCard = $("section.right_menu > div.container> div.row").find("div.col");
		console.log($lectureCard);
		
		$lectureCard.click(function(e) {
			console.log(e);
			
			var lectureCode = $(this).find('input[name=lecture_code]').val();
			console.log(lectureCode);
		});
		
		
	});
</script>
</head>
<body>
	<header>
		<!-- Header Start -->
		<div class="header-area header-transparent">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div
						class="menu-wrapper d-flex align-items-center justify-content-between">
						<!-- Logo -->
						<div class="logo">
							<a href="index.html"><img src="assets/img/logo/logo.png"
								alt=""></a>
						</div>
						<!-- Main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="index.html">Home</a></li>
									<li><a href="listing.html">Catagories</a></li>
									<li><a href="#">Pages</a>
										<ul class="submenu">
											<li><a href="directory_details.html">listing Details</a></li>
											<li><a href="listing.html">Catagories</a></li>
										</ul></li>
									<li><a href="blog.html">Blog</a>
										<ul class="submenu">
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog_details.html">Blog Details</a></li>
											<li><a href="elements.html">Elements</a></li>
										</ul></li>
									<li><a href="contact.html">Contact</a></li>
								</ul>
							</nav>
						</div>
						<!-- Header-btn -->
						<div class="header-btns d-none d-lg-block f-right">
							<a href="#" class="mr-40"><i class="ti-user"></i> Log in</a> <a
								href="#" class="btn">Add Listing</a>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>
	<main>
		<!--? Hero Start -->
		<div class="slider-area2">
			<div
				class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap2 pt-20 text-center">
								<h2>Element</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--카테고리 내 검색-->
		<section class="left_menu section-padding">
			<div class="col-lg-10">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<form action="#" class="form-select  mb-100">
							<div>
								<select class="nice-select" id="searchCondition">
									<option value="0" class="option">검색조건</option>
									<option value="all" class="option">전체 검색</option>
									<option value="region" class="option">지역 검색</option>
									<option value="tutor_name" class="option">강사 이름</option>
									<option value="lecture_title" class="option">강의명</option>
								</select>
							</div>
							<div class="form-group">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="카테고리 내 재검색" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Search Keyword'" id="searchText">
								</div>
							</div>
							<button id="searchBtn"
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								type="submit">Search</button>
						</form>
					</aside>
				</div>

				<div class="left_menu_result">
					<p>"모임" 에 대한 결과 10건이 조회되었습니다.</p>
				</div>

				<div class="category-img text-center">
					<a href="#"> <img src="assets/img/gallery/category_icon1.png"
						alt=""></a> <a href="#"> <img
						src="assets/img/gallery/category_icon2.png" alt=""></a> <a
						href="#"> <img src="assets/img/gallery/category_icon3.png"
						alt=""></a>
				</div>
				<div class="category-img text-center">
					<a href="#"> <img src="assets/img/gallery/category_icon4.png"
						alt=""></a> <a href="#"> <img
						src="assets/img/gallery/category_icon6.png" alt=""></a> <a
						href="#"> <img src="assets/img/gallery/category_icon7.png"
						alt=""></a>
				</div>
				<div class="category-img text-center">
					<a href="#"> <img src="assets/img/gallery/category_icon8.png"
						alt=""></a> <a href="#"> <img
						src="assets/img/gallery/category_icon9.png" alt=""></a>
				</div>
			</div>
		</section>

		<!--  -->
		<section class="right_menu section-padding">
			<div class="container">
				<div class="row">
					<!-- single start -->
					<div class="col">
						<div class="properties pb-20">
							<div class="properties__card">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties3.png" alt=""></a><br/><br/>
								<div class="properties__caption">
									<h3>
										<a href="#">강의 제목</a>
									</h3>
									<h6>2020-08-30 ~ 2020-08-30</h6>
									<h6>강사 이름</h6>
									<h6>현재인원: 3 / 최대인원: 15</h6>
									<input type="hidden" name="lecture_code" value="1"/>
								</div>
								<div
									class="properties__footer d-flex justify-content-between align-items-center">
									<div class="restaurant-name">
										<h3>10,000원</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- single end -->
					<!-- single start -->
					<div class="col">
						<div class="properties pb-20">
							<div class="properties__card">
								<a href="#"><img
									src="/shallwe/assets/img/gallery/properties3.png" alt=""></a>
								<br /> <br />
								<div class="properties__caption">
									<h3>
										<a href="#">강의 제목</a>
									</h3>
									<h6>2020-08-30 ~ 2020-08-30</h6>
									<h6>강사 이름</h6>
									<h6>현재인원: 3 / 최대인원: 15</h6>
									<input type="hidden" name="lecture_code" value="2"/>
								</div>
								<div
									class="properties__footer d-flex justify-content-between align-items-center">
									<div class="restaurant-name">
										<h3>10,000원</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- single end -->
					<!-- single start -->
					<div class="col">
						<div class="properties pb-20">
							<div class="properties__card">
								<a href="#"><img
									src="/shallwe/assets/img/gallery/properties3.png" alt=""></a>
								<br /> <br />
								<div class="properties__caption">
									<h3>
										<a href="#">강의 제목</a>
									</h3>
									<h6>2020-08-30 ~ 2020-08-30</h6>
									<h6>강사 이름</h6>
									<h6>현재인원: 3 / 최대인원: 15</h6>
									<input type="hidden" name="lecture_code" value="3"/>
								</div>
								<div
									class="properties__footer d-flex justify-content-between align-items-center">
									<div class="restaurant-name">
										<h3>10,000원</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- single end -->
				</div>
				<!-- section right end -->
			</div>
		</section>
	</main>
</body>
</html>