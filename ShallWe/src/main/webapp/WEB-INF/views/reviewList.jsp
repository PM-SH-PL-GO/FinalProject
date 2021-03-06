<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="reviewList" value="${requestScope['list']}"/>
<style>
/* table Css*/ 
table {
  text-align: center;
  margin: 50px auto 0;
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: center;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #3BABE4;
  color: white;
}
td.lecture_id , td.tutor_id, td.lectureCategoryId {
	display:none;
}
</style>

<table> 
	<thead>
		<tr>
			<th>NO</th>
			<th>작성자</th>
			<th>후기내용</th>
			<th>후기등록날짜</th>
		</tr>
	</thead>
   	<colgroup>
   		<col width="5%"></col>
   		<col width="10%"></col>
   		<col width="40%"></col>
   		<col width="20%"></col>
   		<col width="*"></col>
   	</colgroup>
	<tbody>
	<c:if test="${reviewList.size() ==  0}" >
		<tr class="review">
			<td colspan="4"><p>등록된 후기가 없습니다!</p> </td>
		</tr>
	</c:if>
	<c:forEach items="${reviewList}" var="review" varStatus="status">
		<tr class="review">
			<td class="no">${status.count}</td>
			<td class="member_id">${review.member_lecture_history.member.member_id}</td>
			<td class="review_content">${review.review_content}</td>
			<td class="review_dt"><fmt:formatDate value="${review.review_dt}" pattern="yyyy-MM-dd"/></td>
			<td class="lecture_id">${review.member_lecture_history.lecture.lecture_id}</td>
			<td class="tutor_id">${review.member_lecture_history.lecture.tutor.member.member_id}</td>
			<td class="lectureCategoryId">${review.member_lecture_history.lecture.lectureCategory.lecture_category_id}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>