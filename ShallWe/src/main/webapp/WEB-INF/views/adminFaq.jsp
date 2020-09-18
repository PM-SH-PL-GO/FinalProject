<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<tr>
		<th>번호</th>
		<th>질문</th>
		<th>답변</th>
		<th>관리</th>
		<th>삭제</th>
	</tr>
	<c:forEach items="${faqList }" var="faq">
		<tr>
			<td>${faq.faq_id }</td>
			<td>${faq.faq_question }</td>
			<td>${faq.faq_answer }</td>
			<td><button class="faq_change">관리하기</button></td>
			<td><button class="faq_delete">삭제하기</button></td>
		</tr>
	</c:forEach>
</table>