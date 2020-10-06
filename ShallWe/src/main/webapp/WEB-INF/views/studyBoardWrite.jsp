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
	
	//----------스마트에디터 START---------
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "weditor",
		sSkinURI : "${contextPath}/smartEditor/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
	//----------스마트에디터 END---------

	//----------글쓰기 Btn CLICK START---------
	$("#writeBtn").click(function(){
		var form = $("#writeForm")[0];
		var formData = new FormData(form);
// 		var $titleVal = $("#title").val();
		var val2 = oEditors.getById["weditor"].exec("UPDATE_CONTENTS_FIELD",[]);
		this.contents=$('#weditor').val();
        formData.set("studyBoard_content", this.contents);
        formData.append("boardUpload", $("#fileLoad")[0].files[0]);
		
		$.ajax({
			url : "${contextPath}/board/writeBoard"
			,method: 'post'
			,processData: false
			,contentType: false
			,data: formData
			,success:function(board_id){
				console.log("jsp입장!!")
				var boardWrite = confirm("글쓰기를 완료했습니다. 작성글을 확인하시겠습니까?");
				if(boardWrite){
					console.log("작성글 나오세요"+board_id);
					location.href="${contextPath}/board/detail/"+board_id;
				}else{
					console.log("여긴가!!");
				}
			}
		,error:function(){
			alert("글작성에 실패했습니다.");
			console.log("설마실패?!!");
			location.reload();
		}
		});		
	});
		//----------글쓰기 Btn CLICK END---------
		
		//----------수정하기 Btn CLICK START---------
	$("#updateBtn").click(function(){
		var form = $("#writeForm")[0];
		var formData = new FormData(form);
		var val2 = oEditors.getById["weditor"].exec("UPDATE_CONTENTS_FIELD",[]);
		this.contents=$('#weditor').val();
        formData.set("studyBoard_content", this.contents);
        formData.append("boardUpload", $("#fileLoad")[0].files[0]);		
// 		if("${sb.studyBoard_id}"==""||"${sb.studyBoard_id}"==null){
// 		}else{
// 			studyBoard.studyBoard_id = "${sb.studyBoard_id}";
// 		}
		$.ajax({
			url : "${contextPath}/board/updateBoard"
			,method: 'post'
			,processData: false
			,contentType: false
			,data: formData
			,success:function(board_id){
				var boardWrite = confirm("수정이 완료했습니다. 작성글을 확인하시겠습니까?");
				if(boardWrite){
					alert(board_id);
					location.href="${contextPath}/board/detail/"+board_id;
				}else{
				}
			}
			,error:function(){
				alert("글작성에 실패했습니다.");
				location.reload();
			}
		});
	});
	//----------수정하기 Btn CLICK END---------
	
	//----------글쓰기 취소 Btn CLICK START---------
	$("#cancelBtn").click(function(){
		var boardCancel = confirm("글쓰기를 취소하시겠습니까?");
		if(boardCancel){
			location.href="${contextPath}/board/studyBoard"
		}else{
		}
	});
	//----------글쓰기 취소 Btn CLICK END---------

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
			<div class="col-lg-8 posts-list" style="margin-left : auto; margin-right: auto ">
				<div class="col-sm-6">
					<h2 class="contact-title">글쓰기</h2>
				</div>
				<div class="col-lg-8">
					<form class="form-contact contact_form" id="writeForm" method="post" enctype="multipart/form-data">
						<div class="col-sm-6">
							<div class="form-group">
								<input type="hidden" name="studyBoard_id" value="${sb.studyBoard_id}">
								<input class="form-control valid" name="studyBoard_title"
									id="title" type="text" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '제목을 입력하세요'" placeholder="제목을 입력하세요"
									value="${sb.studyBoard_title}">
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<textarea name="studyBoard_content" id="weditor" rows="10"
										cols="100" placeholder="내용을 입력하세요">${sb.studyBoard_content}</textarea>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control valid" id="fileLoad" type="file" placeholder="파일첨부"
										value="${sb.studyBoard_fileName}">
								</div>
							</div>
						</div>
						<div class="form-group mt-3">
							
								<c:choose>
									<c:when test="${empty sb.studyBoard_title}">
										<button type="button" class="button button-contactForm boxed-btn" id="writeBtn">글쓰기</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="button button-contactForm boxed-btn" id="updateBtn">수정하기</button>
									</c:otherwise>
								</c:choose>
							<button type="button" class="button button-contactForm boxed-btn" id="cancelBtn">취소</button>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</section>
</main>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>