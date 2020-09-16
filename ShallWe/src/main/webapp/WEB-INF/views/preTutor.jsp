<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<table>
    <tr><th>순서</th><th>강사 사진</th></th><th>강사 이름</th><th>전문 분야</th><th>세부사항</th><th>승인</th><th>반려</th></tr>
        
<%--         <c:forEach items="${tutor에 대한 세팅은 controller에서}" var="pt" varStatus="stats"> --%>
<!--             <tr> -->
<%--                 <td>${stats.count}</td>                                              <!-- 순서 --> --%>
<%--                 <td><img src="${contextPath}/tutorImages/${pt.tutor_img}"></td>      <!-- 강사 사진 --> --%>
<!--                 <td>${pt.member.member_name}</td> 혹은 -->
<%--                 <c:set var="mem" value="${pt.member}"/>                              <!-- 강사 이름 --> --%>
<%--                 <td>${mem.member_name}</td> --%>
<!--                 <td>${pt.lecture_category.lecture_category_name}</td> -->
<%--                 <c:set var="cat" value="${pt.lecture_category}"/> --%>
<%--                 <td>${cat.lecture_category_name}</td>                                <!-- 전문 분야 --> --%>
<%--                 <td><a href="${contextPath}/tutorDetail"></td>                       <!-- 이력서, 자기소개, 소개link를 따로 보여주는 tutorDetail.jsp를 만들예정--> --%>
<!--                 <td><button>승인</button></td> -->
<!--                 <td><button>반려</button></td> -->
<!--             </tr> -->
<%--         </c:forEach> --%>
    <tr><td>1</td><td>img죠?</td><td>오문정</td><td>java</td><td>세부사항1</td><td><button>승인</button></td><td><button>반려</button></td></tr>
</table>
