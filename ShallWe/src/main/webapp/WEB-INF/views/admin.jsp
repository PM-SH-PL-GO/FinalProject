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
                    url: "${contextPath}/admin/member",
                    method: "GET",
                    success: function(members){
                    	let $memberList = '<table class="table"><thead>';
                    	$memberList += "<tr><th>순서</th><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th>";
                    	$memberList += '<th>관심분야1</th><th>관심분야2</th><th>관심분야3</th><th>성별</th><th>강사여부</th><th>탈퇴조치</th></tr></thead>';
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
                    		$memberList += '<td><button class="member-ban" value="' + member.member_id + '">탈퇴</button></td></tr>';
                    	});
                    	
                    	$memberList += '</tbody>';
                    	$memberList += '</table>';
                        $cont.html($memberList);
                    }
                });
                $cont.html("");

                return false;
            });
            
            // 탈퇴시키기
            $cont.on("click", ".member-ban", function(){
            	let $memberId = $(this).attr("value");
            	$.ajax({
            		url: "${contextPath}/admin/member/" + $memberId,
            		method: "DELETE",
            		succuss: function(){
            			
            		}
            	});
            	
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
                    		$lot += '<td>' + preTutor.member.member_id + '</td>';
                    		$lot += '<td>' + preTutor.member.member_name + '</td>';
                    		$lot += '<td>' + preTutor.tutor_nickname + '</td>';
                    		$lot += '<td>' + preTutor.lecture_category.lecture_category_name + '</td>';
                    		$lot += '<td><button class="modal_show" value="tutor' + idx + '">상세정보 보기</button></td>';
                    		$lot += ' <td><button class="tutor_status" value="' + preTutor.member.member_id + '">승인</button></td>';
                    		$lot += ' <td><button class="tutor_status" value="' + preTutor.member.member_id + '">반려</button></td></tr>';
                    		
                    		$lot += '<div class="modal_slot tutor' + idx + '"><div class="modal_content">';
                      		$lot += '<h3>' + preTutor.tutor_nickname + '강사의 세부정보</h3><hr>';
                      		$lot += '<h5>자기소개</h5><br><p>' + preTutor.tutor_introduce + '</p><hr>';
                      		$lot += '<p>이력서 : <a href="${contextPath }/tutorCareer/' +  preTutor.tutor_career_file + '">';
                      		$lot += preTutor.tutor_career_file + '</a></p><br>';
                      		$lot += '<p>SNS 링크: <a href="' + preTutor.tutor_link + '">' + preTutor.tutor_link + '</a></p><br>';
                      		$lot += '<button class="modal_close">닫기</button></div><div class="modal_layer"></div></div>'
                    	});
                    	
                    	$lot += '</table>';
                    	
                        $cont.html($lot);
                    },
                    fail: function(){
                    	alert("얌마 이대리!");
                    	let $lot = '<table class="table"><thead><tr>';
                    	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
                    	$lot += '<th>전문 분야</th><th>세부사항</th><th>승인</th><th>반려</th></tr></thead>';
                    	
                    	$lot += '<tbody><tr>표시할 데이터가 없습니다</tr></tbody>';
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
            	
            	return false;
            });
            
            // 강사 상세정보 modal 숨기기
            $cont.on("click", ".modal_close", function(){
            	let $lot = $(this).parents(".modal_slot");
            	$lot.attr("style", "display:none");
            	
            	return false;
            });

            // 예비강사 승인/반려 버튼
            $cont.on("click", ".tutor_status", function(){
            	let $tatus = $(this).html();				// 승인/반려 상태
            	let approve = $(this).attr('value');		// 예비강사 ID

            	$.ajax({
            		url: "${contextPath}/admin/status/" + approve,
            		method: "patch",
            		contentType: 'application/json-patch+json; charset=utf-8',
            		data: JSON.stringify({"status" : $tatus}),
            		success: function(data){
            			alert(data);
            			location.reload();
            			$(".pre-tutor").trigger("click")
            		},
            		fail: function(data){
            			alert(data);
            			
            		}
            	});
            	return false;
            	
            });
            
            // 전체 강사목록 선택시
            $(".tutor-list").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/tutorList",
                    method: "GET",
                    success: function(tutors){
                    	let $lot = '<table class="table"><thead><tr>';
                    	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
                    	$lot += '<th>전문 분야</th><th>강의 목록</th><th>점수</th><th>세부사항</th><th>관리하기</th></tr></thead>';
                    	tutors.forEach(function(tutor, index){
                    		let idx = index + 1;
                    		$lot += '<tr><td>' + idx + '</td>';
                    		$lot += '<td><img src="${contextPath}/tutorImages/' + tutor.tutor_img + '"></td>';
                    		$lot += '<td>' + tutor.member.member_id + '</td>';
                    		$lot += '<td>' + tutor.member.member_name + '</td>';
                    		$lot += '<td>' + tutor.tutor_nickname + '</td>';
                    		$lot += '<td>' + tutor.lecture_category.lecture_category_name + '</td>';
                    		$lot += '<td><button class="tutor_lecture" value="' + tutor.member.member_id + '">강의 목록 보기</button></td>';
                    		$lot += '<td>' + tutor.tutor_score + '</td>';
                    		$lot += '<td><button class="modal_show" value="tutor' + idx + '">상세정보 보기</button></td>';
                    		$lot += '<td><button class="tutor_edit">관리하기</button></td>';
                    		
                    		$lot += '<div class="modal_slot tutor' + idx + '"><div class="modal_content">';
                      		$lot += '<h3>' + tutor.tutor_nickname + '강사의 세부정보</h3><hr>';
                      		$lot += '<h5>자기소개</h5><br><p>' + tutor.tutor_introduce + '</p><hr>';
                      		$lot += '<p>이력서 : <a href="${contextPath }/tutorCareer/' + tutor.tutor_career_file + '">';
                      		$lot += tutor.tutor_career_file + '</a></p><br>';
                      		$lot += '<p>SNS 링크: <a href="' + tutor.tutor_link + '">' + tutor.tutor_link + '</a></p><br>';
                      		$lot += '<button class="modal_close">닫기</button></div><div class="modal_layer"></div></div>'
                    	});
                    	
                    	$lot += '</table>';
                    	
                        $cont.html($lot);
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
            			let $tutor_Lecture = '<div class="tutor-lecture-list"><div class="tutor-lecture-content">';
            			$tutor_Lecture += '<h3>' + lectures[0].tutor.tutor_nickname + '강사의 강의목록</h3><hr>';
            			$tutor_Lecture += '<table class="tutor-lecture-table">';
            			$tutor_Lecture += '<tr><th>번호</th><th>강의명</th><th>상태</th></tr>';
            		
            			lectures.forEach(function(lec, index){
            				let idx = index + 1;
            				$tutor_Lecture += '<tr>';
            				$tutor_Lecture += '<td>' + idx + '</td>';
            				$tutor_Lecture += '<td>'+ lec.lecture_title +'</td>';
            				$tutor_Lecture += '<td>' + lec.lecture_state + '</td>';
            				$tutor_Lecture += '</tr>';
            			});
            			
            			$tutor_Lecture += '<button class="tutor-lecture-close">닫기</button>';
            			$tutor_Lecture += '</table></div>';
            			$tutor_Lecture += '<div class="tutor-lecture-layer"></div></div>';
            			
            			let cont = $cont.html() + $tutor_Lecture;
            			$cont.html(cont);
            		}
            	});
            	
            	return false;
            });
            
            // 강의 목록 모달창 닫기
            $cont.on("click", ".tutor-lecture-close", function(){
            	$(".tutor-lecture-list").remove(".tutor-lecture-list");
            	return false;
            });
            
//---------강의관리----------------------------------------------------------------------------------------

            // 강의목록 선택시
            $(".lecture-list").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/lectureList",
                    method: "GET",
                    success: function(lectures){
                    	let prepared = '<h3 class="lecture-list-title">승인대기</h3>';
                    	prepared += '<table class="table prepared"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th><th>강의 가격</th>';
                    	prepared += '<th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th><th>현재 수강 인원</th>';
                    	prepared += '<th colspan="2">관리하기</th></tr></thead><tbody>';
                    	
                    	let process = '<h3 class="lecture-list-title">진행중</h3>';
                    	process += '<table class="table process"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th><th>강의 가격</th><th>강의 상태</th>';
                    	process += '<th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th><th>현재 수강 인원</th><th>관리하기</th></tr></thead><tbody>';
                    	
                    	let finish = '<h3 class="lecture-list-title">완료</h3>';
                    	finish += '<table class="table finish"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th><th>강의 가격</th><th>강의 상태</th>';
                    	finish += '<th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th><th>현재 수강 인원</th><th>관리하기</th></tr></thead><tbody>';
                    	
                    	let cancel = '<h3 class="lecture-list-title">취소 대기 / 취소</h3>';
                    	cancel += '<table class="table finish"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th><th>강의 가격</th><th>강의 상태</th>';
                    	cancel += '<th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th><th>현재 수강 인원</th><th colspan="2">관리하기</th></tr></thead><tbody>';
                    	
                    	lectures.forEach(function(lecture){
                    		let idNumber = '' + lecture.lecture_id;
                    		for (let i = idNumber.length; i < 4; i++)
                    			idNumber = '0' + idNumber;
                    		
                    		let start = formatDate(lecture.lecture_start_dt);
                    		let end = formatDate(lecture.lecture_end_dt);
                    		let today = formatDate(new Date());
                    		
                    		if (lecture.lecture_state == '승인대기'){
                    			prepared += '<tr><td>' + lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
                    			prepared += '<td><img src="${contextPath}/lecture/' + lecture.lecture_img + '"></td>';
                    			prepared += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
                    			prepared += '<td>' + lecture.lecture_title + '</td>';
                    			prepared += '<td>' + lecture.lecture_price + '원</td>';
                    			prepared += '<td>' + lecture.lecture_state + '</td>';
                    			prepared += '<td>' + start + '</td>';
                    			prepared += '<td>' + end + '</td>';
                    			prepared += '<td>' + lecture.lecture_max + '</td>';
                    			prepared += '<td>' + lecture.lecture_min + '</td>';
                    			prepared += '<td>' + lecture.lecture_current + '</td>';
                    			prepared += '<td><button class="lecture-approve">승인</button></td>';
                    			prepared += '<td><button class="lecture-cancel">반려</button></td>';
                    		}else if(lecture.lecture_state == '승인' && end > today){
                    			// 승인(진행중 + 시작 전 모집 중)
                    			process += '<tr><td>' + lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
                    			process += '<td><img src="${contextPath}/lecture/' + lecture.lecture_img + '"></td>';
                    			process += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
                    			process += '<td>' + lecture.lecture_title + '</td>';
                    			process += '<td>' + lecture.lecture_price + '원</td>';
                    			process += '<td>' + lecture.lecture_state + '</td>';
                    			process += '<td>' + start + '</td>';
                    			process += '<td>' + end + '</td>';
                    			process += '<td>' + lecture.lecture_max + '</td>';
                    			process += '<td>' + lecture.lecture_min + '</td>';
                    			process += '<td>' + lecture.lecture_current + '</td>';
                    			process += '<td><button class="lecture-edit">관리하기</button></td>';
                    		}else if(lecture.lecture_state == '승인' && today >= end){
                    			// 완료
                    			finish += '<tr><td>' + lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
                    			finish += '<td><img src="${contextPath}/lecture/' + lecture.lecture_img + '"></td>';
                    			finish += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
                    			finish += '<td>' + lecture.lecture_title + '</td>';
                    			finish += '<td>' + lecture.lecture_price + '원</td>';
                    			finish += '<td>' + lecture.lecture_state + '</td>';
                    			finish += '<td>' + start + '</td>';
                    			finish += '<td>' + end + '</td>';
                    			finish += '<td>' + lecture.lecture_max + '</td>';
                    			finish += '<td>' + lecture.lecture_min + '</td>';
                    			finish += '<td>' + lecture.lecture_current + '</td>';
                    			finish += '<td><button class="lecture-edit">관리하기</button></td>';
                    		}else{
                    			//취소 or 취소대기
                    			cancel += '<tr><td>' + lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
                    			cancel += '<td><img src="${contextPath}/lecture/' + lecture.lecture_img + '"></td>';
                    			cancel += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
                    			cancel += '<td>' + lecture.lecture_title + '</td>';
                    			cancel += '<td>' + lecture.lecture_price + '원</td>';
                    			cancel += '<td>' + lecture.lecture_state + '</td>';
                    			cancel += '<td>' + start + '</td>';
                    			cancel += '<td>' + end + '</td>';
                    			cancel += '<td>' + lecture.lecture_max + '</td>';
                    			cancel += '<td>' + lecture.lecture_min + '</td>';
                    			cancel += '<td>' + lecture.lecture_current + '</td>';
                    			if (lecture.lecture_state == '취소대기'){
                    				cancel += '<td><button class="lecture-cancel-approve">취소하기</button></td>';
                    				cancel += '<td><button class="lecture-cancel-deny">반려</button></td>';
                    			}
                    			else
                    				cancel += '<td><button class="lecture-review">후기보기</button></td>';
                    		}
                    			
                    	 });
                    	
                    	prepared += '</tbody></table><hr>';
                    	process += '</tbody></table><hr>';
                    	finish += '</tbody></table><hr>';
                    	cancel += '</tbody></table>';
                    	
                    	$lot = prepared + process + finish + cancel;
                    	$cont.html($lot);
                    },
                    fail: function(){
                    	let $lot = '<table class="table"><thead><tr>';
						$lot += '<th>강의 번호</th><th>강의 사진</th><th>강의명</th><th>강의 가격</th><th>강의 상태</th>';              	
						$lot += '<th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th><th>현재 수강 인원</th><th>상세 정보</th>';              	
                    	$lot += '</tr></thead>';
                    	$lot += '<tbody><tr>표시할 내용이 없습니다</tr></tbody>';
                    }
                });
                $cont.html("");

                return false;
            });
            

            // 강의 상세정보 보기 -> 동일이꺼 가져다 새창에 띄워주기 ㅇㅋ?
            $cont.on("click", ".lecture-detail", function(){
            	let $lectureId = $(this).attr("value");
            	
//             	$.ajax({
//             		url: "${contentPath}/admin/lectureDetail/" + $lectureId,
//             		method: "GET",
//             		success: function(detail){
//             			let $lot = '<div class="modal_slot"><div class="modal_content"><table class="table">';
//             			$lot += '<thead><tr><th>';
            			
//             			$lot += '</th></tr></thead>';
            			
//             			$lot += '<button class="modal_close"></button>';
//             			$lot += '<div class="modal_layer"></div></table></div></div>';
//             		},
//             		fail: function(){
            			
//             		}
//             	});
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
            
            
            // 날짜 변환 함수
			function formatDate(date) { 
				   let d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
				   if (month.length < 2)
					   month = '0' + month;
				   if (day.length < 2)
					   day = '0' + day; 
				   return [year, month, day].join('-'); 
			}
            
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