<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
       <div class="topMenu">
       		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
       </div>
    </header>
    <main>
  <div class="listing-area pt-120 pb-120">
    <div class="container">
        <div class="row">
        	<div class="box-header with-border">
        	<h3 class="box-title">게시글 목록</h3>
			</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-algin:center; width:50px">번호</th>
						<th style="background-color: #eeeeee; text-algin:center;">제목</th>
						<th style="background-color: #eeeeee; text-algin:center; width:100px">작성자</th>
						<th style="background-color: #eeeeee; text-algin:center; width:150px">작성일</th>
						<th style="background-color: #eeeeee; text-algin:center; width:75px">조회수</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${freeboard}" var="freelist">
					<tr>
						<td>${freelist.freeboard_id}</td>
						<td><a style="color:black" href="${path}/board/read?freeboard_id=${freelist.freeboard_id}">${freelist.freeboard_title}</a></td>
						<td>${freelist.member.member_id}</td>
						<td><fmt:formatDate value="${freelist.freeboard_write_dt}" pattern="yyyy-MM-dd"/></td>
						<td><span class="badge bg-red">${freelist.freeboard_view_count}</span></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
			<div class="freeboard_related_search">
				<aside class="serach_form search_btn">
						<input type="text" class= "searchbar" placeholder='키워드를 입력하세요...' onfocus="this.placeholder=''" onblur="this.placeholder='키워드를 입력하세요...''">
                    <div class="input-group-append">
                        	<button class="btns" type="button"><i class="ti-search"></i></button>
					</div>
				</aside>
			</div>
<!-- 			<button type="submit" class="button-write">검색</button> -->
			<div class="box-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-success btn-flat" id="writeBtn">
						<i class="fa fa-write"></i>글쓰기
					</button>
				</div>
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
	
	<script>
	var result ="${msg}";
	if(result=="registrySuccess"){
		alert("게시글 등록이 완료되었습니다.");
	}else if(result == "modifySuccess"){
		alert("게시글 수정이 완료되었습니다.");	
	}else if(result == "deleteSuccess"){
		alert("게시글 삭제가 완료되었습니다");
	}
	
	</script>
	
    </body>
</html>