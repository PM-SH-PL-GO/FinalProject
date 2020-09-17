<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shallwe-함께 배우는 교육공간</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
<!--     <link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico"> -->

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
<style>
.menu-wrapper
{float:left;}
/* .header-btns */
/* {margin-left: 410px} */
.mr-40
{margin-left: 20px}
.mr-40
{text-align: center;}
.header-btns a i
{vertical-align: bottom;}
.header-area .menu-wrapper .main-menu ul li a i
{font-size: 50px}
.header-area{
    box-shadow: 0 2px 4px 0 hsla(0,0%,80.8%,.5);
    min-height: unset;
    background-color: white;
}
.btn{
background : #00dbd5;
}
.btn::before {
	background: #009994;
}

</style>
<script type="text/javascript">










</script>
</head>
<body>
    <header>
        <!-- topbar Start -->
<div class="topMenu">
	<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
</div>
        <!-- topbar End -->
    </header>
    <main>
        <!--메인 슬라이드 시작-->
        <div class="slider-area hero-bg1 hero-overly main">
            <div class="single-slider hero-overly  slider-height1 d-flex align-items-center">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-xl-10 col-lg-100">
	                            <!-- Hero Caption -->
	                            <div class="hero__caption pt-10">
	                                <h1>배우고, 나누고, 성장하세요</h1>
	                                <p>다양한 분야의 강사를 만나보세요!</p>
	                            </div>
	                            <!--Hero form -->
	                            <form action="#" class="search-box mb-100">
	                                <div class="select-form">
	                                    <div class="select-itms">
	                                        <select name="select" id="select1">
	                                            <option value="">검색조건</option>
	                                            <option value="">전체 검색</option>
	                                            <option value="">지역 검색</option>
	                                            <option value="">강사 이름</option>
	                                            <option value="">강의명</option>
	                                            <option value="">카테고리 검색</option>
	                                        </select>
	                                    </div>
	                                </div>
	                                <div class="input-form">
	                                    <input type="text" placeholder="검색어를 입력하세요">
	                                </div>
	                                <div class="search-form">
	                                    <a href="#"><i class="ti-search"></i> 검색</a>
	                                </div>	
	                            </form>	
	                            
	                            <!-- hero category1 img -->
	                            <div class="category-img text-center">
	                                <a href="#"> <img src="assets/img/gallery/category_icon1.png" alt=""></a>
	                                <a href="#"> <img src="assets/img/gallery/category_icon2.png" alt=""></a>
	                                <a href="#"> <img src="assets/img/gallery/category_icon3.png" alt=""></a>
	                                <a href="#"> <img src="assets/img/gallery/category_icon4.png" alt=""></a>
<!-- 	                                <a href="#"> <img src="assets/img/gallery/category_icon5.png" alt=""></a> -->
	                            </div>
	                            <div class="category-img text-center">
	                                <a href="#"> <img src="assets/img/gallery/category_icon6.png" alt=""></a>
	                                <a href="#"> <img src="assets/img/gallery/category_icon7.png" alt=""></a>
	                                <a href="#"> <img src="assets/img/gallery/category_icon8.png" alt=""></a>
	                                <a href="#"> <img src="assets/img/gallery/category_icon9.png" alt=""></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
            </div>
        </div> 
        </main>
<!--  메인 헤더쪽 사진, 검색 , 카테고리 포함 end -->

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