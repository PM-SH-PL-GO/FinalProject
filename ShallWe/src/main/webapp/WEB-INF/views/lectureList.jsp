<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>회원 관리</title>
<link rel="stylesheet" href="/shallwe/assets/css/admin_style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
        $(function(){
            // 삼디다스 누르면 메뉴 나오게 하기
            $(".btn").click(function(){
                $(this).toggleClass("click");
                $(".sidebar").toggleClass("show");
            });

            // 각 메뉴 누를 시 세부 메뉴 보이게 하기
            $(".a-btn").click(function(){
                $(this).siblings(".tog").toggleClass("show");
                $(this).children("span").toggleClass("rotate");
            });

            // 각 메뉴 누를 시 퍼렁색 고정시키기
            $("nav ul li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
            });


            //---------------------------------------------------------------

            // 메인화면 변수 잡기
            let $cont = $(".content");
            
            // 회원목록 선택시
            $(".member").on("click", function(){
                $.ajax({
                    url: "/userList",
                    method: "GET",
                    success: function(views){
                        $cont.html(views);
                    }
                });
                $cont.html("");

                return false;
            });

            // 예비강사목록 선택시
            $(".pre-tutor").on("click", function(){
                $.ajax({
                    url: "/preTutor",
                    method: "GET",
                    success: function(views){
                        $cont.html(views);
                    }
                });
                $cont.html("");

                return false;
            });
            
            

            // 강사목록 선택시
            $(".tutor-list").on("click", function(){
                $.ajax({
                    url: "/tutorList",
                    method: "GET",
                    success: function(views){
                        $cont.html(views);
                    }
                });
                $cont.html("");

                return false;
            });
            
            // 강의목록 선택시
            $(".lecture").on("click", function(){
                $.ajax({
                    url: "/lectureList",
                    method: "GET",
                    success: function(views){
                        $cont.html(views);
                    }
                });
                $cont.html("");

                return false;
            });

        });
    </script>
</head>
<body>
	<!--     게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
						<th style="background-color: #eeeeee; text-align: center;">강의명</th>
						<th style="background-color: #eeeeee; text-align: center;">강사</th>
						<th style="background-color: #eeeeee; text-align: center;">회원정보</th>
						<th style="background-color: #eeeeee; text-align: center;">진행상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>뭉쳐야찬다</td>
						<td>테스터</td>
						<td>정형돈,김동현</td>
						<td>예정</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<!-- 	사이드바 메뉴 -->
	<div class="btn">
		<span class="fas fa-bars"></span>
	</div>
	<nav class="sidebar">
		<div class="text">Shall We?</div>

		<ul>
			<li><a href="#" class="home"><i class="fas fa-home"></i>홈페이지</a></li>
			<li><a href="#" class="a-btn"><i class="fas fa-address-book"></i>회원관리
					<span class="fas fa-caret-down first"></span> </a>
				<ul class="tog">
					<li><a href="#" class="member">회원목록</a></li>
				</ul></li>

			<li><a href="#" class="a-btn tutor"><i class="fas fa-user"></i>강사관리
					<span class="fas fa-caret-down second"></span> </a>
				<ul class="tog">
					<li><a href="#" class="pre-tutor">예비강사목록</a></li>
					<li><a href="#" class="tutor-list">강사목록</a></li>
				</ul></li>

			<li><a href="#" class="a-btn lecture"><i
					class="fas fa-stream"></i>강의관리 <span
					class="fas fa-caret-down third"></span> </a>
				<ul class="tog">
					<li><a href="#" class="lecture">강의목록</a></li>
				</ul></li>

			<li><a href="#" class="atag config"><i class="fas fa-cog"></i>설정</a></li>
		</ul>
	</nav>

	<div class="content"></div>
</body>
</html>