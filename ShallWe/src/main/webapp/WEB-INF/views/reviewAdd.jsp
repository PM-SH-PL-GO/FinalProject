<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="lecture" value="${requestScope['lecture']}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Shallwe-함께 배우는 교육공간</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/shallwe/assets/img/favicon.ico">

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
/* DivTable.com */
.divTable {
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

/* modal CSS */
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

.md_overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
}

.md_content {
	width: 60%;
	height: 80%;
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
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}

.divTable {
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

/*만족도*/
.scoreBar { 
	margin: 0 auto;
	.numValue {
		width: 130px;
		margin: 0 auto;
		display: block;
		font-size: 2.4em;
		font-weight: bold;
		border-radius: 5px;
		border: 1px solid gray;
		background-color: #EEE;
		text-align: center;
	}
	
	input[type=range] {
		-webkit-appearance: none;
		margin: 0 auto;
		width: 400px;
	}
	
	input[type=range]:focus {
		outline: none;
	}
	
	input[type=range]::-webkit-slider-runnable-track {
		width: 100%;
		height: 8.4px;
		cursor: pointer;
		animate: 0.2s;
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #cc;
		background: #ccc;
		border-radius: 1.3px;
		border: 0.2px solid #010101;
	}
	
	input[type=range]::-webkit-slider-thumb {
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #ccc;
		border: 1px solid #000000;
		height: 36px;
		width: 16px;
		border-radius: 3px;
		background: #ffffff;
		cursor: pointer;
		-webkit-appearance: none;
		margin-top: -14px;
	}
	
	input[type=range]:focus::-webkit-slider-runnable-track {
		background: #ccc;
	}
	
	input[type=range]::-moz-range-track {
		width: 100%;
		height: 8.4px;
		cursor: pointer;
		animate: 0.2s;
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #ccc;
		background: #3071a9;
		border-radius: 1.3px;
		border: 0.2px solid #010101;
	}
	
	input[type=range]::-moz-range-thumb {
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #cccc;
		border: 1px solid #000000;
		height: 36px;
		width: 16px;
		border-radius: 3px;
		background: #ffffff;
		cursor: pointer;
	}
	
	input[type=range]::-ms-track {
		width: 100%;
		height: 8.4px;
		cursor: pointer;
		animate: 0.2s;
		background: transparent;
		border-color: transparent;
		border-width: 16px 0;
		color: transparent;
	}
	
	input[type=range]::-ms-fill-lower {
		background: #2a6495;
		border: 0.2px solid #010101;
		border-radius: 2.6px;
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	}
	
	input[type=range]::-ms-fill-upper {
		background: #3071a9;
		border: 0.2px solid #010101;
		border-radius: 2.6px;
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	}
	
	input[type=range]::-ms-thumb {
		box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
		border: 1px solid #000000;
		height: 36px;
		width: 16px;
		border-radius: 3px;
		background: #ffffff;
		cursor: pointer;
	}
	
	input[type=range]:focus::-ms-fill-lower {
		background: #ddd;
	}
	
	input[type=range]:focus::-ms-fill-upper {
		background: #ccc;
	}
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	/*------------review후기 입력 modal start------------------*/
	//필요한 엘리먼트들을 선택한다.
	const openButton = document.getElementById("open");
	const modal = document.querySelector(".modal");
	const overlay = modal.querySelector(".md_overlay");
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
	
	/*------------만족도 점수 매기기  start------------------*/
	var startValue = 50;

	function updateIt(updateval) {
	  if (updateval) {
	      $('.numValue').val(updateval);
	  }; 
	  updateval = '';
	};

	$('input[type=range]').mousemove(function () { 
   		updateIt($(this).val()); 
    });

	$('input[type=range]').change(function () {
	  	$('.numValue').val($(this).val())
	    updateIt($('.numValue').val()); 
	});

 	updateIt(startValue);
	/*------------만족도 점수 매기기  end------------------*/
 	
	
	/*------------review입력창 후기 입력시 글자수세기   start------------------*/
	var $reviewFormObj = $("form#commentForm");
	var $reviewCommentObj = $reviewFormObj.find("textarea#comment");
	$reviewCommentObj.focus();

	// review content 남은 글자수
	$reviewCommentObj.keydown(function(e) {
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
 	$reviewFormObj.on('submit', function e () {
/*  		private String memberId;
 		private String lectureCategoryId;
 		private String reviewContent;
 		private int lectureId;
 		private int reviewScore; */

 		
/*  		var memberId='member2';
 		var lectureCategoryId = 'MA';
 		var reviewContent = $reviewCommentObj.val();
 		var lectureId = 3;
 		var reviewScore = $('.numValue').val(); */

 		var memberId='member1';
 		var lectureCategoryId = 'MA';
 		var reviewContent = $reviewCommentObj.val();
 		var lectureId = 3;
 		var reviewScore = $('.numValue').val();
 		var tutorId = 'member3';
 		
 		var reviewBean = new Object(); 
 		reviewBean.memberId = memberId;
 		reviewBean.lectureId = lectureId;
 		reviewBean.lectureCategoryId = lectureCategoryId;
 		reviewBean.reviewContent = reviewContent;
 		reviewBean.reviewScore = reviewScore;
 		reviewBean.tutorId = tutorId;
 		var jsonData = JSON.stringify(reviewBean);
 		
 		
 		$.ajax({
 			url: "/shallwe/reviewAddmethod"
 			, method : 'POST'
 			, contentType: 'application/json'
 			, data : jsonData
 			, success : function ( responseData ) {
 				console.log(responseData);
 			} // end of success
 		}); //end of ajax 
 	}); // end of reviewInsert
	/*------------review 후기 데이터 등록   end------------------*/
	
}); // end of load


</script>
</head>

<body>
	<button id="open">모달창 열기</button>
	<div class="modal hidden">
		<div class="md_content">
			<div class="md_top">
				<button>X</button>
			</div>
			<h1 id="title">강의후기</h1>
			<div class="divTable">
				<div class=divTableRow>
					<div class="divTableCol">
						<img src="lecture/${lecture.lecture_img}" class="mb-10" alt="강사사진">
					</div>
					<div class="divTableCol">
						<span id="lecutureTitle"><label>강의명 :</label>${lecture.lecture_title}</span><br> 
						<span><label>강사 :</label> ${lecture.tutor.member.member_id}</span>
						
					</div>
				</div>

			</div>
			<!--review-->
			<div class="modal_text">
				<form class="form-contact comment_form" id="commentForm">
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<textarea name="comment" id="comment" cols="30" rows="10"
									placeholder="강의 수강 후기를 등록해주세요"></textarea>
								<span class="remainText">남은글자수 : 50/50자 </span>
							</div>
						</div>

						<div class="scoreBar">
							<input type="text" readonly value="0" class="numValue form-control" step="5" max="100" min="0"><br>
							<input id="slider1" type="range" step="5" min="0" max="100" /><br>
						</div>
					</div>
					<!-- end of row -->

					<div class="form-group">
						<button type="submit"
							class="button button-contactForm btn_1 boxed-btn">등록하기</button>
					</div>
				</form>
			</div>
			<!-- end of modal_text -->

		</div>
		<!-- end of md_content -->
	</div>
	<!-- end of modal -->

</body>
</html>