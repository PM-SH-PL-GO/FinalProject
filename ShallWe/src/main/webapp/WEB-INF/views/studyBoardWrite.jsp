<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	src="${contextPath}/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(function() {
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "weditor",
			sSkinURI : "${contextPath}/smartEditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});

	$("#writeBtn").click(function(){
		console.log("들어오나요");
		var $titleVal = $("#title").val();
		var $fileLoadtVal = $("#fileLoad").val();
		var val2 = oEditors.getById["weditor"].exec("UPDATE_CONTENTS_FIELD",[]);
		this.contents=$('#weditor').val();
		var studyBoard = new Object();
		studyBoard.studyBoard_title= $titleVal;
		studyBoard.studyBoard_content = this.contents;
		studyBoard.studyBoard_fileName = $fileLoadtVal;
		var jsonData = JSON.stringify(studyBoard);
		
		$.ajax({
			url : "${contextPath}/board/writeBoard"
			,method: 'post'
			,contentType: 'application/json'
 			,data: jsonData
			,success:function(){
				var boardWrite = confirm("글쓰기를 완료했습니다. 작성글을 확인하시겠습니까?");
				if(boardWrite){
					location.href="${contextPath}/board/detail/"+$boardIdVal;
				}else{
					
				}
				alert("성공");
			}
		,error:function(){
			alert("글작성에 실패했습니다.");
			location.reload();
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
	<section class="blog_area single-post-area section-padding">
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
								onblur="this.placeholder = '제목을 입력하세요'" placeholder="제목을 입력하세요"
								value="${sb.studyBoard_title}">
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<h4>내용</h4>
							<div class="form-group">
								<textarea name="studyBoard_content" id="weditor" rows="10"
									cols="100" placeholder="내용을 입력하세요">${sb.studyBoard_content}</textarea>
							</div>
						</div>
						<div class="col-sm-6">
							<h4>파일첨부</h4>
							<button class="btn">찾아보기</button>
							<div class="form-group">
								<input class="form-control valid" name="studyBoard_fileName"
									id="fileLoad" type="text" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '파일첨부'" placeholder="파일첨부"
									value="${sb.studyBoard_fileName}">
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