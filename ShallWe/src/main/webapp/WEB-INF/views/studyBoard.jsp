<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<style>
th {
	background-color: #eeeeee; text-algin: center
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$.ajax({
		url:"/shallwe/board/list/1"
		,method:"get"
		,success:function(pbObj){
		var $boardPage=$("table.table");
		var cunrrentPage = pbObj.currentPage;
		var totalPage = pbObj.totalPage;
		var boardPageData ="";
			boardPageData += "<thead>";
			boardPageData += "<tr>"
			boardPageData += "<th>번호</th>"
			boardPageData += "<th>제목</th>"
			boardPageData += "<th>작성자</th>"
			boardPageData += "<th>작성일</th>"
			boardPageData += "<th>조회수</th>"
			boardPageData += "</tr>"
			boardPageData += "</thead>"
			boardPageData += "<tbody>"
				var arr = pbObj.list;
				arr.forEach(function(studyBoard, index){
					boardPageData += "<tr>"
					boardPageData += "	<td>"+studyBoard.studyBoard_id+"</td>";
					boardPageData += "	<td>"+studyBoard.studyBoard_title+"</td>";
					boardPageData += "	<td>"+studyBoard.study_m.member_name+"</td>";
					boardPageData += "	<td>"+formatDate(studyBoard.studyBoard_write_dt)+"</td>";
					boardPageData += "	<td>"+studyBoard.studyBoard_view_count+"</td>";
					boardPageData += "</tr>"
				});
			boardPageData += "</tbody>"
			$boardPage.html(boardPageData);
		}
		,errer:function(xhr){
			alert("실패" + xhr.status)
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
	<main>
		<!-- topbar Start -->
		<div class="topMenu">
			<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
		</div>
		<!-- topbar End -->
		<!--게시판 Start -->
		<div class="listing-area pt-150">
			<div class="container">
				<div class="row">
					<div class="container">
						<div class="row">
							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								
							</table>

							<div class="freeboard_related_search">
								<aside class="serach_form search_btn">
									<input type="text" class="searchbar"
										placeholder='키워드를 입력하세요...' onfocus="this.placeholder=''"
										onblur="this.placeholder='키워드를 입력하세요...''">
									<div class="input-group-append">
										<button class="btns" type="button">
											<i class="ti-search"></i>
										</button>
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
											<li class="page-item"><a class="page-link" href="#"><span
													class="ti-angle-left"></span></a></li>
											<li class="page-item active"><a class="page-link"
												href="#">01</a></li>
											<li class="page-item"><a class="page-link" href="#">02</a></li>
											<li class="page-item"><a class="page-link" href="#">03</a></li>
											<li class="page-item"><a class="page-link" href="#">04</a></li>
											<li class="page-item"><a class="page-link" href="#">05</a></li>
											<li class="page-item"><a class="page-link" href="#"><span
													class="ti-angle-right"></span></a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Pagning End  -->
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