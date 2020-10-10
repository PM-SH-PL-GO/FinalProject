<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>ShallWe Admin</title>
    <link rel="stylesheet" href="/shallwe/assets/css/admin_style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/shallwe/assets/img/favicon.ico">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
 <script src="${contextPath}/js/admin.js">
 </script>
  </head>
  <body>
    <div class="menu-btn">
        <span class="fas fa-bars"></span>
    </div>
      <nav class="sidebar">
          <div class="text">Shall We?</div>
          
          <ul>
              <li><a href="${contextPath }" class="home"><i class="fas fa-home"></i>홈페이지</a></li>
              <li>
                <a  class="a-btn"><i class="fas fa-address-book"></i>회원관리
                    <span class="fas fa-caret-down first"></span>
                </a>
                <ul class="tog">
                    <li><a class="member">회원목록</a></li>
                    <li><a class="ban-member">정지회원목록</a></li>
                </ul>
              </li>

              <li>
                <a class="a-btn tutor"><i class="fas fa-user"></i>강사관리
                    <span class="fas fa-caret-down second"></span>
                </a>
                <ul class="tog">
                    <li><a class="pre-tutor">예비강사목록</a></li>
                    <li><a class="tutor-list">강사목록</a></li>
                </ul>
              </li>

              <li>
                <a class="a-btn lecture"><i class="fas fa-stream"></i>강의관리
                    <span class="fas fa-caret-down third"></span>
                </a>
                <ul class="tog">
                    <li><a class="lecture-list">강의목록</a></li>
                </ul>
              </li>

              <li>
              	<a class="a-btn config"><i class="fas fa-cog"></i>설정
              		<span class="fas fa-caret-down forth"></span>
              	</a>
              	<ul class="tog">
              		<li><a class="faq">FAQ</a></li>
              	</ul>
         	  </li>
          </ul>
      </nav>

      <div class="contents">
      	<h3>Shall we Admin 입니다</h3>
      </div>
  </body>
</html>