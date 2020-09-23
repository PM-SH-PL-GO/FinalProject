<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>DirectoryListing</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/shallwe/assets/img/favicon.ico">
<style>
.btn {
	background: #00dbd5;
}

.btn::before {
	background: #009994;
}

.boxed-btn:hover {
	background: #00dbd5;
}

.boxed-btn {
	background: #fff;
	color: #00dbd5 !important;
	display: inline-block;
	padding: 18px 44px;
	font-family: "Rubik", sans-serif;
	font-size: 14px;
	font-weight: 400;
	border: 0;
	border: 1px solid #00dbd5;
	letter-spacing: 3px;
	text-align: center;
	color: #00dbd5;
	text-transform: uppercase;
	cursor: pointer
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/shallwe/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(function() {
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "weditor",
			sSkinURI : "/shallwe/smartEditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});

	$("#writeBtn").click(function(){
		console.log("들어오나요");
		var $titleVal = $("#title").val();
		var $contentVal = $("#weditor").val();
		var $fileLoadtVal = $("#fileLoad").val();
		var $formObj = $('#writeForm');
		console.log("$formObj.serialize() ::: " + $formObj.serialize());
		
		
		
		$.ajax({
			url : "/shallwe/board/writeBoard"
			,contentType : "application/json; charset=utf-8"
			,method: 'post'
 			,data: JSON.stringify($titleVal,$contentVal,$fileLoadtVal)
			,success:function(data){
				alert("성공");
			}
		,fail:function(){
			alert("실패")
		}
		});		
	});

	});
</script>
</head>
<!-- topbar Start -->
<header>
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
</header>
<!-- topbar End -->
<main>
	<div class="row slider-height1">
		<div class="col-sm-6">
			<h2 class="contact-title">글쓰기</h2>
		</div>
		<div class="col-lg-8">
			<form class="form-contact contact_form" id="writeForm">
				<div class="col-sm-6">
					<h4>제목</h4>
					<div class="form-group">
						<input class="form-control valid" name="studyBoard_title"
							id="title" type="text" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '제목을 입력하세요'" placeholder="제목을 입력하세요">
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<h4>내용</h4>
						<div class="form-group">
							<textarea name="studyBoard_content" id="weditor" rows="10"
								cols="100" placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					<div class="col-sm-6">
						<h4>파일첨부</h4>
						<button class="btn">찾아보기</button>
						<div class="form-group">
							<input class="form-control valid" name="studyBoard_fileName"
								id="fileLoad" type="text" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '파일첨부'" placeholder="파일첨부">
						</div>
					</div>
				</div>
				<div class="form-group mt-3">
					<button type="button" class="button button-contactForm boxed-btn"
						id="writeBtn">글쓰기</button>
					<button type="button" class="button button-contactForm boxed-btn">취소</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	</section>
	<!-- Contact Area End -->

</main>
<footer>
	<div class="footer-wrapper pt-30">
		<!-- footer-bottom -->
		<div class="footer-bottom-area">
			<div class="container">
				<div class="footer-border">
					<div class="row d-flex justify-content-between align-items-center">
						<div class="col-xl-10 col-lg-9 ">
							<div class="footer-copy-right">
								<p>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									Copyright &copy;
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									All rights reserved | This template is made with <i
										class="fa fa-heart" aria-hidden="true"></i> by <a
										href="https://colorlib.com" target="_blank">Colorlib</a>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</footer>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>