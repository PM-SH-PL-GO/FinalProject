<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="lectureList" value="${requestScope['list']}"/>

<div class="row">
	<!-- single start -->
	<c:forEach items="${lectureList}" var="lecture" varStatus="stats">
		<c:forEach items="resultList.Lecture" var="lec" varStatus="lec_count">
		<div class="col">
			<div class="properties pb-20">
				<div class="properties__card">
					<a href="#"><img src="${contextPath}/assets/img/gallery/properties3.png" alt=""></a><br/><br/>
					<div class="properties__caption">
						<p>${stats.count}</p>
						<h3>
							<label>강의명: </label><a href="#">${lecture.lecture_title}</a>
						</h3>
						<h4><label>수강기간: </label>
							<fmt:formatDate value="${lecture.lecture_start_dt}" pattern="yyyy-MM-dd"/> ~
							<fmt:formatDate value="${lecture.lecture_end_dt}" pattern="yyyy-MM-dd"/> 
						</h4>
						<h4><label>강사명: </label>${lecture.tutor.tutor_nickname}</h4>
						<h4><label>현재인원: </label> ${lecture.lecture_current} <label>/최대인원: </label> ${lecture.lecture_max}</h4>
						<input type="hidden" name="lecture_code" value="${lecture.lecture_id}"/>
					</div>
					<div
						class="properties__footer d-flex justify-content-between align-items-center">
						<div class="restaurant-name">
							<h3><fmt:formatNumber value="${lecture.lecture_price}" pattern="#,###원"/></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single end -->		
		</c:forEach>
	</c:forEach>
</div>