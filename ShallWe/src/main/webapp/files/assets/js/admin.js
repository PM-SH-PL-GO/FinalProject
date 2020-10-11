$(function(){
    // 삼디다스 누르면 메뉴 나오게 하기
    $(".menu-btn").click(function(){
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
            url: "/shallwe/admin/member/list/1",
            method: "GET",
            success: function(members){
            	let $memberList = '<div class="scroll-section"><h2>회원 목록</h2><hr>';
            	$memberList += '<table class="table"><thead>'
            	$memberList += "<tr><th>순서</th><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th>";
            	$memberList += '<th>관심분야1</th><th>관심분야2</th><th>관심분야3</th><th>성별</th>';
            	$memberList += '<th>강사여부</th><th>정지조치</th></tr></thead>';
            	$memberList += '<tbody>'
            	members.forEach(function(member, index){
            		let memberId = member.member_id;
            		if (memberId != "shallwe"){
                		let idx = index + 1;
                    	$memberList += '<tr class="member-history" value='+ memberId +'><td>'+ idx +'</td>';
                    	$memberList += '<td>'+ memberId +'</td>';
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
                		$memberList += '<td><button class="ban-modal" value="' + memberId + '">';
            			$memberList += '정지</button></td></tr>';
            		}
            	});
            	
            	$memberList += '</tbody></table></div>';
                $cont.html($memberList);
            },
            error: function(){
            	let $memberList = '<div class="scroll-section"><table class="table"><thead>';
            	$memberList += "<tr><th>순서</th><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th>";
            	$memberList += '<th>관심분야1</th><th>관심분야2</th><th>관심분야3</th><th>성별</th><th>강사여부</th><th>정지조치</th></tr></thead>';
            	$memberList += '<tbody><tr><td colspan="11">목록이 비어있습니다</td></tr>'
            	$memberList += '</tbody></table></div>';
                $cont.html($memberList);
            }
        });
        $cont.html("");

        return false;
    });
    
    
    // 회원 별 신청 강의 보기
    $cont.on("click", ".member-history", function(){
    	let memberId = $(this).attr("value");
    	
    	$.ajax({
    		url: "/shallwe/admin/member/history/list/" + memberId,
    		method: "GET",
    		success: function(historyList){
    			let $historyModal = '<div class="modal-add"><div class="modal-content">';
    			$historyModal += '<h3>' + historyList[0].member.member_name + ' 회원의 수강목록</h3><hr>';
    			$historyModal += '<table class="table">';
    			$historyModal += '<thead><tr><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th><th>신청/취소일</th></tr>';
   				$historyModal += '</thead><tbody>';
    		
   				historyList.forEach(function(history, index){
    				let idx = index + 1;
    				let lecture = history.lecture;
    				let idNumber = '' + lecture.lecture_id;
            		for (let i = idNumber.length; i < 4; i++)
            			idNumber = '0' + idNumber;
    				
    				$historyModal += '<tr class="lecture-detail" value="' + lecture.lecture_id + '">';
    				$historyModal += '<td>' + idx + '</td>';
    				$historyModal += '<td>' + lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
    				$historyModal += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
    				let state = lecture.lecture_state;
    				$historyModal += '<td>'+ state +'</td>';
    				if (state == "승인")
    					$historyModal += '<td>' + formatDate(history.payment_dt) + '</td>';
   					else
    					$historyModal += '<td>' + formatDate(history.cancel_dt) + '</td>';
   						
    				$historyModal += '</tr>';
    			});
    			
    			$historyModal += '</tbody></table><button class="modal-close">닫기</button></div>';
    			$historyModal += '<div class="modal-layer"></div></div>';
    			
    			let cont = $cont.html() + $historyModal;
    			$cont.html(cont);
    		},
    		error: function(data){
    			let $historyModal = '<div class="modal-add"><div class="modal-content">';
    			$historyModal += '<table class="table">';
    			$historyModal += '<thead><tr><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th><th>신청/취소일</th></tr>';
    			$historyModal += '<tbody><tr colspan="5"><td>신청 목록이 없습니다</td></tr>';
    			$historyModal += '</tbody></table><button class="modal-close">닫기</button></div>';
    			$historyModal += '<div class="modal-layer"></div></div>';
    			
    			let cont = $cont.html() + $historyModal;
    			$cont.html(cont);
    		}
    	});
    });
    
    
    
    // 정지 회원 목록보기
    $(".ban-member").on("click", function(){
        $.ajax({
            url: "/shallwe/admin/member/list/0",
            method: "GET",
            success: function(members){
            	let $memberList = '<div class="scroll-section"><h2>정지 회원 목록</h2><hr>';
            	$memberList += '<table class="table"><thead>'
            	$memberList += "<tr><th>순서</th><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th>";
            	$memberList += '<th>관심분야1</th><th>관심분야2</th><th>관심분야3</th><th>성별</th><th>강사여부</th><th>정지조치</th></tr></thead>';
            	$memberList += '<tbody>'
            	members.forEach(function(member, index){
            		let memberId = member.member_id;
            		if (memberId != "shallwe"){
                		let idx = index + 1;
                    	$memberList += '<tr><td>'+ idx +'</td>';
                    	$memberList += '<td>'+ memberId +'</td>';
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
                		$memberList += '<td><button class="ban-modal" value="' + memberId + '">';
            			$memberList += '복구</button></td></tr>';
            		}
            	});
            	
            	$memberList += '</tbody></table></div>';
                $cont.html($memberList);
            },
            error: function(){
            	let $memberList = '<div class="scroll-section"><table class="table"><thead>';
            	$memberList += "<tr><th>순서</th><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th>";
            	$memberList += '<th>관심분야1</th><th>관심분야2</th><th>관심분야3</th><th>성별</th><th>강사여부</th><th>정지조치</th></tr></thead>';
            	$memberList += '<tbody><tr><td colspan="11">목록이 비어있습니다</td></tr>'
            	$memberList += '</tbody></table></div>';
                $cont.html($memberList);
            }
        });
        $cont.html("");

        return false;
    });
    
    
    // 정지/복구시키기
    $cont.on("click", ".ban-modal", function(){
    	let $memberId = $(this).attr("value");
    	let $tatus = $(this).html();
    	let status = 0;
    	
    	if ($tatus == "복구")
    		status = 1;
    		
    	$.ajax({
    		url: "/shallwe/admin/member/" + $memberId,
    		method: "PATCH",
    		data: JSON.stringify({enabled : status}),
    		dataType: "json",
    		succuss: function(data){
    			alert(data.success);
    			$(".member").trigger("click");
    		},
    		error: function(data){
    			alert(data.errMsg);
    			$(".member").trigger("click");
    		}
    	});
    	
    	return false;
    });
    
//---------강사관리----------------------------------------------------------------------------------------
 
			// 예비강사목록 선택시
    $(".pre-tutor").on("click", function(){
        $.ajax({
            url: "/shallwe/admin/tutor/list/N",
            method: "GET",
            success: function(bean){
            	let $lot = '<div class="scroll-section"><h2>예비 강사 목록</h2><hr><table class="table"><thead><tr>';
            	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
            	$lot += '<th>전문 분야</th><th>승인</th><th>반려</th></tr></thead><tbody>';
            	
            	let $map = bean.tutorCategoryMap;
            		
            	bean.tutorKeyList.forEach(function(tutor, index){
            		let tutorId = tutor.member.member_id;
               		let idx = index + 1;
               		let $catList = $map[tutorId];
               		
            		$lot += '<tr class="modal_show ' + tutorId + '" value="' + tutorId + '"><td>' + idx + '</td>';
            		$lot += '<td><img src="/shallwe/tutorImages/' + tutor.tutor_img + '"></td>';
            		$lot += '<td>' + tutorId + '</td>';
            		$lot += '<td>' + tutor.member.member_name + '</td>';
            		$lot += '<td>' + tutor.tutor_nickname + '</td>';
            		
            		$lot += '<td class="' + tutorId + '-cat-td">';
            		$catList.forEach(function(category, index){
                  		$lot += category.lecture_category_name + '<br>';
              		});
            		+ '</td>';

            		$lot += ' <td><button class="tutor_status" value="' + tutorId + '">승인</button></td>';
            		$lot += ' <td><button class="tutor_status" value="' + tutorId + '">반려</button></td></tr>';
            		// 상세정보용 모달창
            		$lot += '<div class="modal_slot ' + tutorId + '"><div class="modal_content">';
              		$lot += '<h3>' + tutor.tutor_nickname + ' 강사의 세부정보</h3><hr>';
              		$lot += '<div>이름 : ' + tutor.member.member_name + '</div>'
              		$lot += '<div>아이디 : ' + tutor.member.member_id + '</div>'
              		$lot += '<h5>강사 사진</h5><br>';
              		$lot += '<div><img class="tutor-detail-img" src="/shallwe/tutorImages/';
              		$lot += tutor.tutor_img + '"></div><br>';
              		$lot += '<div>닉네임 : ' + tutor.tutor_nickname + '</div>'
              		$lot += '<div>신청 분야<br>';
              		$catList.forEach(function(category, index){
              			if (index != 0)
                  			$lot += '<br>';
              			$lot += category.lecture_category_name ;
              		});
              		$lot += '</div><hr>';
              		
              		$lot += '<div>자기소개<br><input class="single-input" value="' + tutor.tutor_introduce + '" disabled></div><br>';
              		$lot += '<div>이력서 : <a href="/shallwe/tutorCareer/' + tutor.tutor_career_file + '">';
              		let career = tutor.tutor_career_file;
              		$lot += career.substring(career.indexOf("_", 0) + 1, career.length) + '</a></div><hr>';
              		$lot += '<div>SNS 링크 : <a href="' + tutor.tutor_link + '">' + tutor.tutor_link + '</a></div><br>';
              		$lot += '<button class="modal_close">닫기</button></div><div class="modal_layer"></div></div>'
            	});
            	
            	$lot += '<tbody></table></div>';
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
    	let $lotDiv = "div." +$(this).attr("value");
    	let $lot = $($lotDiv);
    	$lot.attr("style", "display:block");
//             	window.open("", "newWindow");
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
      	let tutorId = $(this).attr('value');		// 예비강사 ID
      	let catString = $("td[class=" + tutorId + "-cat-td]").html();	// 심사중인 카테고리
      	
    	if ($(this).html() == "승인"){	 //승인시
        	if (confirm("승인 하시겠습니까?")){
			
            	$.ajax({
            		dataType: "json",
            		url: "/shallwe/admin/tutor/status/" + tutorId,
            		method: "PATCH",
            		data: JSON.stringify({category : catString}),
            		contentType: 'application/json-patch+json; charset=utf-8',
            		success: function(data){
            			alert(data.status);
            			$(".pre-tutor").trigger("click")
            		},
            		error: function(xhttr){
            			if (xhttr.status == 200)
            				location.replace('/shallwe/login');
            			else
            				alert(xhttr.status);
            		}
            	});
        	}
   		}else{	//반려시
    		// tutor에서 삭제 후 반려 메세지 email로 보내기
    		let rejectModal = '<div class="modal-add"><div class="modal-content">';
			rejectModal += '<h3>강사신청 반려하기</h3><br>';
  			
			rejectModal += '<label for="reject-reason">반려 사유 : </label>';
			rejectModal += '<select name="reject-reason" id="reject-reason">';
			rejectModal += '<option value="unsuit">부적절한 제목/사진 사용</option>';
			rejectModal += '<option value="lewdNviolent">외설적, 폭력적인 내용 포함</option>';
			rejectModal += '<option value="illegal">불법적이거나 부당한 행위</option>';
			rejectModal += '<option value="lack">부족한 내용설명</option><br>';
			rejectModal += '<option value="etc">기타</option></select></select><br>';
			rejectModal += '<label for="reject-detail">세부 사유</label><br>';
			rejectModal += '<input id="reject-detail" name="reject-detial" placeholder="세부 내용을 작성해주세요"></input><br>';
			
			rejectModal += '<button class="tutor-reject" value="' + tutorId +'">반려하기</button>';
    		rejectModal += '<button class="modal-close">닫기</button></div>';
    		rejectModal += '<div class="modal-layer"></div></div>';
    		
    		let cont = $cont.html() + rejectModal;
    		$cont.html(cont);
		}
    	
   		return false;
    });
    
    
    // 예비강사 반려하기
    $cont.on("click", ".tutor-reject", function(){
    	
    	let tutorId = $(this).attr("value");							// tutor_id
    	let rejectId = $("#reject-reason").val();						// reject_category_id
    	let rejectReason = $("#reject-detail").val();					// reject_reason
    	let catString = $("td[class=" + tutorId + "-cat-td]").html();	// lecture category
    	
    	$.ajax({
    		url: "/shallwe/admin/tutor/status/" + tutorId,
    		method: "POST",
    		data: {reject_category_id : rejectId, reject_reason : rejectReason, category : catString},
    		dataType: "json",
    		success: function(data){
    			alert(data.success);
    			$(".pre-tutor").trigger("click");
    		},
    		error: function(data){
    			alert(data.errMsg);
    			$(".pre-tutor").trigger("click");
    		}
    	});
    	
    	return false;
    });
    
    // 전체 강사목록 선택시
    $(".tutor-list").on("click", function(){
        $.ajax({
            url: "/shallwe/admin/tutor/list/Y",
            method: "GET",
            success: function(bean){
            	let $lot = '<div class="scroll-section"><h2>Shall We? 강사 목록</h2><hr><table class="table"><thead><tr>';
            	$lot += '<th>순서</th><th>강사 사진</th><th>아이디</th><th>회원 이름</th><th>강사 별명</th>';
            	$lot += '<th>전문 분야</th><th>강의 목록</th><th>점수</th></tr></thead><tbody>';
            	
            	let $map = bean.tutorCategoryMap;
            	
            	bean.tutorKeyList.forEach(function(tutor, index){
            		let tutorId = tutor.member.member_id;
               		let idx = index + 1;
               		let $catList = $map[tutorId];
               		
            		$lot += '<tr class="modal_show ' + tutorId + '" value="' + tutorId + '"><td>' + idx + '</td>';
            		$lot += '<td><img src="/shallwe/tutorImages/' + tutor.tutor_img + '"></td>';
            		$lot += '<td>' + tutorId + '</td>';
            		$lot += '<td>' + tutor.member.member_name + '</td>';
            		$lot += '<td>' + tutor.tutor_nickname + '</td>';
            		
            		$lot += '<td>';
            		$catList.forEach(function(category, index){
                  		$lot += category.lecture_category_name + '<br>';
              		});
            		+ '</td>';
            		
            		$lot += '<td><button class="tutor_lecture" value="' + tutorId + '">강의 목록 보기</button></td>';
            		$lot += '<td>' + tutor.tutor_score + '</td>';
//                     		$lot += '<td><button class="tutor_edit">관리하기</button></td></tr>';
            		
            		// 상세정보용 모달창
            		$lot += '<div class="modal_slot ' + tutorId + '"><div class="modal_content">';
              		$lot += '<h3>' + tutor.tutor_nickname + ' 강사의 세부정보</h3><hr>';
              		$lot += '<div>이름 : ' + tutor.member.member_name + '</div>'
              		$lot += '<div>아이디 : ' + tutor.member.member_id + '</div>'
              		$lot += '<h5>강사 사진</h5><br>';
              		$lot += '<div><img class="tutor-detail-img" src="/shallwe/tutorImages/' + tutor.tutor_img + '"></div><br>';
              		$lot += '<div>닉네임 : ' + tutor.tutor_nickname + '</div>'
              		$lot += '<div>신청 분야 :';
              		$catList.forEach(function(category, index){
              			if (index != 0)
                  			$lot += ' / ';
              			$lot += category.lecture_category_name;
              		});
              		$lot += '</div><hr>';
              		
              		$lot += '<div>자기소개<br><input class="single-input" value="' + tutor.tutor_introduce + '" disabled></div><br>';
              		$lot += '<div>이력서 : <a href="/shallwe/tutorCareer/' + tutor.tutor_career_file + '">';
              		let career = tutor.tutor_career_file;
              		$lot += career.substring(career.indexOf("_", 0) + 1, career.length) + '</a></div><hr>';
              		$lot += '<div>SNS 링크 : <a href="' + tutor.tutor_link + '">' + tutor.tutor_link + '</a></div><br>';
              		$lot += '<button class="modal_close">닫기</button></div><div class="modal_layer"></div></div>'
            	});
            	
            	$lot += '</tbody></table></div>';
            	
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
    		url: "/shallwe/admin/tutor/lecture/" + $tutorId,
    		method: "GET",
    		success: function(lectures){
    			let $tutor_Lecture = '<div class="modal-add"><div class="modal-content">';
    			$tutor_Lecture += '<h3>' + lectures[0].tutor.tutor_nickname + '강사의 강의목록</h3><hr>';
    			$tutor_Lecture += '<table class="table">';
    			$tutor_Lecture += '<thead><tr><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th></tr></thead>';
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
    			
    			$tutor_Lecture += '</tbody></table><button class="modal-close">닫기</button></div>';
    			$tutor_Lecture += '<div class="modal-layer"></div></div>';
    			
    			let cont = $cont.html() + $tutor_Lecture;
    			$cont.html(cont);
    		},
    		error: function(){
    			let $tutor_Lecture = '<div class="modal-add"><div class="modal-content"><hr>';
    			$tutor_Lecture += '<table class="table">';
    			$tutor_Lecture += '<tr><thead><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th></tr></thead>';
   				$tutor_Lecture += '<tbody><tr>등록한 강의가 존재하지 않습니다</tr></tbody></table>'
    			$tutor_Lecture += '<button class="modal-close">닫기</button></div>';
    			$tutor_Lecture += '<div class="tutor-lecture-layer"></div></div>';
    			let cont = $cont.html() + $tutor_Lecture;
    			$cont.html(cont);
    		}
    	});
    	
    	return false;
    });
    
    // 강의 목록 모달창 닫기
    $cont.on("click", ".modal-close", function(){
    	$(".modal-add").remove(".modal-add");
    	return false;
    });
    
//---------강의관리----------------------------------------------------------------------------------------

    // 강의목록 선택시
    $(".lecture-list").on("click", function(){
        $.ajax({
            url: "/shallwe/admin/lecture/list",
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
            	cancelRequest += '<th>현재 수강 인원</th><th>취소상세</th><th colspan="2">관리하기</th></tr></thead><tbody>';
            	
            	let cancelCnt = 0;
            	let cancel = '<h3 class="lecture-list-title">반려 / 취소</h3>';
            	cancel += '<table class="table finish"><thead><tr><th>강의 번호</th><th>강의 사진</th><th>카테고리</th><th>강의명</th>';
            	cancel += '<th>강의 가격</th><th>강의 상태</th><th>강의 시작일</th><th>강의 종료일</th><th>최대 인원</th><th>최소 인원</th>';
            	cancel += '<th>현재 수강 인원</th><th>사유보기</th></tr></thead><tbody>';
            	
            	lectures.forEach(function(lecture){
            		let idNumber = '' + lecture.lecture_id;
            		for (let i = idNumber.length; i < 4; i++)
            			idNumber = '0' + idNumber;
            		
            		let lectureId = lecture.lecture_id;
            		let start = formatDate(lecture.lecture_start_dt);
            		let end = formatDate(lecture.lecture_end_dt);
            		let today = formatDate(new Date());
            		
            		if (lecture.lecture_state == '승인대기'){
            			preparedCnt++;
            			prepared += '<tr class="lecture-detail" value="' + lectureId + '"><td>';
            			prepared += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
            			prepared += '<td><img src="/shallwe/lecture/' + lecture.lecture_img + '"></td>';
            			prepared += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
            			prepared += '<td>' + lecture.lecture_title + '</td>';
            			prepared += '<td>' + lecture.lecture_price + '원</td>';
            			prepared += '<td>' + lecture.lecture_state + '</td>';
            			prepared += '<td>' + start + '</td>';
            			prepared += '<td>' + end + '</td>';
            			prepared += '<td>' + lecture.lecture_max + '</td>';
            			prepared += '<td>' + lecture.lecture_min + '</td>';
            			prepared += '<td>' + lecture.lecture_current + '</td>';
            			prepared += '<td><button class="lecture-edit" value="' + lectureId + '">승인</button></td>';
            			prepared += '<td><button class="show-reject" value="' + lectureId + '">반려</button></td>';
            			
            		}else if(lecture.lecture_state == '승인' && end > today){
            			// 승인(진행중 + 시작 전 모집 중)
            			processCnt++;
            			process += '<tr class="lecture-detail" value="' + lectureId + '"><td>';
            			process += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
            			process += '<td><img src="/shallwe/lecture/' + lecture.lecture_img + '"></td>';
            			process += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
            			process += '<td>' + lecture.lecture_title + '</td>';
            			process += '<td>' + lecture.lecture_price + '원</td>';
            			process += '<td>' + lecture.lecture_state + '</td>';
            			process += '<td>' + start + '</td>';
            			process += '<td>' + end + '</td>';
            			process += '<td>' + lecture.lecture_max + '</td>';
            			process += '<td>' + lecture.lecture_min + '</td>';
            			process += '<td><button class="current" value="' + lectureId + '">';
            			process += lecture.lecture_current + '</button></td>';
            		}else if(lecture.lecture_state == '승인' && today >= end){
            			// 완료
            			finishCnt++;
            			finish += '<tr class="lecture-detail" value="' + lectureId + '"><td>';
            			finish += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
            			finish += '<td><img src="/shallwe/lecture/' + lecture.lecture_img + '"></td>';
            			finish += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
            			finish += '<td>' + lecture.lecture_title + '</td>';
            			finish += '<td>' + lecture.lecture_price + '원</td>';
            			finish += '<td>' + lecture.lecture_state + '</td>';
            			finish += '<td>' + start + '</td>';
            			finish += '<td>' + end + '</td>';
            			finish += '<td>' + lecture.lecture_max + '</td>';
            			finish += '<td>' + lecture.lecture_min + '</td>';
            			finish += '<td><button class="current" value="' + lectureId + '">';
            			finish += lecture.lecture_current + '</button></td>';
            			finish += '<td><button class="lecture-review" value="' + lectureId + '">후기보기</button></td>';
            		}else if(lecture.lecture_state == '취소대기'){
            			// 취소 요청
            			cancelRequestCnt++;
            			cancelRequest += '<tr class="lecture-detail" value="' + lectureId + '"><td>';
            			cancelRequest += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
            			cancelRequest += '<td><img src="/shallwe/lecture/' + lecture.lecture_img + '"></td>';
            			cancelRequest += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
            			cancelRequest += '<td>' + lecture.lecture_title + '</td>';
            			cancelRequest += '<td>' + lecture.lecture_price + '원</td>';
            			cancelRequest += '<td>' + lecture.lecture_state + '</td>';
            			cancelRequest += '<td>' + start + '</td>';
            			cancelRequest += '<td>' + end + '</td>';
            			cancelRequest += '<td>' + lecture.lecture_max + '</td>';
            			cancelRequest += '<td>' + lecture.lecture_min + '</td>';
            			cancelRequest += '<td>' + lecture.lecture_current + '</td>';
            			cancelRequest += '<td><button class="lecture-reason" value="' + lectureId + '">취소정보</button></td>';
            			
            			if (lecture.lecture_state == '취소대기'){
            				cancelRequest += '<td><button class="lecture-edit" value="' + lectureId + '">취소승인</button></td>';
            				cancelRequest += '<td><button class="lecture-edit" value="' + lectureId + '">복구</button></td>';
            			}	
            		}else{
            			//취소 or 반려
            			cancelCnt++;
            			cancel += '<tr class="lecture-detail" value="' + lecture.lecture_id + '"><td>'
            			cancel += lecture.lectureCategory.lecture_category_id + idNumber + '</td>';
            			cancel += '<td><img src="/shallwe/lecture/' + lecture.lecture_img + '"></td>';
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
            				cancel += '<td><button class="lecture-reason" value="' + lectureId + '">취소사유</button></td>';
           				else if (lecture.lecture_state == '반려')
            				cancel += '<td><button class="lecture-reason" value="' + lectureId + '">반려사유</button></td>';
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
    	window.open("/shallwe/lectures/detail?lecture_id=" + $lectureId, "_blank");
    	
    	return false;
    });
    
    // 수강하고 있는 회원 목록 보기
    $cont.on("click", ".current", function(){
		let lectureId = $(this).attr("value");
		
		$.ajax({
			url: "/shallwe/admin/history/" + lectureId,
			method: "GET",
			success: function(historyList){
				let historyModal = '<div class="modal-add"><div class="modal-content">';
				
				if (historyList != null){
					historyModal += '<div>최대 신청 인원 수 : ' + historyList[0].lecture.lecture_max;
					historyModal += '/ 현재 신청 인원 수 : ' + historyList[0].lecture.lecture_current + '</div>';
					historyModal += '<table class="table"><thead><tr><th>순서</th><th>아이디</th><th>이름</th><th>신청일</th></tr>';
					historyModal += '</thead><tbody>';
					historyList.forEach(function(history, index){
						let idx = index + 1;
						historyModal += '<tr class="member-detail" value="' + history.member.member_id + '"><td>' + idx + '</td>';
						historyModal += '<td>' + history.member.member_id + '</td>';
						historyModal += '<td>' + history.member.member_name + '</td>';
						historyModal += '<td>' + formatDate(history.payment_dt) + '</td></tr>';
					});
					historyModal += '</tbody></table><button class="modal-close">닫기</button></div>';
					historyModal += '<div class="modal-layer"></div></div>';
					
					let cont = $cont.html() + historyModal;
					$cont.html(cont);
				}else
					alert("신청 인원이 없습니다");
					
			},
			error: function(data){
				alert("에러에러");
				$(".lecture-list").trigger("click");
			}
		});
    
		return false;
    });
    
    
    // 회원 상세정보 보기
    $cont.on("click", ".member-detail", function(){
    	let $memberModal = '<div class="modal-add"><div class="modal-content">';
//     			$memberModal += '<h3>' + historyList[0].member.member_name + ' 회원의 수강목록</h3><hr>';
		$memberModal += '<table class="table">';
		$memberModal += '<thead><tr><th>순서</th><th>강의번호</th><th>강의명</th><th>상태</th><th>신청/취소일</th></tr>';
		$memberModal += '</thead><tbody>';
	
//    				historyList.forEach(function(history, index){
//     				let idx = index + 1;
//     				let lecture = history.lecture;
//     				$memberModal += '<tr class="lecture-detail" value="' + lecture.lecture_id + '">';
//     				$memberModal += '<td>' + idx + '</td>';
//     				$memberModal += '<td>' + lecture.lectureCategory.lecture_category_name + '</td>';
//     				let state = lecture.lecture_state;
//     				$memberModal += '<td>'+ state +'</td>';
//     				if (state == "신청")
//     					$memberModal += '<td>' + lecture.payment_dt + '</td>';
//    					else
//     					$memberModal += '<td>' + lecture.cancel_dt + '</td>';
				
//     				$memberModal += '</tr>';
//     			});
		
		$memberModal += '</tbody></table><button class="modal-close">닫기</button></div>';
		$memberModal += '<div class="modal-layer"></div></div>';
		
		let cont = $cont.html() + $historyModal;
		$cont.html(cont);
    	return false;
    });
    
    // 강의 승인/취소 승인/복구하기
    $cont.on("click", ".lecture-edit", function(){
    	let $tatus = $(this).html();					// 변경할 강의 상태
    	let isTrue = confirm($tatus + " 하시겠습니까?");
    	
    	if (isTrue){
        	let approve = $(this).attr('value');		// 강의 ID
        	
        	$.ajax({
        		dataType: "json",													
// 	            		beforeSend : function(xhr){
// 	            			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");		
// 	            		},																		
        		url: "/shallwe/admin/lecture/status/" + approve,
        		method: "PATCH",
        		contentType: 'application/json-patch+json; charset=utf-8',
        		data: JSON.stringify({ status : $tatus }),
        		
        		success: function(data){
        			alert(data.success);
        			$(".lecture-list").trigger("click")
        		},
        		error: function(xhttr){
// 	            			if (xhttr.status == 200)
// 	            				location.replace('/shallwe/login');
// 	            			else
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
		
		let $lot = '<div class="modal-add"><div class="modal-content">';
		$lot += '<h3>강의 반려하기</h3><br>';
		
		$lot += '<label for="reject_category">반려 사유 : </label>';
		$lot += '<select name="reject_category" id="reject_category">';
		$lot += '<option value="unsuit">부적절한 제목/사진 사용</option>';
		$lot += '<option value="lewdNviolent">외설적, 폭력적인 내용 포함</option>';
		$lot += '<option value="illegal">불법적이거나 부당한 행위</option>';
		$lot += '<option value="lack">부족한 내용설명</option><br>';
		$lot += '<option value="etc">기타</option></select><br>';
		$lot += '</select><br><label for="reject_reason">세부 사유</label><br>';
		$lot += '<input id="reject_reason" name="reject_reason" placeholder="세부 내용을 작성해주세요"></input><br>';
		$lot += '<br><button class="reject-lecture" value="' + $lectureId + '">전송</button>';
		$lot += '<button class="modal-close">취소</button></div>';
		$lot += '<div class="modal-layer"></div></div>';
		
		let cont = $cont.html() + $lot;
		$cont.html(cont)
		
    	return false;
    });
	
    
    // 강의 반려하기
    $cont.on("click", ".reject-lecture", function(){
    	$lectureId = $(this).attr("value");		// 강의 ID
    	let $reject_category = $("#reject_category").val();
    	let $reject_reason = $("#reject_reason").val();
    	
    	$.ajax({
    		dataType: "json",													
//             		beforeSend : function(xhr){
//             			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");		
//             		},
    		url: "/shallwe/admin/lecture/status/" + $lectureId,
    		method: "PATCH",
    		contentType: "application/json-patch+json; charset=utf-8;",
			data : JSON.stringify({"status" : "반려", "reject_category" : $reject_category, "reject_reason" : $reject_reason }),
    		success: function(data){
    			alert(data.success);
       			$(".lecture-list").trigger("click");
    		},
    		error: function(xhttr){
//             			if (xhttr.status == 200){
//             				location.replace('/shallwe/login');
//             				$(".lecture-list").trigger("click")
//             			}
//            				else
    		}
    		
    	});
    	
    	return false;
    })
    
    
    // 취소/반려 사유 보기
    $cont.on("click", ".lecture-reason", function(){
    	let lectureId = $(this).attr('value');	// 강의 번호
    	let reasonType = $(this).html();		// 취소사유인지 반려사유인지

    	$.ajax({
    		url: "/shallwe/admin/reason/" + lectureId,
    		method: "GET",
    		data: { rejectOrCancel : reasonType },
    		success: function(lectureDetail){
    			let modal = '<div class="modal-add"><div class="modal-content">';
            	modal += '<div><span class="reason-modal-tutor">' + lectureDetail.lecture.tutor.tutor_nickname;
            	modal += '</span>강사의<span class="reason-modal-tutor">' + lectureDetail.lecture.lecture_title;
            	modal += '</span>강의<span class="reason-modal-tutor">' + reasonType + '</span>';
    			modal += '</div><hr>';
    			if (reasonType == "취소사유" || reasonType == "취소정보"){
        			modal += '<h4>사유 :</h4><input class="reject-detail" disabled value="';
    				modal += lectureDetail.lecture_cancel_reason + '"></input>';
    			}
   				else{
    				modal += '<div>반려적용 일 : ' + formatDate(lectureDetail.lecture_reject_dt) + '</div><br>';
   					modal += '<div>반려 키워드 : ' + lectureDetail.rejectCategory.reject_category_value + '</div><br>';
        			modal += '<h4>사유 :</h4><input class="reject-detail" disabled value="';
    				modal += lectureDetail.lecture_reject_reason + '"></input><br>';
   				}
    			modal += '<button class="modal-close">닫기</button></div>';
    			modal += '<div class="modal-layer"></div></div>';
    			
    			let cont = $cont.html() + modal;
    			$cont.html(cont);
    		},
    		error: function(data){
    			let modal = '<div class="modal-add"><div class="modal-content">';
            	modal += '<div>' + reasonType + '목록을 불러오는데 실패했습니다</div>';
    			modal += '<button class="modal-close">닫기</button></div>';
    			modal += '<div class="modal-layer"></div></div>';
    			let cont = $cont.html() + modal;
    			$cont.html(cont);
    		}
    	});
    	
    	return false;
    });
    
    // 종료된 강의 후기보기
    $cont.on("click", ".lecture-review", function(){
    	let $lectureId = $(this).attr("value");
    	let win = window.open("/shallwe/lectures/detail?lecture_id=" + $lectureId, "_blank");
    	win.window.scrollTo(0, 800);
    	return false;
    });
    
//---------설정하기----------------------------------------------------------------------------------------           
    // FAQ 조회
    $(".faq").on("click", function(){
    	$.ajax({
    		url: "/shallwe/admin/faq/list",
    		method: "GET",
    		success: function(faqList){
    			let $lot = '<h2>설정 - FAQ 관리</h2><hr><button class="faq-insert-modal">FAQ 추가하기</button><br>';
    			$lot += '<table class="table"><thead><tr><th>번호</th><th>질문</th><th>답변</th><th>관리</th><th>삭제</th></tr></thead>';
    			$lot += '<tbody>';
				
    			faqList.forEach(function(faq){
    				$lot += '<tr><td>' + faq.faq_id + '</td>';
    				$lot += '<td>' + faq.faq_question + '</td>';
    				$lot += '<td>' + faq.faq_answer + '</td>';
    				$lot += '<td><button class="faq-change-modal" value="' + faq.faq_id + '">관리하기</button></td>';
    				$lot += '<td><button class="faq-delete" value="' + faq.faq_id + '">삭제하기</button></td></tr>';
    			});
    			
    			$lot += '</tbody>';
    			$lot += '</table>';
    			
    			$cont.html($lot);
    		}
    	});
    	
        $cont.html("");
        
        return false;
    });
    
    // FAQ 추가용 모달 화면에 추가하기
    $cont.on("click", ".faq-insert-modal", function(){
    	let $lot = '<div class="modal-add"><div class="modal-content">';
		$lot += '<h3>FAQ 추가하기</h3><hr>';
		$lot += '<form id="faq-insert"><div>질문 : <input class="faq-question" name="faq_question"></div><br>';
		$lot += '<div>답변 : <input class="faq-answer" name="faq_answer"></div><br>';
		$lot += '</form><button class="faq-insert">등록</button><button class="modal-close">닫기</button>';
		$lot += '</div><div class="modal-layer"></div></div>';
  		
    	let cont = $cont.html();
    	$cont.html(cont + $lot);
    	
    	return false;
    });
    
    // FAQ 추가
    $cont.on("click", ".faq-insert", function(){
    	let faq = $("#faq-insert").serializeArray();
    	
    	$.ajax({
    		dataType: "json",													
//             		beforeSend : function(xhr){
//             			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 					},
    		url:"/shallwe/admin/faq",
    		method:"POST",
    		data: faq,
    		success: function(data){
    			alert(data.success);
    			$(".faq").trigger("click");
    		},
    		error: function(data){
    			alert(data.errMsg);
    			$(".faq").trigger("click");
    		}
    	});
    	
    	return false;
    });
    
    // FAQ 수정 모달 보이기
    $cont.on("click", ".faq-change-modal", function(){
    	let $faqId = $(this).attr("value");
    	
    	$.ajax({
    		url: "/shallwe/admin/faq/" + $faqId,
    		method: "GET",
    		success: function(faq){
    			let $lot = '<div class="modal-add"><div class="modal-content">';
    			$lot += '<h3>FAQ 수정하기</h3><hr>';
    			$lot += '<form id="faq-change"><div>질문 : <input class="faq_question" name="faq_question"';
    			$lot += 'value="' + faq.faq_question + '"></div><br>';
    			$lot += '<div>답변 : <input class="faq_answer" name="faq_answer"';
    			$lot += 'value="' + faq.faq_answer + '"></div><br></form>';
    			$lot += '<button class="faq-change" value="' + faq.faq_id + '">등록</button>';
    			$lot += '<button class="modal-close">닫기</button>';
    			$lot += '</div><div class="modal-layer"></div></div>';
          		
            	let cont = $cont.html();
            	$cont.html(cont + $lot);
    		},
    		error: function(){
    			alert("수정을 시도하던 중 에러가 발생했습니다");
    			$(".faq").trigger("click");
    		}
    		
    	});
    	
    	return false;
    });
    
    // FAQ 수정
    $cont.on("click", ".faq-change", function(){
    	let $faqId = $(this).attr("value");
		let faq = "{ \"faq_question\" : \"" + $("input.faq_question").val() + "\", \"faq_answer\" : \"" + $("input.faq_answer").val() + "\" }";

    	$.ajax({
    		dataType: "json",													
//             		beforeSend : function(xhr){
//         			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");		
//         			},
    		url:"/shallwe/admin/faq/" + $faqId,
    		method: "PUT",
    		contentType: "application/json; charset=utf-8;",
    		data: faq,
    		success: function(data){
    			alert(data.success);
    			$(".faq").trigger("click");
    		},
    		error: function(data){
    			alert(data.errMsg);
    			$(".faq").trigger("click");
    		}
    	});
    	
    	return false;
    });
    
    // FAQ 삭제
	$cont.on("click", ".faq-delete", function(){
		
		if (confirm("삭제하시겠습니까?")){
			let $faqId = $(this).attr("value");
			
			$.ajax({
				dataType: "json",
        		url:"/shallwe/admin/faq/" + $faqId,
        		method:"DELETE",
        		success: function(data){
        			alert(data.success);
        			$(".faq").trigger("click");
        		},
        		error: function(data){
        			alert(data.errMsg);
        			$(".faq").trigger("click");
        		}
        	});
		}
		
		return false;
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
   