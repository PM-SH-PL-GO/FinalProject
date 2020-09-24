<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="lectureList" value="${requestScope['list']}"/>

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
	width: 30%;
}

.left_menu_result {
	text-align: center;
}
.right_menu { 
		float : center;
		width: 70%;
}
</style>
<!-- script area -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//right_menu - 검색결과값 출력부
		var $rightAreaObj = $("section.right_menu").find("div.container");
		
		//강의상세화면으로 이동
		var $lectureCard = $("section.right_menu > div.container> div.row").find("div.col");
		console.log($lectureCard);
		
		$lectureCard.click(function(e) {
			var lectureCode = $(this).find('input[name=lecture_code]').val();
			console.log(lectureCode);
		});
		
		var $formObj = $('form[name=resultList]');
		$formObj.submit(function e ( ) {
			return false;
		});
		
		//검색 입력 left_menu
		var $searchTextObj = $("section.left_menu").find("input#searchText");
		var $searchKeyObj = $("section.left_menu").find("select#searchKey");
		var condition ="";
		var $searchText ="";
		
		$searchTextObj.focus();
		
		$searchKeyObj.change(function(e) {
			condition = $(this).val();
		});

		var $searchBtnObj = $("form[name='resultList']").find('button#searchBtn');
		$searchBtnObj.click (function ( ) {
			$searchText = $searchTextObj.val();
			
			// 검색조건에 따른 검색 요청
			$.ajax ({
				url : "/shallwe/search"
				, method : "post"
				, data : { "searchKey" : condition , "searchText" : $searchText }
				, success : function (responseData) {
					$rightAreaObj.empty();
					$rightAreaObj.append(responseData);
				}
			}); //end of ajax
		}); // end of clickEvent
	});
	
</script>
</head>
<body>
    <!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
    <!-- topbar End -->
	<main>
		<!--? Hero Start -->
		<div class="slider-area2">
			<div
				class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap2 pt-20 text-center">
								<h2>강의 카테고리 검색 결과</h2>
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
						<form name= "resultList" class="form-select  mb-100">
							<div>
								<!-- searchKey = {"all", "tutor_name", "lecture_title" , "category" }; -->
								<select class="nice-select" id="searchKey">
									<option value="0" class="option">검색조건</option>
									<option value="0" class="option">전체 검색</option>
									<option value="1" class="option">강사 이름</option>
									<option value="2" class="option">강의명</option>
									<option value="3" class="option">카테고리명</option>
								</select>
							</div>
							<div class="form-group">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="카테고리 내 재검색" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Search Keyword'" id="searchText">
								</div>
							</div>
							<button id="searchBtn" type="submit">Search</button>
						</form>
					</aside>
				</div>

				<div class="left_menu_result">
				
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

		<!--검색결과 : searchLectureList.jsp   -->
		<section class="right_menu section-padding">
			<div class="container">
			
				<div class="row">
				<c:if test="${lectureList.size() ==  0}" >
					<div class="col">
						<p>조회된 강의가 없습니다! 다시 검색해주세요~</p>
					</div>
				</c:if>
				<!-- single start -->
				<c:forEach items="${lectureList}" var="lecture" varStatus="stats">
					<c:forEach items="resultList.Lecture" var="lec" varStatus="lec_count">
					<div class="col">
						<div class="properties pb-20">
							<div class="properties__card">
								<a href="#"><img src="/shallwe/assets/img/gallery/properties3.png" alt=""></a><br/><br/>
								<div class="properties__caption">
									<p>${stats.count}</p>
									<h3>
										<label>강의명: </label><a href="#">${lecture.lecture_title}</a>
									</h3>
									<h4><label>수강기간: </label>
										<fmt:formatDate value="${lecture.lecture_start_dt}" pattern="yyyy-MM-dd"/> ~
										<fmt:formatDate value="${lecture.lecture_end_dt}" pattern="yyyy-MM-dd"/> 
									</h4>
									<h4><label>강사명: </label>${lecture.tutor.tutor_nickname}</h4>
									<h4><label>현재인원: </label> ${lecture.lecture_current} <label>/최대인원: </label> ${lecture.lecture_max}</h4>
									<input type="hidden" name="lecture_code" value="${lecture.lecture_id}"/>
								</div>
								<div
									class="properties__footer d-flex justify-content-between align-items-center">
									<div class="restaurant-name">
										<h3><fmt:formatNumber value="${lecture.lecture_price}" pattern="#,###원"/></h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- single end -->		
					</c:forEach>
				</c:forEach>
			</div>
			</div>
		</section>
	</main>
</body>
</html>