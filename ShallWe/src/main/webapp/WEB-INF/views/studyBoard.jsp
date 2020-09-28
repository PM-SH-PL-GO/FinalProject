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
					boardPageData += "	<td>"+studyBoard.member.member_id+"/"+nameMasking(studyBoard.member.member_name)+"</td>";
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
	
	//----------스터디 게시판 페이징 CLICK  START---------	
	$pageList.on("click","li>a", function(e){
		var $etClass = $(e.target).attr('class');
		var $searchVal = $(this).parents('.pagination-area').siblings('.row').find('#searchBar').val();
		var urlVal = null;
		
		console.log("나와라"+$searchVal);
		if($etClass == 'prev'){
			page = ${pb.startPage-1};			
		}else if($etClass == 'next'){
			page = ${endPage+1};
		}else{
			page = $(e.target).html();
		}
		
		if($searchVal==null ||  $searchVal==""){
			urlVal = "/shallwe/board/list/"+page;
		}else{
			urlVal = "/shallwe/board/search/"+$searchVal+"/"+page;
		}
		$.ajax({
				url:urlVal
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
						boardPageData += "	<td>"+studyBoard.member.member_id+"/"+nameMasking(studyBoard.member.member_name)+"</td>";
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
	});
	//----------스터디 게시판 페이징 CLICK  END---------	
	
	//----------스터디 게시판 검색 button CLICK  START---------		
	$("button#search-btn").click(function(){
		$searchVal = $("#searchBar").val()
		var page = 1;
		console.log("/shallwe/board/serach/"+$searchVal+"/"+page);
		if($searchVal== null || $searchVal== ""){
			location.href = "/shallwe/studyBoard";
		}
		$.ajax({
			url:"/shallwe/board/search/"+$searchVal+"/"+page
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
					boardPageData += "	<td>"+studyBoard.member.member_id+"/"+nameMasking(studyBoard.member.member_name)+"</td>";
					boardPageData += "	<td>"+formatDate(studyBoard.studyBoard_write_dt)+"</td>";
					boardPageData += "	<td>"+studyBoard.studyBoard_view_count+"</td>";
					boardPageData += "</tr>"
				});
				$boardPage.empty();
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

	$("#boardWrite").click(function(){
		location.href="/shallwe/board/write"
	});
});


function formatDate(date) { 
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
	if (month.length < 2) month = '0' + month; if (day.length < 2) day = '0' + day; 
	return [year, month, day].join('-'); 
}

function nameMasking(str){
	var originStr = str;
	var maskingStr;
	var strLength;
	
	if(originStr==null){
		return originStr;
	}
	
	strLength = originStr.length;
	
	if(strLength < 3){ 
		maskingStr = originStr.replace(/(?<=.{1})./gi, "*"); 
	}else {
		maskingStr = originStr.replace(/(?<=.{2})./gi, "*"); 
	}
	return maskingStr;

}


</script>
</head>
<body>
		<!-- topbar Start -->
		<div class="topMenu">
			<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
		</div>
	<main>
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
							<a class="button button-write f-right" id="boardWrite">글쓰기</a>
							
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
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>