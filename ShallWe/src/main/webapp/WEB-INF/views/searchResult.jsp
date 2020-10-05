<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="lectureList" value="${requestScope['list']}"/>

<style>
.left_menu {
	float: left;
	width: 30%;
}

.left_menu_result {
	text-align: center;
}
.right_menu { 
	float : center;
	width: 70%;
}

</style>
<!-- script area -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		//right_menu - 검색결과값 출력부
		var $rightAreaObj = $("section.right_menu").find("div.container");
		
		var $formObj = $('form[name=resultList]');
		$formObj.submit(function e ( ) {
			return false;
		});
		
		//검색 입력 left_menu
		var $searchTextObj = $("section.left_menu").find("input#searchText");
		var $searchKeyObj = $("section.left_menu").find("select#searchKey");
		var condition =0;
		var $searchText =" ";
		
		$searchTextObj.focus();
		
		$searchKeyObj.change(function(e) {
			condition = $(this).val();
		});

		var $searchBtnObj = $("form[name='resultList']").find('button#searchBtn');
		$searchBtnObj.click (function ( ) {
			$searchText = $searchTextObj.val();
			var url = '${contextPath}/search?searchKey='+condition+'&searchText='+$searchText ;
			location.href = url;
		}); // end of clickEvent
		
		$('div.category-img a').click(function(){
			$searchText = $(this).attr("id");
			var $searchKey = 3
	        var url = '${contextPath}/search?searchKey='+$searchKey+'&searchText='+$searchText ;
	        location.href = url;
		});
		
		// 강의상세보기
		var lectureDetail = $('div.properties__caption');
		lectureDetail.click(function e () {
			let lecture_code = $(this).find('input[name=lecture_code]').val();
			var url = '${contextPath}/lectures/detail?lecture_id='+lecture_code;
			location.href = url;
		}); 
		
		// 강의찜하기
		var $lectureLike = $('div.heart');
		$lectureLike.on('click', function(e){
			let lecture_code = $(this).find('input[name=lecture_code]').val();
			console.log(lecture_code);
			var url = '${contextPath}/member/wishlist/addWish?lecture_id='+lecture_code;
			if(confirm("찜목록에 추가 하시겠습니까?")){
				$.ajax( { 
					url : '${contextPath}/member/wishlist/addWish'
					, method : "GET"
					, data : {"lecture_id" : lecture_code}
					, success : function () {
						if(confirm("찜목록으로 이동하시겠습니까")){
							location.href = "${contextPath}/member/wishlist";
						} else {
							location.reload();
						}
					}
				}); // end of ajax
			}
		});
	}); // end of 
	
</script>
</head>
<body>
    <!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
    <!-- topbar End -->
	<main>
		<!--? Hero Start -->
		<div class="slider-area2">
			<div
				class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap2 pt-20 text-center">
								<h2>강의 카테고리 검색 결과</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--카테고리 내 검색-->
		<section class="left_menu section-padding">
			<div class="col-lg-10">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<form name= "resultList" class="form-select  mb-100">
							<div>
								<!-- searchKey = {"all", "tutor_name", "lecture_title" , "category" }; -->
								<select class="nice-select" id="searchKey">
									<option value="0" class="option">전체 검색</option>
									<option value="1" class="option">강사 이름</option>
									<option value="2" class="option">강의명</option>
									<option value="3" class="option">카테고리명</option>
								</select>
							</div>
							<div class="form-group">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="카테고리 내 재검색" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Search Keyword'" id="searchText">
								</div>
							</div>
							<button class="btn" id="searchBtn" type="submit"  style="cursor: pointer;">강의검색하기</button>
						</form>
					</aside>
				</div>

				<div class="left_menu_result"></div>
				
				<div class="category-img text-center">
					<a id="IT" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon1.png" alt="IT"></a> 
					<a id="취미" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon2.png" alt="취미"></a>
				</div>
				<div class="category-img text-center">
					<a id="디자인" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon4.png" alt="디자인"></a>
					<a id="사진" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon6.png" alt="사진"></a>
				</div>
				<div class="category-img text-center">
					<a id="음악" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon8.png" alt="음악"></a>
					<a id="스포츠" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon9.png" alt="스포츠"></a>
				</div>
				<div class="category-img text-center">
					<a id="마케팅" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon3.png" alt="마케팅"></a>
					<a id="회계" style="cursor: pointer;">
						<img src="assets/img/gallery/category_icon7.png" alt="회계"></a>
				</div>
			</div>
		</section>

		<!--검색결과 : searchLectureList.jsp   -->
		<section class="right_menu section-padding">
			<div class="container">
			
				<div class="row">
				<c:if test="${lectureList.size() ==  0}" >
					<div class="col">
						<p>조회된 강의가 없습니다! 다시 검색해주세요~</p>
					</div>
				</c:if>
				<!-- single start -->
				<c:forEach items="${lectureList}" var="lecture" varStatus="stats">
					<c:forEach items="resultList.Lecture" var="lec" varStatus="lec_count">
					<div class="col">
						<div class="properties pb-20">
							<div class="properties__card" style="cursor: pointer;">
								<a href="#"><img src="${contextPath}/assets/img/gallery/properties3.png" alt="강의사진"></a><br/><br/>
								<div class="properties__caption">
									<p>${stats.count}</p>
									<h3>
										<label>강의명: </label>
										<a class="lecture_detail" style="cursor: pointer;">${lecture.lecture_title}
											<input type="hidden" name="lecture_code" value="${lecture.lecture_id}"/>
										</a>
									</h3>
									<h4><label>수강기간: </label>
										<fmt:formatDate value="${lecture.lecture_start_dt}" pattern="yyyy-MM-dd"/> ~
										<fmt:formatDate value="${lecture.lecture_end_dt}" pattern="yyyy-MM-dd"/> 
									</h4>
									<h4><label>강사명: </label>${lecture.tutor.tutor_nickname}</h4>
									<c:if test="${lecture.lecture_current eq lecture.lecture_max}" >
										<h4 style="color: red;"><span>정원초과</span></h4>
									</c:if>
									<h4><label>현재인원:</label> ${lecture.lecture_current} <label>/최대인원: </label> ${lecture.lecture_max}</h4>
								</div>
								<div class="properties__footer d-flex justify-content-between align-items-center">
									<h3><fmt:formatNumber value="${lecture.lecture_price}" pattern="#,###원"/></h3>
									<c:if test="${lecture.lecture_current ne lecture.lecture_max}" >
									<div class="heart">
										<img class="shoppingCartImg"  style="cursor: pointer;" src="${contextPath}/assets/img/elements/shopping-cart.png"
											width="30px" alt="강의찜하기" title="강의찜하기">
										<input type="hidden" name="lecture_code" value="${lecture.lecture_id}"/>								
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- single end -->		
					</c:forEach>
				</c:forEach>
			</div>
			</div>
		</section>
	</main>
</body>
</html>