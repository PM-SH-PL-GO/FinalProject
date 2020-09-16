<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<table class="table">
    <tr><th>순서</th><th>강사 사진</th><th>강사 번호</th></th><th>강사 이름</th><th>전문 분야</th><th>강의목록</th><th>강사평점</th><th>관리하기</th></tr>
        
<%--         <c:forEach items="${tutor-list에 대한 세팅은 controller에서}" var="tutor" varStatus="stats"> --%>
<!--             <tr> -->
<%--                 <td>${stats.count}</td>                                              <!-- 순서 --> --%>
<%--                 <td><img src="${contextPath}/tutorImages/${pt.tutor_img}"></td>      <!-- 강사 사진 --> --%>
<!--                 <td>${pt.member.member_id}</td> 혹은 -->
<%--                 <c:set var="mem" value="${tutor.member}"/> --%>
<%--                 <td><input hidden>${mem.member_id}</td>                              <!-- 강사 번호 --> --%>
<%--                 <td>${mem.member_name}</td>                                          <!-- 강사 이름 --> --%>
<!--                 <td>${pt.lecture_category.lecture_category_name}</td> -->
<%--                 <c:set var="cat" value="${pt.lecture_category}"/> --%>
<%--                 <td>${cat.lecture_category_name}</td>                                <!-- 전문 분야 --> --%>
<!--                 <td><button>강의목록</button></td>                                    해당 전문분야 강의목록 -->
<%--                 <td>${tutor.tutor_score}</td>                                        <!-- 강사평점 --> --%>
<!--                 <td><button>관리하기</button></td>                                    관라하기 -->
<!--             </tr> -->
<%--         </c:forEach> --%>
        
</table>
