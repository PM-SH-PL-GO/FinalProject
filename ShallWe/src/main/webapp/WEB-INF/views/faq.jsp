<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shallwe-함께 배우는 교육공간</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="/shallwe/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="/shallwe/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/slicknav.css">
<link rel="stylesheet" href="/shallwe/assets/css/flaticon.css">
<link rel="stylesheet"
	href="/shallwe/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="/shallwe/assets/css/gijgo.css">
<link rel="stylesheet" href="/shallwe/assets/css/animate.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/animated-headline.css">
<link rel="stylesheet" href="/shallwe/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="/shallwe/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/shallwe/assets/css/themify-icons.css">
<link rel="stylesheet" href="/shallwe/assets/css/slick.css">
<link rel="stylesheet" href="/shallwe/assets/css/nice-select.css">
<link rel="stylesheet" href="/shallwe/assets/css/style.css">

<!-- faq용 css 추가 -->
<link rel="stylesheet" href="/shallwe/assets/css/faq.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
//----------FAQ LOAD START---------
	/** 초기화 처리*/
	// 첫 번재 항목이 펼쳐져 있도록 처리
	$(".collapsible:eq(0) a").addClass("selected"); //첫번째 항목만 selected 클래스를 적용
	$(".collapsible").not(":eq(0)").find(".content").hide(); //첫번째 항목 이외의 content를 숨김

	/** 링크에 대한 클릭 이벤트 처리 */
	$(".collapsible .title a").click( function () {
		
		$(this).toggleClass("selected");
		//클릭된 나 자신을 제외한 나머리 링크들은 slected 클래스를 무조건 제거
		$(".collapsible .title a").not(this).removeClass(
				"selected");

		// 펼칠 내용 영역 선택
		var target = $(this).parents(".collapsible").find(
				".content");

		// 나머지 내용 영역을 선택
		var other = $(".collapsible .title a").not(this)
				.parents(".collapsible").find(".content");

		// 애니메이션으로 열고 닫기 처리
		target.slideToggle(300);
		other.slideUp(300);

		// 링크 페이지 이동 중지
		return false;
	});
	//----------FAQ LOAD END---------
});
</script>
</head>
<body>
	<main>
		<ul class="faq_ul">
			<c:forEach items="${faqList}" var="fl" varStatus="stats" >
				<li class="collapsible">
					<h2 class="title">
						<a>faq.${fl.faq_question}</a>
					</h2>
					<p class="content">faq.${fl.faq_answer}</p>
				</li>
			</c:forEach>
		</ul>
	</main>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>