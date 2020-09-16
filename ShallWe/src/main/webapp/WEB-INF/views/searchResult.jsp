<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Shallwe-함께 배우는 교육공간</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="assets/css/gijgo.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/animated-headline.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<style>
.blog_right_sidebar .search_widget .input-group button {
	background: #B367FF;
	border-left: 0;
	border: 1px solid #f0e9ff;
	padding: 4px 15px;
	border-left: 0;
	cursor: pointer;
}

.left_menu {
	float: left;
	width: 35%;
}

.left_menu_result {
	text-align: center;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var $searchTextObj = $("section.left_menu").find("input#searchText");
		var $searchBtnObj = $("button#searchBtn");
		$searchTextObj.focus();

		// searchTextObj 검색어 찾기
		$searchBtnObj.click(function(e) {
			var content = $searchTextObj.val();
			console.log(content);
		});
	});
</script>

</head>

<body>
	<!-- 상단top include 영역 -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>

	<main>
		<!--카테고리 내 검색-->
		<section class="left_menu section-padding">
			<div class="col-lg-10">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<form action="#">
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
			</div>
		</section>

		<!--카테고리 내 검색된 결과-->
		<section class="blog_area single-post-area section-padding">
			<div class="container">
				<!--? Popular Directory Start -->
				<div class="popular-directorya-area fix">
					<div class="row">
						<div class="col-lg-6">
							<!-- Single -->
							<div class="properties properties2 mb-30">
								<div class="properties__card">
									<div class="properties__img overlay1">
										<a href="#"><img src="assets/img/gallery/properties1.png"
											alt=""></a>
										<div class="img-text">
											<span>50,000</span> <span>강의예정</span>
										</div>
										<div class="icon">
											<img src="assets/img/gallery/categori_icon1.png" alt="">
										</div>
									</div>
									<div class="properties__caption">
										<h3>
											<a href="#">헬창들의 모임</a>
										</h3>
										<p>근손실 안나게 하는 방법, 기초 근력운동</p>
										<p>2020-08-30 14:00 ~ 2020-08-30 17:00</p>
										<p>강사 : 박경찬</p>
										<p>최소인원 : 3 / 최대인원: 15</p>
										<p>강의평점(만족도): 100%</p>
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<img src="assets/img/gallery/restaurant-icon.png" alt="">
											<h3>강의찜하기</h3>
										</div>
										<div class="heart">
											<img src="assets/img/gallery/heart1.png" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<!-- Single -->
							<div class="properties properties2 mb-30">
								<div class="properties__card">
									<div class="properties__img overlay1">
										<a href="#"><img src="assets/img/gallery/properties1.png"
											alt=""></a>
										<div class="img-text">
											<span>50,000</span> <span>강의예정</span>
										</div>
										<div class="icon">
											<img src="assets/img/gallery/categori_icon1.png" alt="">
										</div>
									</div>
									<div class="properties__caption">
										<h3>
											<a href="#">헬창들의 모임</a>
										</h3>
										<p>근손실 안나게 하는 방법, 기초 근력운동</p>
										<p>2020-08-30 14:00 ~ 2020-08-30 17:00</p>
										<p>강사 : 박경찬</p>
										<p>최소인원 : 3 / 최대인원: 15</p>
										<p>강의평점(만족도): 100%</p>
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<img src="assets/img/gallery/restaurant-icon.png" alt="">
											<h3>강의찜하기</h3>
										</div>
										<div class="heart">
											<img src="assets/img/gallery/heart1.png" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<!-- Single -->
							<div class="properties properties2 mb-30">
								<div class="properties__card">
									<div class="properties__img overlay1">
										<a href="#"><img src="assets/img/gallery/properties1.png"
											alt=""></a>
										<div class="img-text">
											<span>50,000</span> <span>강의예정</span>
										</div>
										<div class="icon">
											<img src="assets/img/gallery/categori_icon1.png" alt="">
										</div>
									</div>
									<div class="properties__caption">
										<h3>
											<a href="#">헬창들의 모임</a>
										</h3>
										<p>근손실 안나게 하는 방법, 기초 근력운동</p>
										<p>2020-08-30 14:00 ~ 2020-08-30 17:00</p>
										<p>강사 : 박경찬</p>
										<p>최소인원 : 3 / 최대인원: 15</p>
										<p>강의평점(만족도): 100%</p>
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<img src="assets/img/gallery/restaurant-icon.png" alt="">
											<h3>강의찜하기</h3>
										</div>
										<div class="heart">
											<img src="assets/img/gallery/heart1.png" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<!-- Single -->
							<div class="properties properties2 mb-30">
								<div class="properties__card">
									<div class="properties__img overlay1">
										<a href="#"><img src="assets/img/gallery/properties1.png"
											alt=""></a>
										<div class="img-text">
											<span>50,000</span> <span>강의예정</span>
										</div>
										<div class="icon">
											<img src="assets/img/gallery/categori_icon1.png" alt="">
										</div>
									</div>
									<div class="properties__caption">
										<h3>
											<a href="#">헬창들의 모임</a>
										</h3>
										<p>근손실 안나게 하는 방법, 기초 근력운동</p>
										<p>2020-08-30 14:00 ~ 2020-08-30 17:00</p>
										<p>강사 : 박경찬</p>
										<p>최소인원 : 3 / 최대인원: 15</p>
										<p>강의평점(만족도): 100%</p>
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<img src="assets/img/gallery/restaurant-icon.png" alt="">
											<h3>강의찜하기</h3>
										</div>
										<div class="heart">
											<img src="assets/img/gallery/heart1.png" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<!-- Single -->
							<div class="properties properties2 mb-30">
								<div class="properties__card">
									<div class="properties__img overlay1">
										<a href="#"><img src="assets/img/gallery/properties2.png"
											alt=""></a>
										<div class="img-text">
											<span>100,000</span> <span>강의예정</span>
										</div>
										<div class="icon">
											<img src="assets/img/gallery/categori_icon1.png" alt="">
										</div>
									</div>
									<div class="properties__caption">
										<h3>
											<a href="#">빡빡이 아저씨와 배우는 인성 기초</a>
										</h3>
										<p>인성에 대하여 배워보자</p>
										<p>2020-08-30 14:00 ~ 2020-08-30 17:00</p>
										<p>강사 : 박성운</p>
										<p>최소인원 : 10 / 최대인원: 50</p>
										<p>강의평점(만족도): 100%</p>
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<img src="assets/img/gallery/restaurant-icon.png" alt="">
											<h3>강의찜하기</h3>
										</div>
										<div class="heart">
											<img src="assets/img/gallery/heart1.png" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<!-- Single -->
							<div class="properties properties2 mb-30">
								<div class="properties__card">
									<div class="properties__img overlay1">
										<a href="#"><img src="assets/img/gallery/properties2.png"
											alt=""></a>
										<div class="img-text">
											<span>100,000</span> <span>강의예정</span>
										</div>
										<div class="icon">
											<img src="assets/img/gallery/categori_icon1.png" alt="">
										</div>
									</div>
									<div class="properties__caption">
										<h3>
											<a href="#">빡빡이 아저씨와 배우는 인성 기초</a>
										</h3>
										<p>인성에 대하여 배워보자</p>
										<p>2020-08-30 14:00 ~ 2020-08-30 17:00</p>
										<p>강사 : 박성운</p>
										<p>최소인원 : 10 / 최대인원: 50</p>
										<p>강의평점(만족도): 100%</p>
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<img src="assets/img/gallery/restaurant-icon.png" alt="">
											<h3>강의찜하기</h3>
										</div>
										<div class="heart">
											<img src="assets/img/gallery/heart1.png" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>



				</div>
			</div>
			<!--end of container-->
		</section>
	</main>
</body>
</html>