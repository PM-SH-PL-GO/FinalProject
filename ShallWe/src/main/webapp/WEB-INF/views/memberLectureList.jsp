<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="/shallwe/assets/css/animate.min.css">
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
	
	
	
	// 강사후기등록 버튼 클릭시 발생 이벤트
	$("div.reviewAdd").on('click', function (e) { 
		var $lectureId = $(this).find('input[name=lectureId]').val();
		$.ajax({ 
			url: '${contextPath}/member/reviewAdd'
			, method : 'GET'
			, data : {"lecture_id" : $lectureId}
			, success : function (responseData) {
				var reviewModalObj = $("div.reviewModal");
				reviewModalObj.append(responseData);
			}
		}); 
	}); // end of 강사 후기 등록 버튼
	
	// 강사후기삭제 버튼 클릭시 발생 이벤트
	$("div.reviewRemove").on('click', function (e) { 
		var $lectureId = $(this).find('input[name=lectureId]').val();
		if ( confirm("정말로 후기를 삭제하시겠습니까?") ) {
			$.ajax({
			    url: "${contextPath}/member/removeReview"
			    , method : 'GET'
			    , data : {"lecture_id" : $lectureId}
			    , success : function ( responseData ) {
			  	  if( responseData == 'success') {
			  		  alert("후기삭제 성공!");
			  	  } else {
			  		  alert("후기삭제 실패!")
			  	  }
			   	 location.reload();
			    }
			}); // end of ajax
 		}
	}); // end of 강사 후기 삭제

	// 강의결제취소 이벤트
	$("div.lecture_cancle").on('click', function (e) { 
		var $lectureId = $(this).find('input[name=lectureId]').val();
		
		$.ajax({ 
			url: '${contextPath}/member/updateMemberLectureHistory'
			, method : 'GET'
			, data : {"lecture_id" : $lectureId}
			, success : function (responseData) {
				alert("강의 취소 처리 되었습니다.");
				location.reload();
			}
		}); 
	}); // end of 강의결제취소 버튼
}); // end of jsp load 이벤트
</script>
<style>

</style>
</head>
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
							<h2>수강 목록${rev}</h2>
						</div>
					</div>
				</div>
				<div class="directory-active">
					<c:forEach items="${mlthlist}" var="ml" varStatus="i">
						<c:set var="m" value="${mlthlist[i.index]}" />
						<c:set var="lecture" value="${m.lecture}" />
						<c:set var="tutor" value="${lecture.tutor}" />
						<fmt:formatDate var="startDt" value="${lecture.lecture_start_dt}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate var="endDt" value="${lecture.lecture_end_dt}"
							pattern="yyyy-MM-dd" />
						<fmt:parseDate var="endDat" value="${endDt}" pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${endDat.time/(1000*60*60*24)}"
							integerOnly="true" var="endDate" />
						<fmt:formatDate var="cancelDt" value="${m.cancel_dt}"
							pattern="yyyy-MM-dd" />
						<c:if
							test="${endDate-nowDate>=0 && lecture.lecture_state eq '승인' && empty cancelDt}">

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
											<h3>
												<a href="#">${lecture.lecture_title}</a>
											</h3>
											<h6>${startDt}~${endDt}</h6>
											<h6>${tutor.tutor_nickname}</h6>
											<h6>현재인원: ${lecture.lecture_current} / 최대인원:
												${lecture.lecture_max}</h6>
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
										<div class="heart lecture_cancle">
											<div style="cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">수강취소</div>
											<input type="hidden" name="lectureId" value="${lecture.lecture_id}">
										</div>
									</div>
								</div>
							</div>
							<!-- Single -->
							<!-- 밑에는 승인 끝 -->
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
					<c:forEach var="i" begin="0" end="${fn:length(mlthlist)}">
						<c:set var="m" value="${mlthlist[i]}" />
						<c:set var="lecture" value="${m.lecture}" />
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
											<h6>${startDt}~${endDt}</h6>
											<h6>${tutor.tutor_nickname}</h6>
											<h6>현재인원: ${lecture.lecture_current} / 최대인원:
												${lecture.lecture_max}</h6>
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
										<c:set var="eqfalse" value="true"/>
										<c:set var="eqtrue" value="false"/>
										<c:forEach items="${relist}" var="rl" varStatus="i">
										<c:set var="rel" value="${relist[i.index]}" />
											<c:set var="rlecture_id"
												value="${rel.member_lecture_history.lecture.lecture_id}" />
											<c:if test="${rlecture_id eq lecture.lecture_id}">
												<c:set var="eqfalse" value="false"/>
												<c:set var="eqtrue" value="true"/>
											</c:if>
										</c:forEach>
										<c:if test="${empty rlecture_id || eqfalse}">
											<div class="heart reviewAdd">
													<div style="cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">후기등록</div>
													<input type="hidden" name="lectureId"
													value="${lecture.lecture_id}">
											</div>
										</c:if>
										<c:if test="${eqtrue}">
											<div class="heart reviewRemove">
													<div style="cursor: pointer; background-color: #00dbd5; border-radius: 10px; color: white; padding: 8px;">후기삭제</div>
													<input type="hidden" name="lectureId"
													value="${lecture.lecture_id}">
											</div>
										</c:if>
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
		<div class="reviewModal"></div>

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