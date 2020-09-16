<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- <link rel="stylesheet" href="/shallwe/assets/css/admin_style.css"> -->
<!-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> -->

<script>
$(function(){

	var $leftMenuObj = $("section.left_menu");
	var $navObj = $leftMenuObj.find('nav.sidebar');
	
	console.log($navObj);
	$(".sidebar").toggleClass("show");
});

</script>

<style>
.left_menu {
	float: left;
	width: 35%;
}

.left_menu_result {
	text-align: center;
}

.btn{
    position: absolute;
    top: 15px;
    left: 45px;
    height: 45px;
    width: 45px;
    text-align: center;
    background: #404040;
    border-radius: 3px;
    cursor: pointer;
    transition: left 0.4s ease;
}

.btn.click{
    left: 260px;
}

.btn span{
    color: white;
    font-size: 28px;
    line-height: 45px;
}

.btn.click span:before{
    content: "\f00d";
}

.sidebar{
    position: fixed;
    width: 250px;
    height: 100%;
    left: -250px;
    background: #404040;
    transition: left 0.4s ease;
}

.sidebar.show{
    left: 0px;
}

.sidebar .logoTitle{
    color: #00dbd5;
    font-size: 25px;
    font-weight: 600;
    line-height: 65px;
    text-align: center;
    background: #333;
    letter-spacing: 1px;
}

nav ul{
    background: #404040;
    height: 100%;
    width: 100%;
    list-style: none;
}

nav ul .tog.show {
    display: block;
}

nav ul li{
    line-height: 60px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

nav ul li a{
    position: relative;
    color: white;
    text-decoration: none;
    font-size: 18px;
    padding-left: 25px;
    font-weight: 500;
    display: block;
    width: 100%;
    border-left: 3px solid transparent;
}

nav ul li.active a{
    color:#00dbd5;
    /* background: #1e1e1e; */
    border-left-color: #00dbd5;
}

nav ul li a i{
    margin-right: 20px;
}

nav ul li.active ul li a{
    /* color: #404040; */
    color: #e6e6e6;
    border-left-color: transparent;
}

nav ul ul li a:hover{
    color: #00dbd5!important;
}
nav ul ul{
    position: static;
    display: none;
}

nav ul ul li{
    line-height: 42px;
    border-bottom: none;
}

nav ul ul li a{
    font-size: 17px;
    color: #e6e6e6;
    padding-left: 80px;
}

nav ul li a span{
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
    font-size: 22px;
    transition: transform 0.4s;
}

nav ul li a span.rotate{
    transform: translateY(-50%) rotate(-180deg);
}

</style>

<section class="left_menu section-padding">
<nav class="sidebar">
    <div class="logoTitle">Shall We?</div>
    <ul>
        <li><a href="#" class="home"><i class="fas fa-home"></i>홈페이지</a></li>
        <li>
          <a href="#" class="a-btn"><i class="fas fa-address-book"></i>회원관리
              <span class="fas fa-caret-down first"></span>
          </a>
          <ul class="tog">
              <li><a href="#" class="member">회원목록</a></li>
          </ul>
        </li>
        <li>
          <a href="#" class="a-btn tutor"><i class="fas fa-user"></i>강사관리
              <span class="fas fa-caret-down second"></span>
          </a>
          <ul class="tog">
              <li><a href="#" class="pre-tutor">예비강사목록</a></li>
              <li><a href="#" class="tutor-list">강사목록</a></li>
          </ul>
        </li>

        <li>
          <a href="#" class="a-btn lecture"><i class="fas fa-stream"></i>강의관리
              <span class="fas fa-caret-down third"></span>
          </a>
          <ul class="tog">
              <li><a href="#" class="lecture">강의목록</a></li>
          </ul>
        </li>

        <li><a href="#" class="atag config"><i class="fas fa-cog"></i>설정</a></li>
    </ul>
</nav>

</section>