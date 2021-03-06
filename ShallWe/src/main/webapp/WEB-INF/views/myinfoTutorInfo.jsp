<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shallwe-강사정보보기</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/gijgo.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/animated-headline.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/slick.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/style.css">
	 <script
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"></script>
	<link href="${contextPath}/assets/css/myinfoTutorInfo.css" />
<script type="text/javascript" src="${contextPath}/js/myinfoTutorInfo.js">
</script>
</head>
<body class="myinfobody">
    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/shallwe/assets/img/logo/loder.png" alt="">
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
   


  <!-- myinfo Area Start -->
  <div class="listing-area pt-70 pb-70"> 
    <div class="container">
            <!--?  Right content -->
            <div class="col-xl-12 col-lg-12 col-md-6">
                <div class="row">
                 <div id="frame2" style="width:100%;">
				<span style="font-size: 16pt; font-weight: bold;">내정보</span>
				<span class="home" style="float:right;"> 내정보 > 내정보보기</span>
				</div>
                    <div class="col-lg-12">
                        <div class="count mb-35">
                        </div>
                    </div>
                </div>
                <!--? Popular Directory Start -->
                <div class="kopular-directorya-area fix">

<!--                 <div class="myinfo top-left"> -->
<!--                 </div> -->
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- Single -->
                                <div class="properties properties2 mb-30">
                                    <div class="properties__card">
                                            <table class="type1">
											<tr><th>이름 :</th><td>꽁병지</td></tr>                                            
											<tr><th>닉네임 :</th><td>꽁병지TV</td></tr>                                            
											<tr><th>이메일 :</th><td>ggong@gmail.com</td></tr>                                            
											<tr><th>H.P :</th><td>010-1223-1234</td></tr>                                            
											<tr><th>관심분야 :</th><td>IT</td><td>스포츠</td></tr>                                            
                                            </table>
                                    <div class="btn_center">
                                    	<a href="${contextPath }/myinfoModi" class="infobutton">내 정보 수정</a>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <!-- Single -->
                                <div class="properties properties2 mb-30">
                                    <div class="properties__card">
                                            <h3><a href="#">Urban areas</a></h3>
                                            <p>Let's uncover the best places to eat, drink</p>
                                            <button id="acceptBtn" type="submit" value="tutor_id">Accept</button>
                                    </div>
                                </div>
                            </div>
                             <div class="col-lg-6">
                                <!-- Single -->
                                <div class="properties properties2 mb-30">
                                    <div class="properties__card">
                                            <h3 style="text-align :center">최근 학습중인 강의들</h3>
											<ul class="abblecture">
											 <li><a href="#">닭가슴살 조리법</a></li>
											 <li><a href="#">헬창이 되는 빠른방법</a></li>
											 <li><a href="#">가짜사나이3</a></li>
		                                    </ul>
                                    </div>
                                </div>
                            </div>
                             <div class="col-lg-6">
                                <!-- Single -->
                                <div class="properties properties2 mb-30">
                                    <div class="properties__card">
                                            <h3><a href="#">Urban areas</a></h3>
                                            <p>Let's uncover the best places to eat, drink</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <!--? Popular Directory End -->
            </div>
        </div>
    </div>
<!-- myinfo-area Area End -->



    </main>
    <footer>
        <div class="footer-wrapper pt-20">
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