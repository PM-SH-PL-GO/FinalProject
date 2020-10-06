<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
			<div class="col-lg-12">
				<form role="form" id="writeForm" method="post" action="${path}/board/freemodify">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">게시글 작성</h3>
						</div>
						<div class="box-body">
							<input type="hidden" name="freeboard_id" value="${freeboard.freeboard_id}"
							<div class="form-group">
								<label for="title">제목</label>
									<input class="form-control" id="title" name="title" placeholder="제목을 입력해 주세요" value="${freeboard.freeboard_title}"
<!-- 							<input class="form-control valid" name="studyBoard_title" -->
<!-- 								id="title" type="text" onfocus="this.placeholder = ''" -->
<!-- 								onblur="this.placeholder = '제목을 입력하세요'" placeholder="제목을 입력하세요" -->
<%-- 								value="${sb.studyBoard_title}"> --%>
							</div>
							<div class="form-group">
								<label for="content">내용</label>
								<textarea class="form-control" id="content" name="content" rows="30" placeholder="내용을 입력해주세요" style="resize:none;">${freeboard.freeboard_content}</textarea>
							</div>
							<div class="form-group">
								<label for="member_id">작성자</label>
								<input class="form-control" id="member_id" name="member_id" value="$freeboard.freeboard_id}" readonly>
							</div>
						</div>
<!-- 					<div class="row"> -->
<!-- 						<div class="col-12"> -->
<!-- 							<h4>내용</h4> -->
<!-- 							<div class="form-group"> -->
<!-- 								<textarea name="studyBoard_content" id="weditor" rows="10" -->
<%-- 									cols="100" placeholder="내용을 입력하세요">${sb.studyBoard_content}</textarea> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-sm-6"> -->
<!-- 							<h4>파일첨부</h4> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input class="form-control valid" id="fileLoad" type="file" placeholder="파일첨부" -->
<%-- 									value="${sb.studyBoard_fileName}"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
						<div class="box-footer">
							<button type="button" class="btn btn-primary"><i class="fa fa-list"></i>목록</button>
							<div class="pull-right">
								<button type="button" class="btn cancelBtn"><i class="fa fa-cancel"></i>취소</button>
								<button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i>저장</button>
								
							</div>

<!-- 						<div class="form-group mt-3"> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${empty sb.studyBoard_title}"> --%>
<!-- 									<button type="button" class="button button-contactForm boxed-btn" id="writeBtn">글쓰기</button> -->
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<button type="button" class="button button-contactForm boxed-btn" id="updateBtn">수정하기</button> -->
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<!-- 									<button type="button" class="button button-contactForm boxed-btn">취소</button> -->
<!-- 						</div> -->
						</div>
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
<script>
$(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".modBtn").on("click", function(){
		formObj.submit();
	});
	
	$(".cancelBtn").on("click", function(){
		history.go(-1);
	});
	
	$(".listBtn").on("click", function(){
		self.location="/board/freelist"
	})
});
</script>
</html>