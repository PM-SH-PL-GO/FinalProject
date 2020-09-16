<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DirectoryListing</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="/shallwe/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/slicknav.css">
    <link rel="stylesheet" href="/shallwe/assets/css/flaticon.css">
    <link rel="stylesheet" href="/shallwe/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="/shallwe/assets/css/gijgo.css">
    <link rel="stylesheet" href="/shallwe/assets/css/animate.min.css">
    <link rel="stylesheet" href="/shallwe/assets/css/animated-headline.css">
	<link rel="stylesheet" href="/shallwe/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="/shallwe/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
	<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
	<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
	<link rel="stylesheet" href="/shallwe/assets/css/style.css">
</head>
<body>
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="index.html"><img src="/shallwe/assets/img/logo/logo.png" alt=""></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="listing.html">Catagories</a></li> 
                                    <li><a href="#">Pages</a>
                                        <ul class="submenu">
                                            <li><a href="/shallwe/assets/directory_details.html">listing Details</a></li>
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
  <!-- top bar-->
    <div class="slider-area hero-bg2 hero-overly">
        <div class="single-slider hero-overly topbar-height d-flex align-items-center">
        </div>
    </div>

	<!--ê¸ ëª©ë¡ Start -->
  <div class="listing-area pt-120 pb-120">
    <div class="container">
        <div class="row">
        
		
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-algin:center">번호</th>
						<th style="background-color: #eeeeee; text-algin:center">제목</th>
						<th style="background-color: #eeeeee; text-algin:center">작성자</th>
						<th style="background-color: #eeeeee; text-algin:center">작성일</th>
						<th style="background-color: #eeeeee; text-algin:center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>3</td>
						<td>안녕하시오</td>
						<td>고길동</td>
						<td>2020-09-10</td>
						<td>38</td>
					</tr>
					<tr>
						<td>2</td>
						<td>우린 고씨가문의</td>
						<td>고준식</td>
						<td>2020-08-29</td>
						<td>1032</td>
					</tr>
					<tr>
						<td>1</td>
						<td>영광이올시다</td>
						<td>고수정</td>
						<td>2020-05-05</td>
						<td>348</td>
					</tr>
				</tbody>
			</table>
			
			<div class="freeboard_related_search">
				<aside class="serach_form search_btn">
						<input type="text" class= "searchbar" placeholder='키워드를 입력하세요...' onfocus="this.placeholder=''" onblur="this.placeholder='키워드를 입력하세요...''">
                    <div class="input-group-append">
                        	<button class="btns" type="button"><i class="ti-search"></i></button>
					</div>
				</aside>
			</div>
			</div>
<!-- 			<button type="submit" class="button-write">검색</button> -->
			<div class="col-xl-12">
			<a href="board_write.jsp" class="button button-write f-right">글쓰기</a>
			</div>
	</div>
	</div>
	<!--Paging Start  -->
                <div class="pagination-area text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="single-wrap d-flex justify-content-center">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-start " id="myDIV">
                                            <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-left"></span></a></li>
                                            <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                            <li class="page-item"><a class="page-link" href="#">02</a></li>
                                            <li class="page-item"><a class="page-link" href="#">03</a></li>
                                            <li class="page-item"><a class="page-link" href="#">04</a></li>
                                            <li class="page-item"><a class="page-link" href="#">05</a></li>
                                            <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	<!--Pagning End  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
         	   </div>
        </div>
  
    <!--? Want To work 02-->
    <section class="wantToWork-area">
        <div class="container">
            <div class="wants-wrapper w-padding2">
                <div class="row justify-content-between">
                    <div class="col-xl-8 col-lg-8 col-md-7">
                        <div class="wantToWork-caption wantToWork-caption2">
                            <img src="/shallwe/assets/img/logo/logo2_footer.png" alt="" class="mb-20">
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
    <!--? Want To work 01-->
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