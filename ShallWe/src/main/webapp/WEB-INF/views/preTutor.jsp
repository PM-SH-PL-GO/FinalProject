<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<form class="">
	<table class="table">
	    <tr>
	      <th>순서</th>
	      <th>강사 사진</th>
	      <th>아이디</th>
	      <th>회원 이름</th>
	      <th>강사 별명</th>
	      <th>전문 분야</th>
	      <th>세부사항</th>
	      <th>승인</th>
	      <th>반려</th>
	    </tr>
	        
	  <c:forEach items="${preTutorList}" var="pt" varStatus="stats">
	      <tr>
	          <td>${stats.count}</td>                                              		<!-- 순서 -->
	          <td><img src="${contextPath}/tutorImages/${pt.tutor_img}"></td>      		 	<!-- 강사 사진 -->
	          <td>${pt.member.member_id}</td>													 		<!-- 강사의 회원 아이디 -->
	          <td>${pt.member.member_name}</td>													 	<!-- 강사 이름 --> 
	          <td>${pt.tutor_nickname }</td>											 		<!-- 강사 별명 -->
	          <td>${pt.lecture_category.lecture_category_name}</td>													<!-- 전문 분야 -->		
	          <td><button class="modal_show">상세정보 보기</button></td>                   	<!-- 이력서, 자기소개, 소개link를 따로 보여주는 tutorDetail.jsp를 만들예정-->
	          <td><button class="tutor_status" value="${pt.member.member_id }">승인</button></td>
	          <td><button class="tutor_status" value="${pt.member.member_id }">반려</button></td>
	      </tr>
	      <div class="modal_slot">
	      	<div class="modal_content">
	      		<h3>${pt.tutor_nickname} 강사의 세부정보</h3>
	      		<hr>
	      		<h5>자기소개</h5> <br>
	      		<p>${pt.tutor_introduce}</p>
	      		<hr>
	      		<p>이력서 : <a href="${contextPath }/tutorCareer/${pt.tutor_career_file}">${pt.tutor_career_file}</a></p><br>
	      		<p>SNS 링크: <a href="${pt.tutor_link }" >${pt.tutor_link }</a></p><br>
	      		<button class="modal_close">닫기</button>
	      	</div>
	      	<div class="modal_layer"></div>
	      </div>
	  </c:forEach>
	</table>
</form>
