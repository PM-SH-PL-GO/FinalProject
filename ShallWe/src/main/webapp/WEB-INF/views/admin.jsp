<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>ShallWe Admin</title>
    <link rel="stylesheet" href="/shallwe/assets/css/admin_style.css">
    <link rel="stylesheet" href="/shallwe/assets/css/faq.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
            let $cont = $(".contents");
            
            // 회원목록 선택시
            $(".member").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/userList",
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
                    url: "${contextPath}/admin/preTutor",
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
                    url: "${contextPath}/admin/tutorList",
                    method: "GET",
                    success: function(views){
                        $cont.html(views);
                    }
                });
                $cont.html("");

                return false;
            });
            
            // 강의목록 선택시
            $(".lecture-list").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/lectureList",
                    method: "GET",
                    success: function(views){
                        $cont.html(views);
                    }
                });
                $cont.html("");

                return false;
            });
            
            // 예비강사 승인/반려 버튼
            $cont.on("click", ".tutor_status", function(){
            	alert("후회~ 하고 있어요~");
            	
            	let $tatus = $(this).html();
            	let approve = $(this).attr('value');
            	
            	console.log(approve + " : " + $tatus);
            	
            	$.ajax({
            		url: "${contextPath}/admin/status/" + approve,
            		method: "PATCH",
            		data: {status : $tatus},
            		success: function(data){
            			
            		}
            	});
            	return null;
            });
            
            
            // modal 보이기
            $cont.on("click", ".modal_show", function(){
            	let $lot = $(this).parents(".table").siblings(".modal_slot");
            	$lot.attr("style", "display:block");
            	
            	return null;
            });
            
            // modal 숨기기
            $cont.on("click", ".modal_close", function(){
            	let $lot = $(this).parents(".modal_slot");
            	$lot.attr("style", "display:none");
            	
            	return null;
            });
            
			
/***************************설정하기***************************/            
            // FAQ 조회
            $(".faq").on("click", function(){
            	$.ajax({
            		url: "${contextPath}/admin/faq",
            		method: "GET",
            		success: function(views){
            			$cont.html(views);
            		}
            	});
            	
	            $cont.html("");
	            
	            return false;
            });
            
            // FAQ 추가
            $cont.on("click", ".faq_insert", function(){
            	$.ajax({
            		url:"",
            		method:"POST",
            		data: {},
            		success: function(){
            			
            		}
            	});
            	
            	return false;
            });
            
            // FAQ 수정
            $cont.on("click", ".faq_change", function(){
            	
            });
            
            // FAQ 삭제
			$cont.on("click", ".faq_delete", function(){
            	
            });
            
            
        });
    </script>
  </head>
  <body>
    <div class="btn">
        <span class="fas fa-bars"></span>
    </div>
      <nav class="sidebar">
          <div class="text">Shall We?</div>
          
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
                    <li><a href="#" class="lecture-list">강의목록</a></li>
                </ul>
              </li>

              <li>
              	<a href="#" class="a-btn config"><i class="fas fa-cog"></i>설정
              		<span class="fas fa-caret-down forth"></span>
              	</a>
              	<ul class="tog">
              		<li><a href="#" class="faq">FAQ</a></li>
              	</ul>
         	  </li>
          </ul>
      </nav>

      <div class="contents">
      </div>
  </body>
</html>