<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set value="${lectDetail.lecture}" var="lecture" />
<fmt:formatDate var="startDt" value="${lecture.lecture_start_dt}"
	pattern="yyyy-MM-dd" />
<fmt:parseDate var="startDat" value="${startDt}" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${startDat.time/(1000*60*60*24)}"
	integerOnly="true" var="startDate" />

<fmt:formatDate var="endDt" value="${lecture.lecture_end_dt}"
	pattern="yyyy-MM-dd" />
<fmt:parseDate var="endDat" value="${endDt}" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${endDat.time/(1000*60*60*24)}"
	integerOnly="true" var="endDate" />
${m.cancel_dt}
<c:set var="eqlectidtrue" value="false" />
<c:forEach items="${mlthlist}" var="ml" varStatus="i">
	<c:set var="m" value="${mlthlist[i.index]}" />
	<c:if
		test="${m.lecture.lecture_id eq lecture.lecture_id && empty m.cancel_dt}"
		var="lleq" />
	<c:if test="${m.lecture.lecture_id ne lecture.lecture_id}" var="llne" />
</c:forEach>

<c:set var="tutoreq" value="true" />
<c:forEach items="${lectlist}" var="lectl" varStatus="i">
	<c:set var="lecl" value="${lectlist[i.index]}" />
	<c:forEach items="${tutorlist}" var="tl" varStatus="i">
		<c:set var="t" value="${tutorlist[i.index]}" />
		<c:if
			test="${lecl.lecture_id eq lecture.lecture_id && tutorlist[0].member.member_id eq lecl.tutor.member.member_id}">
			<c:set var="tutoreq" value="false" />
		</c:if>
	</c:forEach>
</c:forEach>
<c:set var="lecseq" value="true" />
<%-- <c:forEach items="${wishlist}" var="wil" varStatus="i"> --%>
<%-- 	<c:set var="wi" value="${wishlist[i.index]}"/> --%>
<%-- 	<c:forEach items="${wi}" var="lecs" varStatus="j"> --%>
<%-- 		<c:set var="le" value="${lecs[j.index]}"/> --%>
<%-- 		<c:if test="${lecs[j.index].lecture_id eq lecture.lecture_id}"> --%>
<%-- 			<c:set var="lecseq" value="false"/> --%>
<%-- 		</c:if> --%>
<%-- 	</c:forEach> --%>
<%-- </c:forEach> --%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>강의 상세 정보</title>
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
<script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" />
<fmt:parseNumber value="${now.time/(1000*60*60*24)}" integerOnly="true" var="nowDate" />
<%-- 화면 호출시 바로 조회 해와야할 데이터 처리 영역 --%>
<%-- 강사-카테고리별 후기 조회--%>
$(document).ready(function() {
	//---------  파일명 UUID 제거 START---------
	function subString(fileName){
		var fn = fileName.substring(str.indexOf(".")+1)
		return fn;
		
	}
		//---------  파일명 UUID 제거 END---------
	var $reviewAreaObj = $('#reviewArea');
	// 강사별, 카테고리별 리뷰 목록 조회
	$.ajax({
		url : "${contextPath}/member/reviewList"
		, data : {"tutor_id": "${lecture.tutor.member.member_id}",
				  "category_id":"${lecture.lectureCategory.lecture_category_id}"}
		, success : function (responseData) {
			console.log(responseData);
			$reviewAreaObj.append(responseData);
		}
	}); // end of ajax
	
	// 강의신청, 강의결제페이지 호출
	var $applyBtnObj = $('div[name=applyBtn]');
	$applyBtnObj.on("click", function() {
		$.ajax({
			url: "${contextPath}/member/insertMemberLectureHistory"
			, method: "POST"
			, data : {"lecture_id" : "${lecture.lecture_id}"}
			, success: function(responseData) {
				let responseObj = JSON.parse(responseData);
				if (responseObj.status == "success") {
					alert("강의 신청이 정상적으로 되었습니다.");
				} else {
					alert("강의 신청에 실패했습니다.");
					$("div[name=applyBtn]").focus();
				}
			} 
		}); 
	}); // end of 강의신청, 강의결제페이지 호출 

	// 강의결제취소, 강의결제취소 처리
	var $cancelBtnObj = $('div[name=cancelBtn]');
	$cancelBtnObj.on("click", function() {
		$.ajax({
			url: "${contextPath}/member/updateMemberLectureHistory"
			, method: "GET"
			, data : {"lecture_id" : "${lecture.lecture_id}"}
			, success: function(responseData) {
				if (responseData == "success") {
					alert("강의 결제 취소가 정상적으로 처리 되었습니다.");
				} else {
					alert("강의 결제 취소가 실패했습니다.");
					$("div[name=cancelBtn]").focus();
				}
			} 
		}); 
	}); // end of 강의신청, 강의결제페이지 호출 
	
	// 찜목록 추가 요청
	var $favoriteLectureBtnObj = $('#favoriteLectureBtn');
	$favoriteLectureBtnObj.on("click", function() {
		if(confirm("찜목록에 추가 하시겠습니까?")){
			$.ajax( { 
				url : '${contextPath}/member/wishlist/addWish'
				, method : "GET"
				, data : {"lecture_id" : "${lecture.lecture_id}"}
				, success : function () {
					if(confirm("찜목록으로 이동하시겠습니까")){
						location.href = "${contextPath}/member/wishlist";
					} else {
						location.reload();
					}
				}
			}); // end of ajax
		}
	}); // end of 찜목록 추가 요청
	
	let letidValue = $("input[name=listlecture_id]").val();
	$("div[name=gotoDe]").click(function(){
		location.href = "${contextPath}/lectures/detail?lecture_id=" +letidValue;		
	});

	let letidendValue = $("input[name=listendlecture_id]").val();
	$("div[name=gotoDeend]").click(function(){
		location.href = "${contextPath}/lectures/detail?lecture_id=" +letidendValue;		
	});
	$(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 */

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);

		}).scroll();

	});
	return false;
}); // end of scriptLoad
</script>
</head>
<body>
	<!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
	<!-- topbar End -->
	<main>
		<!--? Start Align Area -->
		<div class="whole-wrap mt-100">
			<div class="container box_1170">
				<div class="section-top-border">
					<div class="row">
						<div class="col-md-3"
							style="padding: 20px; background-color: rgba(0, 153, 148, 0.7); border-radius: 20px 40px 60px 80px; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">
							<img src="/shallwe/lecture/${lecture.lecture_img}" alt=""
								class="img-fluid" style="border-radius: 20px 40px 60px 80px;">
						</div>
						<div class="col-md-8 mt-sm-20"
							style="margin-left: 6px; padding: 20px; background-color: rgba(0, 153, 148, 0.7); border-radius: 60px 60px 60px 60px; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">
							<h2 class="mb-20"
								style="margin-left: 50px; margin-top: 10px; font-weight: bold; color: white;">${lecture.lecture_title}</h2>
							<div class="d-flex">
								<h3 class="mr-10 mb-9"
									style="margin-left: 50px; line-height: 98%; color: white;">
									상태: ${lecture.lecture_state}<br> <br>장소:
									${lectDetail.lecture_location}<br> <br>인원:
									${lecture.lecture_current}/${lecture.lecture_max}<br> <br>카테고리:
									${lecture.lectureCategory.lecture_category_id}
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex">
					<a href="#introduce"><h3
							style="padding: 10px; font-weight: bold;">강의 소개</h3></a>
					<h3 style="padding-top: 10px">|</h3>
					<a href="#curriculum"><h3
							style="padding: 10px; font-weight: bold;">교육 과정</h3></a>
					<h3 style="padding-top: 10px">|</h3>
					<a href="#prepared"><h3
							style="padding: 10px; font-weight: bold;">준비물</h3></a>
					<h3 style="padding-top: 10px">|</h3>
					<a href="#caution"><h3
							style="padding: 10px; font-weight: bold;">유의사항</h3></a>
					<h3 style="padding-top: 10px">|</h3>
					<a href="#tutorReview"><h3
							style="padding: 10px; font-weight: bold;">첨부파일</h3></a>
					<h3 style="padding-top: 10px">|</h3>
					<a href="#filename"><h3
							style="padding: 10px; font-weight: bold;">강사후기</h3></a>
				</div>
				<div class="section-top-border"
					style="border-top: 1px solid #d9d9d9;">
					<div class="row">
						<div class="col-md-8">
							<h3 class="mb-30 mt-30" " id="introduce"
								style="padding: 10px; background-color: #00dbd5; font-weight: bold; color: white; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">강의
								소개</h3>
							<p>${lectDetail.lecture_introduce}</p>
							<h3 class="mb-30 mt-30" id="curriculum"
								style="padding: 10px; background-color: #00dbd5; font-weight: bold; color: white; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">교육
								과정</h3>
							<ul class="unordered-list">${lectDetail.lecture_curriculum}
							</ul>
							<h3 class="mb-30 mt-30" id="prepared"
								style="padding: 10px; background-color: #00dbd5; font-weight: bold; color: white; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">준비물</h3>
							<p>${lectDetail.lecture_prepared}</p>
							<h3 class="mb-30 mt-30" id="caution"
								style="padding: 10px; background-color: #00dbd5; font-weight: bold; color: white; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">유의사항</h3>
							<p>${lectDetail.lecture_caution}</p>
						</div>
						<div class="col-md-3" style="margin-left: 24px;">
							<div id="floatMenu"
								style="position: absolute; top: -52%; border-radius: 20px; border: 1px solid #dedede; padding: 20px; background-color: white; z-index: 100; box-shadow: 0px 6px 6px 2px rgba(2, 25, 65, 0.08);">
								<img src="/shallwe/tutorImages/${lecture.tutor.tutor_img}"
									alt="" class="img-fluid" style="border-radius: 20px;">
								<div class="d-flex mt-10">
									<h4 class="mr-10">강사: ${lecture.tutor.tutor_nickname}</h4>
								</div>
								<div class="d-flex mt-10">
									<h4 class="mr-10">강사평점: ${lecture.tutor.tutor_score}</h4>
								</div>
								<div class="d-flex mt-10">
									<h4 class="mr-10">
										수강일시: ${startDt}<br>&nbsp;~&nbsp;${endDt}
									</h4>
								</div>
								<h4 class="mt-20">
									강의가격:&nbsp;
									<fmt:formatNumber value="${lecture.lecture_price}"
										pattern="#,###" />
									원
								</h4>
								<c:if test="${endDate-nowDate>=0 && startDate-nowDate>=0}">
									<c:if test="${empty m.lecture.lecture_id && tutoreq}">
										<div name="applyBtn" class="mt-10"
											style="text-align: center; cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">강의신청</div>
									</c:if>
									<c:if test="${llne && tutoreq}">
										<div name="applyBtn" class="mt-10"
											style="text-align: center; cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">강의신청</div>
									</c:if>
									<c:if test="${lleq}">
										<div name="cancelBtn" class="mt-10"
											style="text-align: center; cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">결제취소</div>
									</c:if>
									<c:if test="${tutoreq}">
										<div id="favoriteLectureBtn" class="mt-10"
											style="text-align: center; cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">찜하기</div>
									</c:if>
								</c:if>
							</div>
						</div>
						<div class="col-md-12">
							<h3 class="mb-30 mt-30" id="filename"
								style="padding: 10px; font-weight: bold;">첨부파일</h3>
							<c:set var="fileName"
								value="${fn:split(studyBoard.studyBoard_fileName, '_')}" />
							<a style="-webkit-text-fill-color: #00dbd5 !important;"
								href="${contextPath}/lectures/download?fileName=${lectDetail.lecture_fileName}">${fn:substringAfter(lectDetail.lecture_fileName,'_')}</a>
							<!-- 후기영역 -->
							<div class="mb-30 mt-30" id="reviewArea"></div>
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
	<script src="/shallwe/assets/js/jquery.form.js"></script>
	<script src="/shallwe/assets/js/jquery.validate.min.js"></script>
	<script src="/shallwe/assets/js/mail-script.js"></script>
	<script src="/shallwe/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="/shallwe/assets/js/plugins.js"></script>
	<script src="/shallwe/assets/js/main.js"></script>


</body>
</html>
<jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include>