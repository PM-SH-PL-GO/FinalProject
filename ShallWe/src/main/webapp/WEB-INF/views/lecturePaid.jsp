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
	<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
</div>
<main>
<!-- leftbar -->
<div class="leftSideBar">
	<jsp:include page="/WEB-INF/views/leftSideBar.jsp"/>
</div>
<!--카테고리 내 검색된 결과-->
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