<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set value="${lectDetail.lecture}" var="lecture" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>강의 취소 요청</title>
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
	width: 500px;
	min-width: 315px;
	height: 500px;
	position: inherit;
	background-color: white;
	text-align: center;
	border-radius: 6px;
	overflow: auto;
}

h1 {
	margin: 0;
	padding: 5px;
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
$(document).ready(function() {
			
			/*------------review후기 입력 modal start------------------*/
			//필요한 엘리먼트들을 선택한다.
			const modal = document.getElementById("cancelmodal");
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
		 				'lecture.lecture_id' : ${lecture.lecture_id},
		 				'lecture_cancel_reason' : cancelContent
		 			}
		 			, success : function ( data ) {
		 				let responseObj = JSON.parse(data);
						if (responseObj.status == "success") {
							alert("강의 취소 요청이 정상적으로 되었습니다.");
							opener.parent.location.reload();
							window.close();
							self.close();
						} else {
							self.close();
						}
		 			} // end of success
		 		}); //end of ajax 
		 	}); // end of reviewInsert
			/*------------review 후기 데이터 등록   end------------------*/
		return false;
});
</script>
<body>
	<main>
		<!-- 											강의취소요청 모달 -->
			<div class="md_content">
				<h2 id="title">강의 취소 요청</h2>
				<table>
					<tbody>
						<tr>
							<th>강의명: ${lecture.lecture_title}</th>
							<td id="ctitleidval"/>
						</tr>
					</tbody>
				</table>

				<div class="modal_text">
					<form class="form-contact comment_form" id="commentForm">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<textarea name="lecture_cancel_reason" id="cancelcomment"
										cols="30" rows="5" placeholder="강의 취소 이유를 입력해주세요"></textarea>
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
	</main>

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
<jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include>