<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

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
	
	.left_menu {
		float: left;
		width: 35%
	}
	
	.left_menu_result {
		text-align: center;
	}
	.right_menu { 
		float : right;
	}
	
	/* div 테이블 스타일 영역, 추후 css 분리 예정 */
	.divTable{
		display: table;
		width: 100%;
	}
	.divTableRow {
		display: table-row;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
	}
	.divTableCell, .divTableHead {
		border: 1px solid #999999;
		display: table-cell;
		padding: 3px 10px;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #EEE;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
	}

	</style>
	
	<!-- script area -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	  
	  
	</script>
	</head>
<title>강의신청</title>
<!-- 상단top include 영역 -->
</head>

<body>

<!-- 상단top include 영역 -->
<div class="topMenu">
</div>
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
<!-- <section class="right_menu section-padding"> -->
<section class="blog_area single-post-area section-padding">
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<!-- page title -->
			<div class="small-tittle mb-20">
				<h2>강의신청하기</h2>
			</div>
			<div class="directory-cap mb-40">
				<p>신청한 강의는 바로 결제하실 수 있습니다</p>
			</div>

			<!-- page contents -->
			<div class="small-tittle mb-20">
				<h2>강의신청내용</h2>
			</div>
			<div class="row">
				<div class="col">
					<img src="assets/img/gallery/gallery1.png" class="mb-15" alt="강의사진">
				</div>
				<div class="col">
					<span id="강의제목">빡빡이 아저씨와 배우는 인성 기초</span><br>
					<span>강사: 빡빡이아저씨</span>
				</div>
			</div>
			<!--강의 정보 -->
			<form name="#" action="post">
				<div class="divTable">
					<div class="divTableBody">
						<div class="divTableRow">
							<div class="divTableCell">강의제목</div>
							<div class="divTableCell">강의날짜</div>
							<div class="divTableCell">금액</div>
						</div>
						<div class="divTableRow">
							<div class="divTableCell"><span>빡빡이 아저씨와 배우는 인성기초</span></div>
							<div class="divTableCell"><span>2020-08-30 14:00 ~ 2020-08-30 17:00</span></div>
							<div class="divTableCell"><span>100,000원</span></div>
						</div>
					</div>
				</div>

				<!-- 결제방법선택 -->
				<div>
					<input type="radio" name="pay_method" value="신용카드" /><font>신용카드</font>
					<input type="radio" name="pay_method" value="계좌이체" /><font>계좌이체</font>
					<input type="radio" name="pay_method" value="무통장입금" /><font>무통장입금</font>
					<input type="radio" name="pay_method" value="휴대폰" /><font>휴대폰</font>
				</div>
				<div>
					<button id="paid_btn">결제하기</button>
				</div>
			</form>
		</div>
	</div>
</div><!--end of container-->
</section>
</main>

</body>
</html>