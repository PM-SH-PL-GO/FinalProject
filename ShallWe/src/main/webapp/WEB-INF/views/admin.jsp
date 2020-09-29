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
<!--     <sec:csrfMetaTags /> -->
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
                    	$lot += '<th>전문 분야</th><th>승인</th><th>반려</th></tr></thead>';
                    	
                    	preTutors.forEach(function(preTutor, index){
                    		let idx = index + 1;
                    		$lot += '<tr class="modal_show" value="tutor' + idx + '"><td>' + idx + '</td>';
                    		$lot += '<td><img src="${contextPath}/tutorImages/' + preTutor.tutor_img + '"></td>';
                    		$lot += '<td>' + preTutor.member.member_id + '</td>';
                    		$lot += '<td>' + preTutor.member.member_name + '</td>';
                    		$lot += '<td>' + preTutor.tutor_nickname + '</td>';
                    		$lot += '<td>' + preTutor.lectureCategory.lecture_category_name + '</td>';
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
                    error: function(){
                    	let $lot = '<table class="table"><thead><tr>';
                    	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
                    	$lot += '<th>전문 분야</th><th>세부사항</th><th>승인</th><th>반려</th></tr></thead>';
                    	
                    	$lot += '<tbody><tr>표시할 데이터가 없습니다</tr></tbody></table>';
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
            	let isTrue = confirm($tatus + " 하시겠습니까?");
            	
            	if (isTrue == true){
	            	let approve = $(this).attr('value');		// 예비강사 ID
					
	            	if ($tatus == "승인"){	 //승인시
		            	$.ajax({
		            		dataType: "json",														// 응답 결과의 형식 -> 다른 형식이 응답된다면 error로 간다
		            		beforeSend : function(xhr){												// 요청을 보내기 전 헤더 값을 설정
		            			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");		// -> csrf 헤더와 토큰을 헤더에 넣어 놔야 403에러가 발생하지 않는다
		            		},																		// 2차 403에러의 주된 원인
		            		url: "${contextPath}/admin/tutor/status/" + approve,
		            		method: "PATCH",
		            		contentType: 'application/json-patch+json; charset=utf-8',				// 1차 에러의 주된 원인
		            		data: JSON.stringify({"status" : $tatus}),
		            		
		            		success: function(data){
		            			alert(data.status);
		            			$(".pre-tutor").trigger("click")
		            		},
		            		error: function(xhttr){
		            			if (xhttr.status == 200)
		            				location.replace('${contextPath}/login');
		            			else
		            				alert(xhttr.status);
		            		}
		            	});
	            	}else{	//반려시
	            		// tutor에서 삭제 후 반려 메세지 email로 보내기
	            		alert("tutor에서 삭제 후 반려 메세지 email로 보내기 : 아직 준비중입니다");
	            	}
            	}
            	
           		return false;
            });
            
            // 전체 강사목록 선택시
            $(".tutor-list").on("click", function(){
                $.ajax({
                    url: "${contextPath}/admin/tutor/list",
                    method: "GET",
                    success: function(tutors){
                    	let $lot = '<table class="table"><thead><tr>';
                    	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
                    	$lot += '<th>전문 분야</th><th>강의 목록</th><th>점수</th><th>관리하기</th></tr></thead><tbody>';
                    	tutors.forEach(function(tutor, index){
                    		let idx = index + 1;
                    		$lot += '<tr class="modal_show" value="tutor' + idx + '"><td>' + idx + '</td>';
                    		$lot += '<td><img src="${contextPath}/tutorImages/' + tutor.tutor_img + '"></td>';
                    		$lot += '<td>' + tutor.member.member_id + '</td>';
                    		$lot += '<td>' + tutor.member.member_name + '</td>';
                    		$lot += '<td>' + tutor.tutor_nickname + '</td>';
                    		$lot += '<td>' + tutor.lectureCategory.lecture_category_name + '</td>';
                    		$lot += '<td><button class="tutor_lecture" value="' + tutor.member.member_id + '">강의 목록 보기</button></td>';
                    		$lot += '<td>' + tutor.tutor_score + '</td>';
                    		$lot += '<td><button class="tutor_edit">관리하기</button></td></tr>';
                    		
                    		$lot += '<div class="modal_slot tutor' + idx + '"><div class="modal_content">';
                      		$lot += '<h3>' + tutor.tutor_nickname + '강사의 세부정보</h3><hr>';
                      		$lot += '<h5>자기소개</h5><br><p>' + tutor.tutor_introduce + '</p><hr>';
                      		$lot += '<p>이력서 : <a href="${contextPath }/tutorCareer/' + tutor.tutor_career_file + '">';
                      		$lot += tutor.tutor_career_file + '</a></p><br>';
                      		$lot += '<p>SNS 링크: <a href="' + tutor.tutor_link + '">' + tutor.tutor_link + '</a></p><br>';
                      		$lot += '<button class="modal_close">닫기</button></div><div class="modal_layer"></div></div>'
                    	});
                    	
                    	$lot += '</tbody></table>';
                    	
                        $cont.html($lot);
                    },
                    error: function(){
                    	let $lot = '<table class="table"><thead><tr>';
                    	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
                    	$lot += '<th>전문 분야</th><th>강의 목록</th><th>점수</th><th>관리하기</th></tr></thead><tbody>';
                    	$lot += '<tbody><tr>표시할 데이터가 업습니다</tr></tbody></table>'
                    	
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
            		url: "${contextPath}/admin/tutor/lecture/" + $tutorId,
            		method: "GET",
            		success: function(lectures){
            			let $tutor_Lecture = '<div class="tutor-lecture-list"><div class="tutor-lecture-content">';
            			$tutor_Lecture += '<h3>' + lectures[0].tutor.tutor_nickname + '강사의 강의목록</h3><br>';
            			$tutor_Lecture += '<button class="tutor-lecture-close">닫기</button><hr>';
            			$tutor_Lecture += '<table class="table">';
            			$tutor_Lecture += '<tr><thead><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th></tr></thead>';
           				$tutor_Lecture += '<tbody>';
            		
            			lectures.forEach(function(lec, index){
            				let idNumber = '' + lec.lecture_id;
                    		for (let i = idNumber.length; i < 4; i++)
                    			idNumber = '0' + idNumber;
            				let idx = index + 1;
            				$tutor_Lecture += '<tr class="lecture-detail" value="' + lec.lecture_id + '">';
            				$tutor_Lecture += '<td>' + idx + '</td>';
            				$tutor_Lecture += '<td>' + lec.lectureCategory.lecture_category_id + idNumber + '</td>';
            				$tutor_Lecture += '<td>'+ lec.lecture_title +'</td>';
            				$tutor_Lecture += '<td>' + lec.lecture_state + '</td>';
            				$tutor_Lecture += '</tr>';
            			});
            			
            			$tutor_Lecture += '</tbody></table></div>';
            			$tutor_Lecture += '<div class="tutor-lecture-layer"></div></div>';
            			
            			let cont = $cont.html() + $tutor_Lecture;
            			$cont.html(cont);
            		},
            		error: function(){
            			let $tutor_Lecture = '<div class="tutor-lecture-list"><div class="tutor-lecture-content">';
//             			$tutor_Lecture += '<h3>' + lectures[0].tutor.tutor_nickname + '강사의 강의목록</h3><br>';
            			$tutor_Lecture += '<button class="tutor-lecture-close">닫기</button><hr>';
            			$tutor_Lecture += '<table class="table">';
            			$tutor_Lecture += '<tr><thead><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th></tr></thead>';
           				$tutor_Lecture += '<tbody><tr>등록한 강의가 존재하지 않습니다</tr></tbody></table></div>'
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
                    url: "${contextPath}/admin/lecture/list",
                    method: "GET",
                    success: function(lectures){
                    	let preparedCnt = 0;
                    	let prepared = '<h3 class="lecture-list-title">등록 요청</h3>';
                    	prepared += '<table class="table prepared"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th>';
                    	prepared += '<th>강의 가격</th><th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th>';
                    	prepared += '<th>현재 수강 인원</th><th colspan="2">관리하기</th></tr></thead><tbody>';
                    	
                    	let processCnt = 0;
                    	let process = '<h3 class="lecture-list-title">진행중</h3>';
                    	process += '<table class="table process"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th>';
                    	process += '<th>강의 가격</th><th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th>';
                    	process += '<th>현재 수강 인원</th></tr></thead><tbody>';
                    	
                    	let finishCnt = 0;
                    	let finish = '<h3 class="lecture-list-title">완료</h3>';
                    	finish += '<table class="table finish"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th>';
                    	finish += '<th>강의 가격</th><th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th>';
                    	finish += '<th>현재 수강 인원</th><th>후기</th></tr></thead><tbody>';
                    	
                    	let cancelRequestCnt = 0;
                    	let cancelRequest = '<h3 class="lecture-list-title">취소 요청</h3>';
                    	cancelRequest += '<table class="table cancel-Request"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th>';
                    	cancelRequest += '<th>강의 가격</th><th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th>';
                    	cancelRequest += '<th>현재 수강 인원</th><th>취소사유</th><th colspan="2">관리하기</th></tr></thead><tbody>';
                    	
                    	let cancelCnt = 0;
                    	let cancel = '<h3 class="lecture-list-title">반려 / 취소</h3>';
                    	cancel += '<table class="table finish"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th>';
                    	cancel += '<th>강의 가격</th><th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th>';
                    	cancel += '<th>현재 수강 인원</th><th>사유보기</th></tr></thead><tbody>';
                    	
                    	lectures.forEach(function(lecture){
                    		let idNumber = '' + lecture.lecture_id;
                    		for (let i = idNumber.length; i < 4; i++)
                    			idNumber = '0' + idNumber;
                    		
                    		let start = formatDate(lecture.lecture_start_dt);
                    		let end = formatDate(lecture.lecture_end_dt);
                    		let today = formatDate(new Date());
                    		
                    		if (lecture.lecture_state == '승인대기'){
                    			preparedCnt++;
                    			prepared += '<tr class="lecture-detail" value="' + lecture.lecture_id + '"><td>';
                    			prepared += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
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
                    			prepared += '<td><button class="lecture-edit" value="' + lecture.lecture_id + '">승인</button></td>';
                    			prepared += '<td><button class="show-reject" value="' + lecture.lecture_id + '">반려</button></td>';
                    			
                    		}else if(lecture.lecture_state == '승인' && end > today){
                    			// 승인(진행중 + 시작 전 모집 중)
                    			processCnt++;
                    			process += '<tr class="lecture-detail" value="' + lecture.lecture_id + '"><td>';
                    			process += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
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
                    		}else if(lecture.lecture_state == '승인' && today >= end){
                    			// 완료
                    			finishCnt++;
                    			finish += '<tr class="lecture-detail" value="' + lecture.lecture_id + '"><td>';
                    			finish += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
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
                    			finish += '<td><button class="lecture-review" value="' + lecture.lecture_id + '">후기보기</button></td>';
                    		}else if(lecture.lecture_state == '취소대기'){
                    			// 취소 요청
                    			cancelRequestCnt++;
                    			cancelRequest += '<tr class="lecture-detail" value="' + lecture.lecture_id + '"><td>';
                    			cancelRequest += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
                    			cancelRequest += '<td><img src="${contextPath}/lecture/' + lecture.lecture_img + '"></td>';
                    			cancelRequest += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
                    			cancelRequest += '<td>' + lecture.lecture_title + '</td>';
                    			cancelRequest += '<td>' + lecture.lecture_price + '원</td>';
                    			cancelRequest += '<td>' + lecture.lecture_state + '</td>';
                    			cancelRequest += '<td>' + start + '</td>';
                    			cancelRequest += '<td>' + end + '</td>';
                    			cancelRequest += '<td>' + lecture.lecture_max + '</td>';
                    			cancelRequest += '<td>' + lecture.lecture_min + '</td>';
                    			cancelRequest += '<td>' + lecture.lecture_current + '</td>';
                    			cancelRequest += '<td><button class="lecture-reason" value="' + lecture.lecture_id + '">취소사유</button></td>';
                    			
                    			if (lecture.lecture_state == '취소대기'){
                    				cancelRequest += '<td><button class="lecture-edit" value="' + lecture.lecture_id + '">취소승인</button></td>';
                    				cancelRequest += '<td><button class="lecture-edit" value="' + lecture.lecture_id + '">복구</button></td>';
                    			}	
                    		}else{
                    			//취소 or 반려
                    			cancelCnt++;
                    			cancel += '<tr class="lecture-detail" value="' + lecture.lecture_id + '"><td>'
                    			cancel += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
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

								if (lecture.lecture_state == '취소')
                    				cancel += '<td><button class="lecture-reason" value="' + lecture.lecture_id + '">취소사유</button></td>';
                   				else if (lecture.lecture_state == '반려')
                    				cancel += '<td><button class="lecture-reason" value="' + lecture.lecture_id + '">반려사유</button></td>';
                    		}
                    	 });
                    	
                    	if (preparedCnt == 0)
                    		prepared += '<tr>표시할 데이터가 없습니다</tr>';
                    	if (processCnt == 0)
                    		process += '<tr>표시할 데이터가 없습니다</tr>';
                    	if (finishCnt == 0)
                    		finish += '<tr>표시할 데이터가 없습니다</tr>';
                    	if (cancelRequestCnt == 0)
                    		cancelRequest += '<tr>표시할 데이터가 없습니다</tr>';
                    	if (cancelCnt == 0)
                    		cancel += '<tr>표시할 데이터가 없습니다</tr>';
                    		
                    	prepared += '</tbody></table><hr>';
                    	process += '</tbody></table><hr>';
                    	finish += '</tbody></table><hr>';
                    	cancelRequest += '</tbody></table><hr>';
                    	cancel += '</tbody></table>';
                    	
                    	$lot = prepared + process + finish + cancelRequest + cancel;
                    	$cont.html($lot);
                    },
                    error: function(){
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
            
            // 강의 상세정보 보기 (새창 띄우기)
            $cont.on("click", ".lecture-detail", function(){
            	let $lectureId = $(this).attr("value");
            	window.open("${contextPath}/lectures/detail?lecture_id=" + $lectureId, "_blank");
            	
            });
            
            // 강의 승인/취소 승인/복구하기
            $cont.on("click", ".lecture-edit", function(){
            	let $tatus = $(this).html();					// 변경할 강의 상태
            	let isTrue = confirm($tatus + " 하시겠습니까?");
            	
            	if (isTrue){
	            	let approve = $(this).attr('value');		// 강의 ID
	            	
	            	$.ajax({
	            		dataType: "json",													
	            		beforeSend : function(xhr){
	            			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");		
	            		},																		
	            		url: "${contextPath}/admin/lecture/status/" + approve,
	            		method: "PATCH",
	            		contentType: 'application/json-patch+json; charset=utf-8',
	            		data: JSON.stringify({ staus : $tatus }),
	            		
	            		success: function(data){
	            			alert(data.success);
	            			$(".lecture-list").trigger("click")
	            		},
	            		error: function(xhttr){
	            			if (xhttr.status == 200)
	            				location.replace('${contextPath}/login');
	            			else
	            				alert(xhttr.errMsg);
	            		}
	            	});
            	}
            	
            	return false;
            });
            
            // 강의 반려하기 버튼 클릭시
            $cont.on("click", ".show-reject", function(){
    			// 모달창(반려 사유 작성) 생성 후 화면에 추가
    			$lectureId = $(this).attr("value");		// 강의 ID
    			
    			let $lot = '<div class="tutor-lecture-list"><div class="tutor-lecture-content">';
      			$lot += '<h3>강의 반려하기</h3><br>';
      			
      			$lot += '<label for="reject-reason">반려 사유 : </label>';
      			$lot += '<select name="reject-reason" id="reject-reason">';
      			$lot += '<option value="부적절한 제목/사진 사용">부적절한 제목/사진 사용</option>';
      			$lot += '<option value="외설적, 폭력적인 내용 포함">외설적, 폭력적인 내용 포함</option>';
      			$lot += '<option value="불법적이거나 부당한 행위">불법적이거나 부당한 행위</option>';
      			$lot += '<option value="부족한 내용설명">부족한 내용설명</option>';
      			$lot += '</select><br><label for="reject-detail">세부 사유</label>';
      			$lot += '<textarea id="reject-detail" name="reject-detial" rows="15" cols="150"/>';
      			$lot += '<button class="reject-lecture">전송</button><button class="tutor-lecture-close">취소</button>';
      			$lot += '<div class="tutor-lecture-layer" value="' + lecture.lecture_id + '"></div></div></div>';
      			
      			let cont = $cont.html() + $lot;
    			$cont.html(cont)
    			
            	return false;
            });
			
            // 강의 반려하기
            $cont.on("click", ".reject-lecture", function(){
            	$lectureId = $(this).attr("value");		// 강의 ID
            	let $tatus = "반려";
            	let $message = $("#reject-reason").val() + ' \\ ' + $("#reject-detail").val();
            	
            	console.log($message);
            	
            	$.ajax({
            		dataType: "json",													
            		beforeSend : function(xhr){
            			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");		
            		},
            		url: "$contextPath/admin/reason/" + $lectureId,
            		method: "PATCH",
            		contentType: "text/html; charset=UTF-8;",
            		date: { status : $tatus, reject_reason : $message},
            		success: function(data){
            			alert(data.success);
            				trigger();
            		},
            		error: function(xhttr){
            			if (xhttr.status == 200){
            				location.replace('${contextPath}/login');
            				$(".lecture-list").trigger("click")
            			}
           				else
            				alert(xhttr.errMsg);
            		}
            		
            	});
            })
            
            
            // 취소/반려 사유 보기
            $cont.on("click", ".lecutre-reason", function(){
            	let lectureId = $(this).attr('value');	// 강의 번호
            	let reasonType = $(this).html();		// 취소사유인지 반려사유인지
            	
            	$.ajax({
            		url: "$contextPath/admin/reason/" + lectureId,
            		method: "GET",
            		data: { rejectOrCancel : reasonType },
            		success: function(lectureDetail){
            			let modal = '<div class="tutor-lecture-list"><div class="tutor-lecture-content">';
                    	modal += '<div>' + lectureDetail.lecture.tutor.tutor_nickname + ' 강사의 ' + lectureDetail.lecture.lecture_title;
                    	modla += '강의 ' + reasonType + '</div>';
            			modal += '<button class="tutor-lecture-close">닫기</button>';
            			modal += '<h5>사유 :</h5><br><p>';
            			if (reasonType == "취소사유")
            				modal += lectureDetail.lecture_cancel_reason + '</p>';
           				else
            				modal += lectureDetail.lecture_reject_reason + '</p>';
		    			modal += '<div class="tutor-lecture-layer"></div></div>';
		    			
		    			let cont = $cont.html() + modal;
		    			$cont.html(cont);
            		},
            		error: function(data){
            			let modal = '<div class="tutor-lecture-list"><div class="tutor-lecture-content">';
                    	modal += '<div>' + reasonType + '목록을 불러오는데 실패했습니다</div>';
            			modal += '<button class="tutor-lecture-close">닫기</button>';
		    			modal += '<div class="tutor-lecture-layer"></div></div>';
		    			let cont = $cont.html() + modal;
		    			$cont.html(cont);
            		}
            	});
            	
            	return false;
            });
            
            // 종료된 강의 후기보기
            $cont.on("click", ".lecture-review", function(){
            	alert("아직 준비중입니다");
            	return false;
            });
            
//---------설정하기----------------------------------------------------------------------------------------           
            // FAQ 조회
            $(".faq").on("click", function(){
            	$.ajax({
            		url: "${contextPath}/admin/faq/list",
            		method: "GET",
            		success: function(faqList){
            			let $lot = '<button class="faq_insert">FAQ 추가하기</button><br>';
            			$lot += '<table class="table"><thead><tr><th>번호</th><th>질문</th><th>답변</th><th>관리</th><th>삭제</th></tr></thead>';
            			$lot += '<tbody>';
						
            			faqList.forEach(function(faq){
            				$lot += '<tr><td>' + faq.faq_id + '</td>';
            				$lot += '<td>' + faq.faq_question + '</td>';
            				$lot += '<td>' + faq.faq_answer + '</td>';
            				$lot += '<td><button class="faq_change" value="' + faq.faq_id + '">관리하기</button></td>';
            				$lot += '<td><button class="faq_delete" value="' + faq.faq_id + '">삭제하기</button></td></tr>';
            			});
            			
            			$lot += '</tbody>';
            			$lot += '</table>';
            			
            			$cont.html($lot);
            		}
            	});
            	
	            $cont.html("");
	            
	            return false;
            });
            
            // FAQ 추가
            $cont.on("click", ".faq_insert", function(){
            	$.ajax({
            		url:"${contextPath}/admin/faq",
            		method:"POST",
            		data: {},
            		success: function(){
            			
            		},
            		error: function(){
            			
            		}
            	});
            	
            	return false;
            });
            
            // FAQ 수정
            $cont.on("click", ".faq_change", function(){
            	$.ajax({
            		url:"${contextPath}/admin/faq" ,
            		method:"PATCH",
            		data: {},
            		success: function(){
            			
            		},
            		error: function(){
            			
            		}
            	});
            });
            
            // FAQ 삭제
			$cont.on("click", ".faq_delete", function(){
				$.ajax({
            		url:"${contextPath}/admin/faq" ,
            		method:"DELETE",
            		data: {},
            		success: function(){
            			
            		},
            		error: function(){
            			
            		}
            	});
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
              <li><a href="${contextPath }" class="home"><i class="fas fa-home"></i>홈페이지</a></li>
              <li>
                <a  class="a-btn"><i class="fas fa-address-book"></i>회원관리
                    <span class="fas fa-caret-down first"></span>
                </a>
                <ul class="tog">
                    <li><a class="member">회원목록</a></li>
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