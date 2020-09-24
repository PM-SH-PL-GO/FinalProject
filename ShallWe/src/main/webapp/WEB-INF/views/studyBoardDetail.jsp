<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate var="resultDt" value="${studyBoard.studyBoard_write_dt}" pattern="yyyy-MM-dd"/>

<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shallwe-함께 배우는 교육공간</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

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
<style>
.btn {
	background: #00dbd5;
}

.btn::before {
	background: #00dbd5;
}

.boxed-btn:hover {
	background: #00dbd5;
	border: 1px solid #00dbd5
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
.blog_details a:hover {
	color: #B367FF
}
p {
    margin-bottom: 0px;
}
h5 i{
	margin-right: 10px;
}
</style>
<script>
function formatDate(date) { 
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
	if (month.length < 2) month = '0' + month; if (day.length < 2) day = '0' + day; 
	return [year, month, day].join('-'); 
}

$(function(){
	$.ajax({
		url:"/shallwe/reply/"+${studyBoard.studyBoard_id}
		,method:"get"
		,success:function(pbObj){
		var $replyPage=$("#replyList");
		var $replyCount=$("div.comments-area h4#replyCount")
		var replyPageCountData="댓글 수("+pbObj.list.length+")"
		var replyPageData="";
			var arr = pbObj.list;
			arr.forEach(function(studyReply, index){
				replyPageData += "<div class=\"single-comment justify-content-between d-flex\">"
				replyPageData += "<div class=\"user justify-content-between d-flex\">"
				replyPageData += "<div class=\"desc\">"
				replyPageData += "<p class=\"comment\">"+studyReply.studyreply_content+"</p>"
				replyPageData += "<div class=\"d-flex justify-content-between\">"
				replyPageData += "<div class=\"d-flex align-items-center\">"
				replyPageData += "<h5>"
				replyPageData += "<a><i class=\"fa fa-user\"></i>"+studyReply.member.member_name+"</a>"
				replyPageData += "</h5>"
				replyPageData += "<p>"+formatDate(studyReply.studyreply_dt)+"</p>"
				replyPageData += "</div>"
				replyPageData += "<div class=\"reply-btn\">"
				replyPageData += "<a class=\"btn-reply text-uppercase\">수정</a>" 
				replyPageData += "<a class=\"btn-reply text-uppercase\">삭제</a>"
				replyPageData += "</div>"
				replyPageData += "</div>"
				replyPageData += "</div>"
				replyPageData += "</div>"
				replyPageData += "</div>"			
				replyPageData += "<hr>"			
				
			});
			$replyCount.html(replyPageCountData);
			$replyPage.html(replyPageData);
		}
		
	});
	
});
function formatDate(date) { 
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
	if (month.length < 2) month = '0' + month; if (day.length < 2) day = '0' + day; 
	return [year, month, day].join('-'); 
}
</script>
</head>

<body>

	<!--? Blog Area Start -->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list" style="margin: auto; ">
					<div class="single-post">
						<ul class="blog-info-link"style="float: right;" >
							<li><a href="#">삭제</a></li>
							<li><a href="#">수정</a></li>
							<li><a href="#">목록보기</a></li>
						</ul>
						<div class="blog_details">
							<h2 style="color: #2d2d2d;">${studyBoard.studyBoard_title}
							</h2>
							<ul class="blog-info-link mt-3 mb-4">
								<li><a href="#"><i class="fa fa-user"></i>${studyBoard.member.member_name}</a></li>
								<li><a href="#"><i class="fa fa-comments"></i> 조회 수(${studyBoard.studyBoard_view_count})</a></li>
								<li><a href="#">작성일 ${resultDt}</a></li>
							</ul>
							<p class="excert">${studyBoard.studyBoard_content}</p>
						</div>
					</div>

					<div class="comments-area">
						<h4 id="replyCount"></h4>
						<div class="comment-list" id="replyList">
							
						</div>
						<div class="comment-form">
							<h4>댓글 쓰기</h4>
							<form class="form-contact comment_form" action="#"
								id="commentForm">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<textarea class="form-control w-100" name="comment"
												id="comment" cols="30" rows="9" placeholder="내용을 입력하세요"></textarea>
										</div>
										<div class="form-group">
											<button type="submit"
												class="button button-contactForm btn_1 boxed-btn">댓글
												쓰기</button>
										</div>
									</div>
									<div class="col-12"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Blog Area End -->

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
										<script>document.write(new Date().getFullYear());</script>
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
    <!-- Progress -->
    <script src="/shallwe/assets/js/jquery.barfiller.js"></script>
    
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