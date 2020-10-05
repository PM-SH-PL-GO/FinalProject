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
		<div class="row">
			<div class="col-lg-8 posts-list" style="margin: auto; ">
					<div class="single-post">
						<ul class="blog-info-link"style="float: right;" >
<%-- 						<c:if test="${loginId eq  boardId}"> --%>
<!-- 							<li><a id="delete">삭제  </a></li> -->
<!-- 							<li><a id="update">수정</a></li> -->
<%-- 						</c:if> --%>
							<li><a id="list">목록보기</a></li>
						</ul>
						<div class="blog_details">
							<h2 style="color:#2d2d2d;" class="box-title">글제목 : ${freeboard.freeboard_title}</h2>
							<ul class="blog-info-link mt-3 mb-4">
								<li><a href="#"><i class="fa fa-user"></i>${freeboard.member.member_id}</a></li>
								<li><a href="#"><i class="fa fa-comments"></i> 조회 수(${freeboard.freeboard_view_count})</a></li>
								<li><span class="description"><a href="#">작성일 <fmt:formatDate pattern="yyyy-MM-dd" value="${freeboard.freeboard_write_dt}"/></a></span></li>
							</ul>
						</div>
						<div class="box-body" style="height: 700px">
							${freeboard.freeboard_content}
						</div>
											<div class="comments-area">
												<h4 id="replyCount"></h4>
												<div class="comment-list" id="replyList">
													
												</div>
												<div class="comment-form">
													<h4>댓글 쓰기</h4>
													<form class="form-contact comment_form" id="commentForm">
															<div class="col-12">
																<div class="form-group">
																	<textarea class="form-control w-100" name="comment"
																		id="replyText" cols="30" rows="9" placeholder="내용을 입력하세요"></textarea>
																</div>
						
																<div class="form-group">
																	<button type="button"
																		class="button button-contactForm btn_1 boxed-btn" id="replyBtn">댓글 쓰기</button>
																</div>
															</div>
															<div class="col-12"></div>
													</form>
												</div>
											</div>
								<div class="box-footer">
									<form role ="form" method="post">
										<input type="hidden" name="freeboard_id" value="${freeboard.freeboard_id}"
									</form>
									<button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
									<div class="pull-right">
										<button type="submit" class="btn modBtn"><i class="fa fa-edit"></i>수정</button>
										<button type="submit" class="btn delBtn"><i class="fa fa-del"></i>삭제</button>
									</div>
								</div>
				</div>
			</div>
		</div>
	</section>
</main>
<script>
$(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".modBtn").on("click", function(){
		formObj.attr("action", "freemodify");
		formObj.attr("method","get");
		formObj.submit();
	});
	
	$(".delBtn").on("click", function(){
		formObj.attr("action", "freedelete");
		formObj.submit();
	});
	
	$(".listBtn").on("click", function(){
		self.location="freeboard"
	});
});
</script>



</footer>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>