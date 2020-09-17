<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>DirectoryListing</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

 	<!-- CSS here -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/slicknav.css">
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/hamburgers.min.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/slick.css">
	<link rel="stylesheet" href="assets/css/nice-select.css">
	<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="listing.html">Catagories</a></li> 
                                    <li><a href="#">Pages</a>
                                        <ul class="submenu">
                                            <li><a href="directory_details.html">listing Details</a></li>
                                            <li><a href="listing.html">Catagories</a></li> 
                                        </ul>
                                    </li>
                                    <li><a href="blog.html">Blog</a>
                                        <ul class="submenu">
                                            <li><a href="blog.html">Blog</a></li>
                                            <li><a href="blog_details.html">Blog Details</a></li>
                                            <li><a href="elements.html">Elements</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </nav>
                        </div>          
                        <!-- Header-btn -->
                        <div class="header-btns d-none d-lg-block f-right">
                            <a href="#" class="mr-40"><i class="ti-user"></i> Log in</a>
                            <a href="#" class="btn">Add Listing</a>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
     </header>
    <main>
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap2 pt-20 text-center">
                                <h2>Element</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<!--? Start Align Area -->
		<div class="whole-wrap">
			<div class="container  box_1170">
				<div class="section-top-border">
					<div class="row">
						<div class="col-md-3">
							<img src="assets/img/elements/d.jpg" alt="" class="img-fluid">
						</div>
						<div class="col-md-9 mt-sm-20">
							<h3 class="mb-20">강의 제목</h3>
							<div class="d-flex">
                                <h6 class="mr-10">상태:</h6>
                                <h6>신청가능</h6>
                            </div>
							<div class="d-flex">
                                <h6 class="mr-10">장소:</h6>
                                <h6>내용</h6>
                            </div>
							<div class="d-flex">
                                <h6 class="mr-10">인원:</h6>
                                <h6>현원/총원</h6>
                            </div>
                            <div class="d-flex">
                                <h6 class="mr-10">카테고리:</h6>
                                <h6>내용</h6>
                            </div>
						</div>
					</div>
                </div>
                <div class="d-flex">
                    <a href="#introduce"><h5 style="margin: 10px;">강의 소개</h5></a>
                    <a href="#curriculum"><h5 style="margin: 10px;">교육 과정</h5></a>
                    <a href="#prepared"><h5 style="margin: 10px;">준비물</h5></a>
                    <a href="#caution"><h5 style="margin: 10px;">유의사항</h5></a>
                    <a href="#filename"><h5 style="margin: 10px;">첨부파일</h5></a>
                </div>
				<div class="section-top-border">
					<h4 class="mb-30" id="introduce">강의 소개</h4>
					<div class="row">
						<div class="col-md-8">
							<p>강의 소개 내용</p>
							<h4 class="mb-30 mt-30" id="curriculum">교육 과정</h4>
							<ul class="unordered-list">
								<li>교육 과정1</li>
								<li>교육 과정2</li>
								<li>교육 과정3
									<ul>
										<li>교육 과정3-1
										</li>
										<li>교육 과정3-2
										</li>
									</ul>
								</li>
								<li>교육 과정4
                                </li>
                            </ul>
                            <h4 class="mb-30 mt-30" id="prepared">준비물</h4>
							<p>준비물 내용</p>
							<h4 class="mb-30 mt-30" id="caution">유의사항</h4>
                            <p>유의사항 내용</p>
                            <h4 class="mb-30 mt-30" id="filename">첨부파일</h4>
							<p>첨부파일 내용</p>
						</div>
						<div class="col-md-4" style="border-radius: 8px; border: 1px solid #eee; padding: 20px">
                            <img src="assets/img/elements/g3.jpg" alt="" class="img-fluid">
							<div class="d-flex mt-10">
								<h6 class="mr-10">강사:</h6>
								 <h6>
									<a href="#">이름</a>
								 </h6>
                            </div>
                            <div class="d-flex mt-10">
								<h6 class="mr-10">강사평점:</h6>
								 <h6>
									<a href="#">100</a>
								 </h6>
                            </div>
							<h4 class="mt-30">100,000원</h4>
							<a href="#" class="genric-btn primary-border mt-10">신청</a>
							<a href="#" class="genric-btn primary-border mt-10">찜하기</a>
							<div class="d-flex mt-10">
								<h6 class="mr-10">수강일시:</h6>
								<h6 class="date mr-10">2020/06/30</h6>
								<h6>-</h6>
							</div>
							<div class="mt-10">
								<h6 class="date text-right">2020/07/10</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Align Area -->
        <!-- Want To work 02-->
        <section class="wantToWork-area">
            <div class="container">
                <div class="wants-wrapper w-padding2">
                    <div class="row justify-content-between">
                        <div class="col-xl-8 col-lg-8 col-md-7">
                            <div class="wantToWork-caption wantToWork-caption2">
                                <img src="assets/img/logo/logo2_footer.png" alt="" class="mb-20">
                                <p>Users and submit their own items. You can create different packages and by connecting with your
                                    PayPal or Stripe account charge users for registration to your directory portal.</p>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-5">
                            <div class="footer-social f-right sm-left">
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Want To work End -->
        <!-- Want To work 01-->
        <section class="wantToWork-area">
            <div class="container">
                <div class="wants-wrapper">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-xl-7 col-lg-9 col-md-8">
                            <div class="wantToWork-caption wantToWork-caption2">
                                <div class="main-menu2">
                                    <nav>
                                        <ul>
                                            <li><a href="index.html">Home</a></li>
                                            <li><a href="explore.html">Explore</a></li> 
                                            <li><a href="pages.html">Pages</a></li>
                                            <li><a href="blog.html">Blog</a></li>
                                            <li><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4">
                            <a href="#" class="btn f-right sm-left">Add Listing</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Want To work End -->
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
                                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
      <!-- JS here -->

      <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
      <!-- Jquery, Popper, Bootstrap -->
      <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
      <script src="./assets/js/popper.min.js"></script>
      <script src="./assets/js/bootstrap.min.js"></script>
      <!-- Jquery Mobile Menu -->
      <script src="./assets/js/jquery.slicknav.min.js"></script>

      <!-- Jquery Slick , Owl-Carousel Plugins -->
      <script src="./assets/js/owl.carousel.min.js"></script>
      <script src="./assets/js/slick.min.js"></script>
      <!-- One Page, Animated-HeadLin -->
      <script src="./assets/js/wow.min.js"></script>
      <script src="./assets/js/animated.headline.js"></script>
      <script src="./assets/js/jquery.magnific-popup.js"></script>

      <!-- Date Picker -->
      <script src="./assets/js/gijgo.min.js"></script>
      <!-- Nice-select, sticky -->
      <script src="./assets/js/jquery.nice-select.min.js"></script>
      <script src="./assets/js/jquery.sticky.js"></script>
      
      <!-- counter , waypoint,Hover Direction -->
      <script src="./assets/js/jquery.counterup.min.js"></script>
      <script src="./assets/js/waypoints.min.js"></script>
      <script src="./assets/js/jquery.countdown.min.js"></script>
      <script src="./assets/js/hover-direction-snake.min.js"></script>

      <!-- contact js -->
      <script src="./assets/js/contact.js"></script>
      <script src="./assets/js/jquery.form.js"></script>
      <script src="./assets/js/jquery.validate.min.js"></script>
      <script src="./assets/js/mail-script.js"></script>
      <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
      
      <!-- Jquery Plugins, main Jquery -->	
      <script src="./assets/js/plugins.js"></script>
      <script src="./assets/js/main.js"></script>

     
	</body>
</html>