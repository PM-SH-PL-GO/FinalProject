<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
<link rel="stylesheet" href="/shallwe/assets/css/progressbar_barfiller.css">
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
<style>
.md_top {
	padding: 1em;
	display: inline;
}

button {
	all: unset;
	background-color: #990000;
	color: white;
	padding: 15px 25px;
	border-radius: 6px;
	cursor: pointer;
	float: right;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.md_content {
	width: 95%;
	min-width:315px;
	height: 65%;
	position: inherit;
	padding: 50px 50px;
	background-color: white;
	text-align: center;
	border-radius: 6px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.20), 0 6px 6px
		rgba(0, 0, 0, 0.20);
	overflow: auto;
}

h1 {
	margin: 0;
	padding: 5px;
}

.hidden {
	display: none;
}

.modal_text {
	padding: 16px;
}

textarea {
  width: 100%;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
</style>
</head>
<script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" />
<fmt:parseNumber value="${now.time/(1000*60*60*24)}" integerOnly="true" var="nowDate" />
$(function(){
	let letidValue = $("input[name=listlecture_id]").val();
	$("div[name=gotoDe]").click(function(){
		location.href = "${contextPath}/lectures/detail?lecture_id=" +letidValue;		
	});
	let letidendValue = $("input[name=listendlecture_id]").val();
	$("div[name=gotoDeend]").click(function(){
		location.href = "${contextPath}/lectures/detail?lecture_id=" +letidendValue;		
	});
	
	$(document).ready(function() {
		
		/*------------review후기 입력 modal start------------------*/
		//필요한 엘리먼트들을 선택한다.
		const openButton = document.getElementById("openCancelre");
		const modal = document.getElementById("cancelmodal");
		const closeButton = modal.querySelector("button");
		//동작함수
		const openModal = () => {
			modal.classList.remove("hidden");
		}
		const closeModal = () => {
			modal.classList.add("hidden");
		}
		//클릭 이벤트
		openButton.addEventListener("click", openModal);
		closeButton.addEventListener("click", closeModal);
		
		/*------------review후기 입력 modal end------------------*/
		
		/*------------review입력창 후기 입력시 글자수세기   start------------------*/
		var $cancelFormObj = $("form#commentForm");
		var $cancelCommentObj = $cancelFormObj.find("textarea#cancelcomment");
		console.log($cancelCommentObj);
		$cancelCommentObj.focus();
		// review content 남은 글자수
		$cancelCommentObj.keydown(function(e) {
			var content = $(this).val();
			var count = 50 - content.length;
			if (content.length > 50) {
				$(this).val($(this).val().substring(0, 50));
				count = 0;
			}
			$('.remainText').html("남은글자수: " + count + "/50자");
		});
		
		/*------------review입력창 후기 입력시 글자수세기   end------------------*/
		/*------------review 후기 데이터 등록   start------------------*/
	 	// 후기 등록하기 버튼 클릭 시 
	 	$cancelFormObj.on('submit', function e () {
	 		var cancelContent = $("#cancelcomment").val();	
	 		$.ajax({
	 			url: "${contextPath}/lectures/tutorcancelLecture"
	 			, method : 'POST'
	 			, data : 
	 			{
	 				'lecture.lecture_id' : letidValue,
	 				'lecture_cancel_reason' : cancelContent
	 			}
	 			, success : function ( data ) {
	 				let responseObj = JSON.parse(data);
					if (responseObj.status == "success") {
						alert("강의 취소 요청이 정상적으로 되었습니다.");
					} else {
						alert("강의 등록에 실패했습니다.");
						$("$cancelCommentObj").focus();
					}
	 			} // end of success
	 		}); //end of ajax 
	 	}); // end of reviewInsert
		/*------------review 후기 데이터 등록   end------------------*/
		
	});
	
	
	
	
	return false;
});
</script>
<body>
	<main>
		<!--? 강의목록 Start -->
		<div class="popular-directorya-area section-padding40 fix">
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
									<div name="gotoDe" style="cursor: pointer;">
										<div class="properties__imgseo overlay1">
											<img src="/shallwe/lecture/${lecture.lecture_img}" alt=""
												style="cursor: pointer;">

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
										<input type="text" name="listlecture_id"
											value="${lecture.lecture_id}" />
									</div>
									<div
										class="properties__footer d-flex justify-content-between align-items-center">
										<h3>
											<fmt:formatNumber value="${lecture.lecture_price}"
												pattern="#,###" />
											원
										</h3>
										<div class="heart">
											<img id="openCancelre"
												src="/shallwe/assets/img/gallery/cancel.png" width="30px"
												alt="강의취소요청" title="강의취소요청">
											<!-- 											강의취소요청 모달 -->
											<div class="modal hidden" id="cancelmodal">
												<div class="md_content">
													<div class="md_top">
														<button>X</button>
													</div>
													<h2 id="title">강의 취소 요청</h2>
													<table>
														<tbody>
															<tr>
																<th>강의명</th>
																<td>${lecture.lecture_title}</td>
															</tr>
														</tbody>
													</table>

													<div class="modal_text">
														<form class="form-contact comment_form" id="commentForm">
															<div class="row">
																<div class="col-12">
																	<div class="form-group">
																		<textarea name="lecture_cancel_reason" id="cancelcomment" cols="30"
																			rows="5" placeholder="강의 취소 이유를 입력해주세요"></textarea>
																		<span class="remainText">남은글자수 : 50/50자 </span>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<button type="submit"
																	class="button button-contactForm btn_1 boxed-btn">요청등록</button>
															</div>
														</form>
													</div>
													<!-- end of modal_text -->
												</div>
												<!-- end of md_content -->
											</div>
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
			class="popular-directorya-area border-bottom section-padding40 fix">
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
									<div name="gotoDeend" style="cursor: pointer;">
										<div class="properties__imgseo overlay1">
											<img src="/shallwe/lecture/${lecture.lecture_img}" alt="">
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
										<h3>
											<fmt:formatNumber value="${lecture.lecture_price}"
												pattern="#,###" />
											원
										</h3>
										<div class="heart">
											<img src="/shallwe/assets/img/gallery/performance.png"
												width="30px" alt="후기보기" title="후기보기">
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
	<script src="/shallwe/assets/js/contact.js"></script>
	<script src="/shallwe/assets/js/jquery.form.js"></script>
	<script src="/shallwe/assets/js/jquery.validate.min.js"></script>
	<script src="/shallwe/assets/js/mail-script.js"></script>
	<script src="/shallwe/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="/shallwe/assets/js/plugins.js"></script>
	<script src="/shallwe/assets/js/main.js"></script>

</body>
</html>