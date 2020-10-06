<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
<style>
.menu-wrapper {
	float: left;
}

.mr-40 {
	margin-left: 20px
}

.mr-40 {
	text-align: center;
}

.header-btns a i {
	vertical-align: bottom;
}

.header-area .menu-wrapper .main-menu ul li a i {
	font-size: 50px
}

.header-area {
/* 	box-shadow: 0 2px 4px 0 hsla(0, 0%, 80.8%, .5); */
	min-height: unset;
	background-color: white;
}

.btn {
	background: #00dbd5;
}

.btn::before {
	background: #009994;
}

.category-img {
	margin-top: 3%;
}
div img{
cursor: pointer;
}
#searchBtn{
cursor: pointer;
}
div.menu-wrapper .d-flex .align-items-center .justify-content-between{
margin-right: 10%;
}
.hero-bg1{
text-align: center;
}
</style>
<script>

$(function(){
	$('#searchBtn').click(function(){
		var $searchText = $('#searchText').val()
		var $searchKey = $('#select').val()
        var url = '${contextPath}/lectures/search?searchKey='+$searchKey+'&searchText='+$searchText ;
        location.href = url;
	});
	$('#category a').click(function(){
		var $searchText = $(this).attr("id");
		var $searchKey = 3
        var url = '${contextPath}/lectures/search?searchKey='+$searchKey+'&searchText='+$searchText ;
        location.href = url;
	});
	
});

</script>
</head>
<body>
	<header>
		<!-- topbar Start -->
		<div class="topMenu">
			<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
		</div>
		<!-- topbar End -->
	</header>
	<main>
		<!--메인 슬라이드 시작-->
		<div class="slider-area hero-bg1 hero-overly main">
			<div
				class="single-slider slider-height1 d-flex align-items-center">
				<div class="hero-overly"></div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-10 col-lg-100">
							<!-- Hero Caption -->
							<div class="hero__caption pt-90">
								<h1>배우고, 나누고, 성장하세요</h1>
								<p>다양한 분야의 강사를 만나보세요!</p>
							</div>
							<!--Hero form -->
							<form action="#" class="search-box mb-100">
								<div class="select-form">
									<div class="select-itms">
										<select name="select" id="select">
											<option value="0" class="searchOpt">전체 검색</option>
											<option value="1" class="searchOpt">강사 닉네임 검색</option>
											<option value="2" class="searchOpt">강의명 검색</option>
											<option value="3" class="searchOpt">카테고리 검색</option>
										</select>
									</div>
								</div>
								<div class="input-form" >
									<input type="text" placeholder="검색어를 입력하세요" id="searchText">
								</div>
								<div class="search-form">
									<a id="searchBtn"><i class="ti-search"></i> 검색</a>
								</div>
							</form>

						</div>
					</div>
					<!-- hero category1 img -->
					<div class="category-img text-center" id="category">
					<h1 style="margin-top: 4%;">카테고리별로 검색해보세요!</h1>
						<a id="IT"> <img src="assets/img/gallery/category_icon1.png"></a>
						<a id="취미"> <img src="assets/img/gallery/category_icon2.png"></a> 
						<a id="마케팅"> <img src="assets/img/gallery/category_icon3.png"></a> 
						<a id="디자인"> <img src="assets/img/gallery/category_icon4.png"></a><br>
						<a id="사진"> <img src="assets/img/gallery/category_icon6.png"></a>
						<a id="회계"> <img src="assets/img/gallery/category_icon7.png"></a> 
						<a id="음악"> <img src="assets/img/gallery/category_icon8.png"></a>
						<a id="스포츠"> <img src="assets/img/gallery/category_icon9.png"></a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!--  메인 헤더쪽 사진, 검색 , 카테고리 포함 end -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>