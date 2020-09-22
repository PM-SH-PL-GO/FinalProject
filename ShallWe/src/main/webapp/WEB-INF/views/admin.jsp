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

            // 메인화면 변수 잡기
            let $cont = $(".contents");

//--------회원관리----------------------------------------------------------------------------------
            
            // 회원목록 선택시
            $(".member").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/userList",
                    method: "GET",
                    success: function(members){
                    	let $memberList = '<table class="table"><thead>';
                    	$memberList += "<tr><th>순서</th><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th>";
                    	$memberList += '<th>관심분야1</th><th>관심분야2</th><th>관심분야3</th><th>성별</th><th>강사여부</th><th>정지조치</th></tr></thead>';
                    	$memberList += '<tbody>'
                    	members.forEach(function(member, index){
                    		let idx = index + 1;
	                    	$memberList += '<tr><td>'+ idx +'</td>';
	                    	$memberList += '<td>'+ member.member_id +'</td>';
	                    	$memberList += '<td>'+ member.member_name +'</td>';
	                    	$memberList += '<td>'+ member.member_email +'</td>';
	                    	$memberList += '<td>'+ member.member_phone +'</td>';
	                    	member.favorite_list.forEach(function(favorite){
		                    	$memberList += '<td>'+ favorite.lecture_category_name +'</td>';
	                    	});
	                    	
	                    	let listSize = member.favorite_list.length;
	                    	for (let i = 0; i < 3 - listSize; i++){
		                    	$memberList += '<td> </td>';
	                    	}
	                    	
	                    	$memberList += '<td>'+ member.member_sex +'</td>';
                    		$memberList += '<td>' + member.tutor_YN + '</td>';
                    		$memberList += '<td><button class="member_ban" value="' + member.member_id + '">정지하기</button></td></tr>';
                    	});
                    	
                    	$memberList += '</tbody>';
                    	$memberList += '</table>';
                        $cont.html($memberList);
                    }
                });
                $cont.html("");

                return false;
            });
            
//---------강사관리----------------------------------------------------------------------------------------
 
			// 예비강사목록 선택시
            $(".pre-tutor").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/preTutor",
                    method: "GET",
                    success: function(preTutors){
                    	let $lot = '<table class="table"><thead><tr>';
                    	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
                    	$lot += '<th>전문 분야</th><th>세부사항</th><th>승인</th><th>반려</th></tr></thead>';
                    	
                    	preTutors.forEach(function(preTutor, index){
                    		let idx = index + 1;
                    		$lot += '<tr><td>' + idx + '</td>';
                    		$lot += '<td><img src="${contextPath}/tutorImages/' + preTutor.tutor_img + '"></td>';
                    	});
                    	
                        $cont.html($lot);
                    }
                });
                $cont.html("");

                return false;
            });
 
            
            // 강사 상세정보 modal 보이기
            $cont.on("click", ".modal_show", function(){
            	let $lotDiv = "." +$(this).attr("value");
            	let $lot = $($lotDiv);
            	$lot.attr("style", "display:block");
            	
            	return null;
            });
            
            // 강사 상세정보 modal 숨기기
            $cont.on("click", ".modal_close", function(){
            	let $lot = $(this).parents(".modal_slot");
            	$lot.attr("style", "display:none");
            	
            	return null;
            });

            // 예비강사 승인/반려 버튼
            $cont.on("click", ".tutor_status", function(){
            	let $tatus = $(this).html();
            	let approve = $(this).attr('value');

            	$.ajax({
            		url: "${contextPath}/admin/status/" + approve,
            		method: "patch",
            		contentType: 'application/json-patch+json; charset=utf-8',
            		//processData: false,
            		data: JSON.stringify({"status" : "승인"}),
            		success: function(data){
            			alert(data);
            			location.reload();
            			$(".pre-tutor").trigger("click")
            		},
            		fail: function(data){
            			alert(data);
            			
            		}
            	});
            	return null;
            	
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
            
            // 특정강사 강의 목록 보기
            $cont.on("click", ".tutor_lecture", function(){
            	let $tutorId = $(this).attr("value");
            	$.ajax({
            		url: "${contextPath}/admin/tutorLecture/" + $tutorId,
            		method: "GET",
            		success: function(lectures){
            			let $tutor_Lecture = '<div class="lecture-list"><div class="lecture-content">';
            			$tutor_Lecture += '<h3>' + lectures[0].tutor.tutor_nickname + '강사의 강의목록</h3><hr>';
            			$tutor_Lecture += '<table class="lecture-table">';
            			$tutor_Lecture += '<tr><th>번호</th><th>강의명</th><th>상태</th></tr>';
            		
            			lectures.forEach(function(lec, index){
            				let idx = index + 1;
            				$tutor_Lecture += '<tr>';
            				$tutor_Lecture += '<td>' + idx + '</td>';
            				$tutor_Lecture += '<td>'+ lec.lecture_title +'</td>';
            				$tutor_Lecture += '<td>' + lec.lecture_state + '</td>';
            				$tutor_Lecture += '</tr>';
            			});
            			
            			$tutor_Lecture += '<button class="lecture-close">닫기</button>';
            			$tutor_Lecture += '</table></div>';
            			$tutor_Lecture += '<div class="lecture-layer"></div></div>';
            			
            			let cont = $cont.html() + $tutor_Lecture;
            			$cont.html(cont);
            		}
            	});
            	
            	return false;
            });
            
            // 강의 목록 모달창 닫기
            $cont.on("click", ".lecture-close", function(){
            	$(".lecture-list").remove(".lecture-list");
            	return false;
            });
            
//---------강의관리----------------------------------------------------------------------------------------

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
            

            
			
//---------설정하기----------------------------------------------------------------------------------------           
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