<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Simple Accordion with jQuery Example</title>
<link rel="stylesheet" href="/shallwe/assets/css/faq1.css">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background: #eee;
	line-height: 1.5;
}

main {
	max-width: 620px;
	margin: 10px auto;
}
</style>
</head>
<body>
	<main>
		<!-- topbar Start -->
		<div class="topMenu">
			<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
		</div>
		<div class="listing-area pt-150">
		<c:forEach items="${faqList}" var="fl" varStatus="stats" >
			<div class="container">
				<div class="accordion">
					<div class="accordion__item">
						<div class="accordion__item__header">${fl.faq_question}</div>
						<div class="accordion__item__content">
							<p>${fl.faq_answer}
							</p>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</main>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/shallwe/assets/js/accordion.js"></script>
</body>
</html>