<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="myInfo" value="${requestScope['myInfo']}"/>
<c:set var="lectureList" value="${requestScope['lectureList']}"/>

<!doctype html>
<!-- <html class="no-js" lang="zxx"> -->
<head>
<!--     <meta charset="utf-8"> -->
<!--     <meta http-equiv="x-ua-compatible" content="ie=edge"> -->
<!--     <title>DirectoryListing</title> -->
<!--     <meta name="description" content=""> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <link rel="manifest" href="site.webmanifest"> -->
<!--     <link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico"> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	
<!-- 	<!-- CSS here -->
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css"> --%>
<%--     <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css"> --%>
<%--     <link rel="stylesheet" href="${contextPath}/assets/css/progressbar_barfiller.css"> --%>
<%--     <link rel="stylesheet" href="${contextPath}/assets/css/gijgo.css"> --%>
<%--     <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css"> --%>
<%--     <link rel="stylesheet" href="${contextPath}/assets/css/animated-headline.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/slick.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css"> --%>
<%-- 	<link rel="stylesheet" href="${contextPath}/assets/css/style.css"> --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	// 내가 수강하고 있는 강의 목록보기 
	var bodyObj = $('.myinfobody');
	$.ajax({ 
		url : '${contextPath}/lectures/myinfoLectureList'
		, method : "GET"
		, success : function (responseData) {
			console.log(responseData);
// 			bodyObj.append(responseData);
		}
	}); // end of ajax

	// 내정보 수정하기 버튼 클릭 이벤트
	var $myinfoModiBtnObj = $('#myinfoModi');
	$myinfoModiBtnObj.on('click', function (e) {
		let url = "${contextPath}/myinfoModi";
		if ( confirm("내 정보를 수정하시겠습니까?") ) {
			location.href=url;
		}
	}); // end of 내강의 수정 event
	
	
	
}); // end of load();
</script>
</head>
<body class="myinfobody">
    <!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
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
											<tr><th><label>이름 :</label></th><td>${myInfo.memberName}</td></tr>                                            
											<tr><th><label>이메일 :</label></th><td>${myInfo.memberEmail}</td></tr>                                            
											<tr><th><label>H.P :</label></th><td>${myInfo.memberPhone}</td></tr>                                            
											<tr><th><label>관심분야1 :</label></th><td>${myInfo.favorite1.lecture_category_name}</td></tr>                                            
											<tr><th><label>관심분야2 :</label></th><td>${myInfo.favorite2.lecture_category_name}</td></tr>                                            
											<tr><th><label>관심분야3 :</label></th><td>${myInfo.favorite3.lecture_category_name}</td></tr>                                            
                                            </table>
                                    <div class="btn_center">
                                    	<a id="myinfoModi" class="infobutton">내 정보 수정</a>
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
                                    </div>
                                </div>
                            </div>
                             <div class="col-lg-6">
                                <!-- Single -->
                                <div class="properties properties2 mb-30">
                                    <div class="properties__card">
                                            <h3 style="text-align :center">최근 학습중인 강의들</h3>
											<!-- <ul class="abblecture"> -->
											<c:forEach items="${lectureList}" var="lecture" varStatus="status">
												<tr class="lecture">
													<td class="no">${status.count}</td>
													<td class="lecture_id">${lecture.lecture_id}</td>
													<td class="lecture_title">${lecture.lecture_title}</td>
													<td class="lecture_start_dt"><fmt:formatDate value="${lecture.lecture_start_dt}" pattern="yyyy-MM-dd"/></td>
													<td class="lecture_end_dt"><fmt:formatDate value="${lecture.lecture_end_dt}" pattern="yyyy-MM-dd"/></td>
													<td class="lectureCategoryId">${review.member_lecture_history.lecture.lectureCategory.lecture_category_id}</td>
												</tr>
											</c:forEach>


											<!-- </ul> -->
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
    </body>
</html>