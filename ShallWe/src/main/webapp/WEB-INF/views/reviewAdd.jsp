<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="lecture" value="${requestScope['lecture']}"/>
<c:set var="member_id" value="${requestScope['member_id']}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
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
	width: 50%;
	height: 85%;
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
	
	/* table css*/
	table {
	  text-align: center;
	  margin: 50px auto 0;
	  border-collapse: collapse;
	  width: 100%;
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
	
	openModal();
	//클릭 이벤트
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
 	var $reviewAddButton = $reviewFormObj.find("button[type=button]");
 	$reviewAddButton.on('click', function e () {
 		var memberId= "${member_id}";
 		var lectureCategoryId = "${lecture.lectureCategory.lecture_category_id}";
 		var reviewContent = $reviewCommentObj.val();
 		var lectureId = "${lecture.lecture_id}";
 		var reviewScore = $('.numValue').val();
 		var tutorId = "${lecture.tutor.member.member_id}";
 		
 		var reviewBean = new Object(); 
 		reviewBean.memberId = memberId;
 		reviewBean.lectureId = lectureId;
 		reviewBean.lectureCategoryId = lectureCategoryId;
 		reviewBean.reviewContent = reviewContent;
 		reviewBean.reviewScore = reviewScore;
 		reviewBean.tutorId = tutorId;
 		var jsonData = JSON.stringify(reviewBean);
 		
 		$.ajax({
 			url: "${contextPath}/member/reviewAddmethod"
 			, method : 'POST'
 			, contentType: 'application/json'
 			, data : jsonData
 			, success : function ( responseData ) {
 				alert("후기등록 성공했습니다.");
 				location.reload();
 			} // end of success
 		}); //end of ajax 
 	}); // end of reviewInsert
	/*------------review 후기 데이터 등록   end------------------*/
	
}); // end of load


</script>
</head>

<body>
<!-- 	<button id="open">모달창 열기</button> -->
	<div class="modal hidden">
		<div class="md_content">
			<div class="md_top">
				<button>X</button>
			</div>
			<h1 id="title">강의후기</h1>
			<table>
		   		<tbody>
<%-- 					<tr><th>강의이미지</th><td class="img"><img id ="lecture_img" src="lecture/${lecture.lecture_img}" class="mb-10" alt="강사사진"> </td></tr> --%>
					<tr><th>강의명</th><td class="title">${lecture.lecture_title}</td></tr>
					<tr><th>강사명</th><td class="tutorId">${lecture.tutor.member.member_id}</td></tr>
				</tbody>
			</table>

			<!--review-->
			<div class="modal_text">
				<form class="form-contact comment_form" id="commentForm">
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<textarea name="comment" id="comment" cols="30" rows="5"
									placeholder="강의 수강 후기를 등록해주세요"></textarea>
								<span class="remainText">남은글자수 : 50/50자 </span>
							</div>
						</div>

						<div class="scoreBar">
							<h3>스크롤바를 드래그 하시면 점수를 설정할 수 있습니다</h3>
							<input id="slider1" type="range" step="5" min="0" max="100" /><br>
							<input type="text" readonly value="0" class="numValue form-control" step="5" max="100" min="0"><br>
						</div>
					</div>
					<!-- end of row -->

					<div class="form-group">
						<button type="button"
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
<%-- <jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include> --%>