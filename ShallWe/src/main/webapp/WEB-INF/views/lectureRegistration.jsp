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
            <div class="container box_1170">
                <div class="section-top-border">
                    <h3 class="mb-30">강의 등록</h3>
                    <div class="row">
                        <div class="col-md-12 mt-sm-20">
                            <form action="#">
                                <img src="assets/img/elements/d.jpg" alt="" class="img-fluid d-block">
                                <a href="#" class="genric-btn primary-border mt-10">사진 등록</a>
                                <h6 class="mt-10">강의 제목</h6>
                                <div class="mt-10">
                                    <input type="text" name="first_name" placeholder="몇글자 이내"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '몇글자 이내'" required
                                        class="single-input">
                                </div>
                                <h6 class="mt-10">카테고리</h6>
                                <div class="form-select col-md-3 mt-10" id="default-select">
                                    <select>
                                        <option value="1">IT</option>
                                        <option value="1">요리</option>
                                    </select>
                                </div>
                                <h6 class="mt-10">강의 소개</h6>
                                <div class="mt-10">
                                    <textarea class="single-textarea" style="height: 300px;" placeholder="몇글자 이내"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '몇글자 이내'"
                                        required></textarea>
                                </div>
                                <h6 class="mt-10">교육 과정</h6>
                                <div class="mt-10">
                                    <textarea class="single-textarea" style="height: 300px;" placeholder="몇글자 이내"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '몇글자 이내'"
                                        required></textarea>
                                </div>
                                <h6 class="mt-10">강의 장소</h6>
                                <div class="input-group-icon d-flex mt-10">
                                    <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                                    <div class="form-select col-md-3" id="default-select">
                                        <select>
                                            <option value="1">서울</option>
                                            <option value="1">경기도</option>
                                        </select>
                                    </div>
                                    <div class="form-select col-md-3" id="default-select">
                                        <select>
                                            <option value="1">강남구</option>
                                            <option value="1">강동구</option>
                                            <option value="1">안양</option>
                                        </select>
                                    </div>
                                    <input type="text" name="first_name" placeholder="세부주소"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '세부주소'" required
                                        class="single-input col-md-6">
                                </div>
                                <h6 class="mt-10">강의 날짜</h6>
                                <div class="d-flex mt-10">
                                    <div class="d-block">
                                        <h6 class="mt-10 col-md-5">시작일</h6>
                                        <input type="date" name="first_date" class="single-input">
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="d-block">
                                        <h6 class="mt-10 col-md-5">종료일</h6>
                                        <input type="date" name="last_date" class="single-input">
                                    </div>
                                </div>
                                <h6 class="mt-10">인원</h6>
                                <div class="d-flex mt-10">
                                    <input type="text" name="first_name" placeholder="최소"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '최소'" required
                                        class="single-input col-md-1 mr-10">
                                    <input type="text" name="first_name" placeholder="최대"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '최대'" required
                                        class="single-input col-md-1">
                                </div>
                                <h6 class="mt-10">준비물</h6>
                                <div class="mt-10">
                                    <input type="text" name="first_name" placeholder="몇글자 이내"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '몇글자 이내'" required
                                        class="single-input-primary">
                                </div>
                                <h6 class="mt-10">유의사항</h6>
                                <div class="mt-10">
                                    <input type="text" name="first_name" placeholder="몇글자 이내"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '몇글자 이내'" required
                                        class="single-input-accent">
                                </div>
                                <h6 class="mt-10">금액</h6>
                                <div class="mt-10 d-flex">
                                    <input type="text" name="first_name" placeholder="10000"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '10000'" required
                                        class="single-input-accent col-md-2">
                                    <h5 class="mt-10">원</h5>
                                </div>
                                <a href="#" class="genric-btn primary-border mt-10">첨부파일등록</a>
                                <div class="mt-70">
                                    <a href="#" class="genric-btn primary-border">등록</a>
                                    <a href="#" class="genric-btn primary-border">수정</a>
                                </div>
                            </form>
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
                                <p>Users and submit their own items. You can create different packages and by connecting
                                    with your
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
                                    <p>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;
                                        <script>document.write(new Date().getFullYear());</script> All rights reserved |
                                        This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
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