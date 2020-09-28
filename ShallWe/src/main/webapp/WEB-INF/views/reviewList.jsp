<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="reviewList" value="${requestScope['list']}"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	$('tr.review').on('click', function (e) {
		var tdObj = $(this).find('td');
		var reviewArrObj = new Array();
		tdObj.each(function(i){
			reviewArrObj.push(tdObj.eq(i).text());
			console.log(reviewArrObj[i]);
	    });
		
		var lecture_category_id =reviewArrObj[3] ;
		var member_id =reviewArrObj[1] ;
		var lecture_id = reviewArrObj[4];
		var tutor_id = reviewArrObj[5];
		
		$.ajax({
			url: "/shallwe/removeReview"
			, method : 'POST'
			, data : {"lectureCategoryId" : lecture_category_id
						, "member_id" : member_id
						, "lecture_id" : lecture_id
						, "tutor_id" : tutor_id}
			, success : function ( responseData ) {
				if (responseData.status == 'success' ) {
					alert("삭제성공");
				} else {
					alert("삭제실패");
				}
			}
		}); // end of ajax
	});
	
	
	
}); // end of script
</script>

<h1> 강사별 , 카테고리별  후기 목록 테스트 페이지 입니다. </h1>
<table> 
	<c:if test="${reviewList.size() ==  0}" >
		<p>조회된 후기가 없습니다! 다시 검색해주세요~</p>
	</c:if>
	<c:if test="${reviewList.size() >  0}" >
	<thead>
		<tr>
			<th>review_dt</th>
			<th>member_id</th>
			<th>review_content</th>
		</tr>
	</thead>
	</c:if>
	<tbody>
	<c:forEach items="${reviewList}" var="review" varStatus="stats">
		<tr class="review">
			<td class="review_dt"><fmt:formatDate value="${review.review_dt}" pattern="yyyy-MM-dd"/></td>
			<td class="member_id">${review.member_lecture_history.member.member_id}</td>
			<td class="review_content">${review.review_content}</td>
			<td class="lecture_category_id">${review.member_lecture_history.lecture.lectureCategory.lecture_category_id}</td>
			<td class="lecture_id">${review.member_lecture_history.lecture.lecture_id}</td>
			<td class="tutor_id">${review.member_lecture_history.lecture.tutor.member.member_id}</td>
			<td><input type="button" value="후기삭제하기"/>  </td>
		</tr>
	</c:forEach>
	</tbody>
	
</table>
