
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%-- <c:set var="lectureList" value="${requestScope['lectureList']}"/> --%>

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
.right_menu { 
	width: 100%;
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
	display: table-row;
	background-color: #EEE;
/* 	display: table-header-group; */
	font-weight: bold;
	text-align: center;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group;
}

.paidMethod> input#pay_method  {
	text-align: center;
	padding: 10px;
}

.buttonArea {
	text-align: center;
}
</style>
	
<!-- script area -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

// timestamp to yyyy-mm-dd 변환
function yyyymmbb (timeStamp ) {
	var date = new Date (timeStamp);
	var year = date.getFullYear();
	var month = (1+ date.getMonth());
	if ( month < 10 ) {
		month = '0'+month;
	}
	var day = date.getDate();
	if ( day < 10 ) {
		day = '0'+day;
	}
	return year +'-'+month+'-'+day;
}

// 세자리 수마다 ' ,' 찍어주는 함수
function money (data) {
	var price = Number(data).toLocaleString();
	return price;
}


$(document).ready(function() {
	var lectureListJsonValue = '${lectureListJsonValue}';
	var jsonObj = JSON.parse(lectureListJsonValue);
	
	var $divTableBodyObj = $("div.divTableBody");
	for(var i=0; i<jsonObj.length; i++){
		var lectureObj = jsonObj[i];
		var $div = $('<div class="divTableRow">');
		$divData = "";
		$divData += '<div class="divTableCell"><img src="${contextPath}/lecture/'+ lectureObj.lecture_img +'"'+ 'class="mb-15" alt="강의사진"></div>';
		$divData += '<div class="divTableCell"><span>'+ lectureObj.lecture_title+'</span></div>';
		$divData += '<div class="divTableCell"><span>'+ lectureObj.tutor.tutor_nickname+'</span></div>'
		$divData += '<div class="divTableCell"><span>'+ yyyymmbb(lectureObj.lecture_start_dt) +' ~ '+ yyyymmbb(lectureObj.lecture_end_dt) + '</span></div>';
		$divData += '<div class="divTableCell"><span>'+ money(lectureObj.lecture_price) + '</span></div>';
		$divData += '<input type="hidden" value="' + lectureObj.lecture_id +'"/>';
 		$divData += '<input type="hidden" value="' + lectureObj.lectureCategory.lecture_category_id +'"/>';
		$div.html($divData);
		$divTableBodyObj.append($div);
	}
	
	var $formObj = $('form[name=paidList');
	console.log("lectureListJsonValue : " + lectureListJsonValue);
	$formObj.submit(function e () {
		//ajax : 서버에서 넘어온 결제할 강의 목록 결제처리
		$.ajax({
			url : "/shallwe/insertMemberLectureHistory"
			,method : "POST"
	 		,contentType : "application/json;charset=utf-8"
			,data : lectureListJsonValue
			,success : function(responseData) {
				var jsonData = JSON.parse(responseData);
				if ( jsonData.status  == 'success') {
					alert("강의구매완료!");
					location.href("/index");
				} else if ( jsonData.status  == 'fail') {
					alert("강의구매실패 :본사에 문의하세요!");
				}
			} // ajax통신 success
		}); //end of ajax
	}); // end of form submit 이벤트

}); // end of load();
  
  
  
</script>
</head>
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
								<h2>강의 결제</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<section class="right_menu section-padding">
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<!-- page title -->
			<div class="small-tittle mb-20">
				<h2>강의결제페이지</h2>
			</div>
			<div class="directory-cap mb-40">
				<p>본 페이지에서 바로 결제 가능합니다!</p>
			</div>

			<!--강의 정보 -->
			<form name="paidList" method="post">
				<div class="divTable">
					<div class="divTableBody">
						<div class="divTableHeading">
							<div class="divTableCell">강의사진</div>
							<div class="divTableCell">강의제목</div>
							<div class="divTableCell">강사명</div>
							<div class="divTableCell">강의날짜</div>
							<div class="divTableCell">금액</div>
						</div>
						<!-- single start -->
<%-- 						<c:forEach items="${lectureList}" var="lecture" varStatus="stats"> --%>
<%-- 							<c:forEach items="resultList.Lecture" var="lec" varStatus="lec_count"> --%>
<!-- 								<div class="divTableBody"> -->
<!-- 									<div class="divTableRow"> -->
<!-- 										<div class="divTableCell"><img src="assets/img/gallery/gallery1.png" class="mb-15" alt="강의사진"></div> -->
<%-- 										<div class="divTableCell"><span>${lecture.lecture_title}</span></div> --%>
<%-- 										<div class="divTableCell"><span>${lecture.tutor.tutor_nickname}</span></div> --%>
<!-- 										<div class="divTableCell"><span> -->
<%-- 											<fmt:formatDate value="${lecture.lecture_start_dt}" pattern="yyyy-MM-dd"/> ~ --%>
<%-- 											<fmt:formatDate value="${lecture.lecture_end_dt}" pattern="yyyy-MM-dd"/>  --%>
<!-- 										</span></div> -->
<!-- 										<div class="divTableCell"><span> -->
<%-- 										<fmt:formatNumber value="${lecture.lecture_price}" pattern="#,###원"/> --%>
<!-- 										</span></div> -->
<!-- 										<div> -->
<%-- 											<input type="hidden" name="lecture_code" value="${lecture.lecture_id}"/> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<%-- 							</c:forEach> --%>
<%-- 						</c:forEach> --%>
					</div>
				</div><!-- end of table -->

				<!-- 결제방법선택 -->
				<div class="paidMethod">
					<label><input type="radio" name="pay_method" value="신용카드"/>신용카드</label>
					<label><input type="radio" name="pay_method" value="계좌이체" />계좌이체</label>
					<label><input type="radio" name="pay_method" value="무통장입금" />무통장입금</label>
					<label><input type="radio" name="pay_method" value="휴대폰" />휴대폰</label>
				</div>
				<div class="buttonArea">
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