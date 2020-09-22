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
tr td.boardTitle:hover {
    color: #00DBD5;
    cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	var page ="1";
	var $pageList=$("#pageList");
	
	//----------스터디 게시판 LOAD START---------
	$.ajax({
		url:"/shallwe/board/list/"+page
		,method:"get"
		,success:function(pbObj){
		var $boardPage=$("#tbody");
		var cunrrentPage = pbObj.currentPage;
		var totalPage = pbObj.totalPage;
		var boardPageData ="";
				var arr = pbObj.list;
				arr.forEach(function(studyBoard, index){
					boardPageData += "<tr>"
					boardPageData += "	<td class=\"boardId\">"+studyBoard.studyBoard_id+"</td>";
					boardPageData += "	<td class=\"boardTitle\">"+studyBoard.studyBoard_title+"</td>";
					boardPageData += "	<td>"+studyBoard.member.member_name+"</td>";
					boardPageData += "	<td>"+formatDate(studyBoard.studyBoard_write_dt)+"</td>";
					boardPageData += "	<td>"+studyBoard.studyBoard_view_count+"</td>";
					boardPageData += "</tr>"
				});
			$boardPage.html(boardPageData);
			var $pageList = $("#pageList");
			var pageListData = "";
			if(pbObj.startPage > 1){
				pageListData += '<li class="page-item"><a class="prev"><span class="ti-angle-left"></span></a></li>';
			}
			
			for(var i=pbObj.startPage; i<=pbObj.totalPage; i++){
				pageListData += '<li class="page-item active"><a class="page-link">'+i+'</a></li>';
			}
			if(pbObj.endPage < pbObj.totalPage){
				pageListData += '<li class="page-item"><a class="next"><span class="ti-angle-right"></span></a></li>'
			}
			
			$pageList.html(pageListData);
		}
		,errer:function(xhr){
			alert("실패" + xhr.status)
		}
	});
	//----------스터디 게시판 LOAD  END---------
	
	//----------스터디 게시판 페이지 CLICK  START---------	
	$pageList.on("click","li>a", function(e){
		var $etClass = $(e.target).attr('class');
		if($etClass == 'prev'){
			page = ${pb.startPage-1};			
		}else if($etClass == 'next'){
			page = ${endPage+1};
		}else{
			page = $(e.target).html();
		}
		$.ajax({
			url:"/shallwe/board/list/"+page
			,method:"get"
			,success:function(pbObj){
			var $boardPage=$("#tbody");
			var cunrrentPage = pbObj.currentPage;
			var totalPage = pbObj.totalPage;
			var boardPageData ="";
					var arr = pbObj.list;
					arr.forEach(function(studyBoard, index){
						boardPageData += "<tr>"
						boardPageData += "	<td class=\"boardId\">"+studyBoard.studyBoard_id+"</td>";
						boardPageData += "	<td class=\"boardTitle\">"+studyBoard.studyBoard_title+"</td>";
						boardPageData += "	<td>"+studyBoard.member.member_name+"</td>";
						boardPageData += "	<td>"+formatDate(studyBoard.studyBoard_write_dt)+"</td>";
						boardPageData += "	<td>"+studyBoard.studyBoard_view_count+"</td>";
						boardPageData += "</tr>"
					});
				$boardPage.html(boardPageData);
			}
			,errer:function(xhr){
				alert("실패" + xhr.status)
			}
		});
	});
	//----------스터디 게시판 페이지 CLICK  END---------	
	
	//----------스터디 게시판 검색 button CLICK  START---------		
	$("button#search-btn").click(function(){
		$searchVal = $("#searchBar").val()
		if($searchVal== null || $searchVal== ""){
			location.href = "/shallwe/studyBoard";
		}
		$.ajax({
			url:"/shallwe/board/search/" + $searchVal
			,method:"get"
			,success:function(pbObj){
				var $boardPage=$("#tbody");
				var cunrrentPage = pbObj.currentPage;
				var totalPage = pbObj.totalPage;
				var boardPageData ="";
				var arr = pbObj.list;
				arr.forEach(function(studyBoard, index){
					boardPageData += "<tr>"
					boardPageData += "	<td class=\"boardId\">"+studyBoard.studyBoard_id+"</td>";
					boardPageData += "	<td class=\"boardTitle\">"+studyBoard.studyBoard_title+"</td>";
					boardPageData += "	<td>"+studyBoard.member.member_name+"</td>";
					boardPageData += "	<td>"+formatDate(studyBoard.studyBoard_write_dt)+"</td>";
					boardPageData += "	<td>"+studyBoard.studyBoard_view_count+"</td>";
					boardPageData += "</tr>"
				});
				$boardPage.empty();
				$boardPage.html(boardPageData);		
				
			}
			,  error:function(request,status,error){
	            alert("해당하는 게시글이 존재하지 않습니다.");
	         }

		});
	});
	//----------스터디 게시판 검색 button CLICK  END---------	
	
	//----------스터디 게시판 검색 ENTER  START---------	
	$("#searchBar").keydown(function(e) {

		if (e.keyCode == 13) {
			$("button#search-btn").trigger("click");
		}

	});	
	//----------스터디 게시판 검색 ENTER  END---------	
	
	//--------- 게시글 CLICK  START---------		
	$("tbody#tbody").on("click","td.boardTitle",function(){
		var $boardIdVal = $(this).siblings('td.boardId').html();
		location.href="/shallwe/board/detail/"+$boardIdVal;
	});
	//--------- 게시글 CLICK  START---------		

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
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody id="tbody">
								</tbody>
							</table>
							<div class="freeboard_related_search" style="">
								<aside class="serach_form search_btn">
									<input type="text" class="searchbar" id="searchBar" placeholder='키워드를 입력하세요...' onfocus="this.placeholder=''" onblur='this.placeholder="키워드를 입력하세요..."'>
										
										
									<div class="input-group-append">
										<button class="btns" id="search-btn" type="button">
											<i class="ti-search"></i>
										</button>
									</div>
								</aside>
							</div>
						</div>
						<!-- 			<button type="submit" class="button-write">검색</button> -->
						<div class="col-xl-12">
							<a class="button button-write f-right">글쓰기</a>
							
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
										<ul class="pagination justify-content-start " id="pageList">
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
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