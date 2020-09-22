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
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/hamburgers.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<style>
.btn{
background : #00dbd5;
}
.btn::before {
	background: #009994;
}
.boxed-btn:hover{
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/shallwe/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
$(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder:"weditor",
		sSkinURI: "/shallwe/smartEditor/SmartEditor2Skin.html",
		fCreator:"createSEditor2"
	});
});
</script>
</head>

<main>
	<div class="row">
		<div class="col-sm-6">
			<h2 class="contact-title">글쓰기</h2>
		</div>
		<div class="col-lg-8">
			<form class="form-contact contact_form" action="contact_process.php"
				method="post" id="contactForm" novalidate="novalidate">
				<div class="col-sm-6">
					<h4>제목</h4>
					<div class="form-group">
						<input class="form-control valid" name="name" id="name"
							type="text" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '제목을 입력하세요'"
							placeholder="제목을 입력하세요">
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<h4>내용</h4>
						<div class="form-group">
							<textarea name = "weditor" id="weditor" rows="10" cols="100" placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					<div class="col-sm-6">
						<h4>파일첨부</h4>
							<button class="btn">찾아보기</button>
						<div class="form-group">
							<input class="form-control valid" name="name" id="name"
								type="text" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '파일첨부'"
								placeholder="파일첨부">
						</div>
					</div>
				</div>
				<div class="form-group mt-3">
					<button type="submit" class="button button-contactForm boxed-btn">글쓰기</button>
					<button type="submit" class="button button-contactForm boxed-btn">취소</button>
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