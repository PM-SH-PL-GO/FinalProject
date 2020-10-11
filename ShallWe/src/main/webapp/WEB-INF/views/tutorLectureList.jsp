<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>학생수강목록</title>
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
<link rel="stylesheet" href="/shallwe/assets/css/hamburgers.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="/shallwe/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
<link rel="stylesheet" href="/shallwe/assets/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" />
<fmt:parseNumber value="${now.time/(1000*60*60*24)}" integerOnly="true" var="nowDate" />
$(function(){
	let $cont = $(".listcontents");
	let $conte = $(".listendcontents");

	$cont.on("click", "div[name=gotoDe]", function(){
    	let letidValue = $(this).attr("value");
    	
    	location.href = "${contextPath}/lectures/detail?lecture_id=" +letidValue;
    	return false;
    });
	
	$conte.on("click", "div[name=gotoDeend]", function(){
    	let letidendValue = $(this).attr("value");
    	
    	location.href = "${contextPath}/lectures/detail?lecture_id=" +letidendValue;
    	return false;
    });
	$cont.on("click", "div[name=openCancelre]", 
		function showPopup() { 
		let letidimgValue = $(this).attr("value");
		windowObj = window.open("tutorcancelLecture?lecture_id="+letidimgValue, "강의 취소 요청", "width=550px, height=500px, left=100, top=50"); 

		return false;
		});
	
});
</script>
<body>
	<!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
	<!-- topbar End -->
	<main>
		<!--? 강의목록 Start -->
		<div
			class="listcontents popular-directorya-area section-padding40 fix">
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
					<c:forEach items="${lectlist}" var="ll" varStatus="i">
						<c:set var="lecture" value="${lectlist[i.index]}" />
						<c:set var="tutor" value="${lecture.tutor}" />
						<fmt:formatDate var="startDt" value="${lecture.lecture_start_dt}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate var="endDt" value="${lecture.lecture_end_dt}"
							pattern="yyyy-MM-dd" />
						<fmt:parseDate var="endDat" value="${endDt}" pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${endDat.time/(1000*60*60*24)}"
							integerOnly="true" var="endDate" />
						<c:if
							test="${endDate-nowDate>=0 && lecture.lecture_state eq '승인'}">
							<!-- Single -->
							<div class="properties pb-20">
								<div class="properties__cardseo">
									<div name="gotoDe" style="cursor: pointer;"
										value="${lecture.lecture_id}">
										<div class="properties__imgseo overlay1"
											style="position: relative; padding-top: 66.66%; overflow: hidden;">
											<img src="/shallwe/lecture/${lecture.lecture_img}" alt=""
												style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; max-width: 100%; height: auto;">
										</div>
										<div class="properties__caption">
											<h3>${lecture.lecture_title}</h3>
											<h5>${startDt}~${endDt}</h5>
											<h5>강사이름: ${tutor.tutor_nickname}</h5>
											<h5>현재인원: ${lecture.lecture_current} / 최대인원:
												${lecture.lecture_max}</h5>
										</div>
										<input type="hidden" name="listlecture_id"
											value="${lecture.lecture_id}" />
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<h1>
											<fmt:formatNumber value="${lecture.lecture_price}"
												pattern="#,###" />
											원
										</h1>
										<div class="heart">
											<div name="openCancelre" value="${lecture.lecture_id}"
												onclick="showPopup();"
												style="cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">강의취소</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Single -->
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<!--? 강의목록 End -->

		<!--? 완료 Start -->
		<div
			class="listendcontents popular-directorya-area border-bottom section-padding40 fix">
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
					<c:forEach var="i" begin="0" end="${fn:length(lectlist)}">
						<c:set var="lecture" value="${lectlist[i]}" />
						<c:set var="tutor" value="${lecture.tutor}" />
						<fmt:formatDate var="startDt" value="${lecture.lecture_start_dt}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate var="endDt" value="${lecture.lecture_end_dt}"
							pattern="yyyy-MM-dd" />
						<fmt:parseDate var="endDat" value="${endDt}" pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${endDat.time/(1000*60*60*24)}"
							integerOnly="true" var="endDate" />
						<c:if test="${endDate-nowDate<0 && lecture.lecture_state eq '승인'}">
							<!-- Single -->
							<div class="properties pb-20">
								<div class="properties__cardseo">
									<div name="gotoDeend" style="cursor: pointer;"
										value="${lecture.lecture_id}">
										<div class="properties__imgseo overlay1"
											style="position: relative; padding-top: 66.66%; overflow: hidden;">
											<img src="/shallwe/lecture/${lecture.lecture_img}" alt=""
												style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; max-width: 100%; height: auto;">
										</div>
										<div class="properties__caption">
											<h3>
												<a href="#">${lecture.lecture_title}</a>
											</h3>
											<h5>${startDt}~${endDt}</h5>
											<h5>강사이름: ${tutor.tutor_nickname}</h5>
											<h5>수강인원: ${lecture.lecture_current} / 최대인원:
												${lecture.lecture_max}</h5>
										</div>
										<input type="hidden" name="listendlecture_id"
											value="${lecture.lecture_id}" />
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<h1>
											<fmt:formatNumber value="${lecture.lecture_price}"
												pattern="#,###" />
											원
										</h1>
									</div>
								</div>
							</div>
							<!-- Single -->
						</c:if>
					</c:forEach>
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
	<script src="/shallwe/assets/js/jquery.form.js"></script>
	<script src="/shallwe/assets/js/jquery.validate.min.js"></script>
	<script src="/shallwe/assets/js/mail-script.js"></script>
	<script src="/shallwe/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="/shallwe/assets/js/plugins.js"></script>
	<script src="/shallwe/assets/js/main.js"></script>

</body>
</html>
<%-- <jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include> --%>