<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="myInfo" value="${requestScope['myInfo']}"/>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Shall We?</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/signupdefault.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/signupstyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {

	// start 수정하기 요청 이벤트
	var btn_type1Obj = $('a.btn_type1');
	btn_type1Obj.on('click', function (event) {

		// 전화번호 변경시
		var memberPhone = null;
		var memberPhone1 = $("#memberPhone1").val();
		var memberPhone2 = $("input[name=memberPhone2]").val();
		var memberPhone3 =  $("input[name=memberPhone3]").val();
		memberPhone =  memberPhone1+memberPhone2+memberPhone3;
		//$("#memberPhone").val(memberPhone);

		// 이메일 변경시
		var memberEmail = null;
		var memEmail = $("#memEmail").val();
		var memDomain = $("#domain").val();
		memberEmail = memEmail+"@"+memDomain;
		//$("#memberEmail").val(memberEmail);

		// 비밀번호 변경 시
		var memberPassword = $('input[type=password]').val();

		
// 		//-------------------------체크박스 갯수 제한 Start---------------------- 
// 		$("input[type='checkbox']").on('click',function(e){
// 		var $chkCnt = $("input:checkbox[name='favorites']:checked").length;
// 			if($chkCnt > 3){
// 			$(this).attr("checked",false)
// 		$("input:checkbox[name='favorites']:checked").prop('checked', false);
// 			alert("관심분야는 최대 3개 까지 선택가능합니다");
// 		}
// 		});
// 		//-------------------------체크박스 갯수제한 End------------------------
		
		// 선호 하는 분야 변경 시
		var favorite_list = new Array();
		$("input[name=favorites]:checked").each(function(){
			favorite_list.push($(this).val());

			for (var i=0; i < favorite_list.size(); i++) {
				console.log(favorite_list[i]);
			}
// 			for(check in favorite_list){
// 				$('#favorite1').val(checkArray[0]);
// 				$('#favorite2').val(checkArray[1]);
// 				$('#favorite3').val(checkArray[2]);
// 			};
		});


		$.ajax({
			url : '${contextPath}/member/myinfoModify'
			, method : "POST"
			, data : {"memberPhone" : memberPhone
						, "memberEmail" : memberEmail
						, "memberPassword" : memberPassword
						, "favorite_list" : favorite_list}
			, success : function (responseData) {
				alert("정보수정 완료 되었습니다.");
			}
		}); // end of ajax

	}); //end of 수정하기 버튼 이벤트



	// 내가 수강하고 있는 강의 목록보기
	var bodyObj = $('.myinfobody');




}); // end of load


</script>
</head>
<body>
    <!-- topbar Start -->
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
	<main>
	<div class="listing-area pt-150">
        <div class="contents">
            <h2 class="h2">내 정보 보기</h2>
            <p>배움에는 나이가 없다. 혼자보단 둘, 둘보다는 셋, 함께 배우시겠습니까? Shall We?</p>
            <ol class="step">
            </ol>

            <h3 class="h3">회원정보</h3>
          	<table class="type1">
          	<caption></caption>
				<colgroup>
				<col style="width:170px;">
				<col>
				</colgroup>
				<tbody>
				<tr>
					<th><span>필수입력</span>이름</th>
					<td>
					 	<input type="text" value="${myInfo.memberName}" readonly>
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>성별</th>
					<td>
					<c:if test="${myInfo.memberSex == 'M'}" >
						<input type="text" id="ra1_1" name="ras" readonly><label for="ra1_1">남성</label>
						<input type="text" id="ra1_2" name="ras" readonly><label for="ra1_2">여성</label>
					</c:if>
					<c:if test="${myInfo.memberSex == 'F'}" >
						<input type="text" id="ra1_1" name="ras" readonly><label for="ra1_1">남성</label>
						<input type="text" id="ra1_2" name="ras" readonly><label for="ra1_2">여성</label>
					</c:if>
					</td>
				</tr>

				<tr>
					<th><span>필수입력</span>아이디</th>
					<td>
						<input type="text" value="${myInfo.memberId}" readonly>
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>비밀번호</th>
					<td>
					<input type="password" style="width:300px;" placeholder="">
					<span class="exclamation">비밀번호는 4~10자리로 입력해주시기 바랍니다.</span>
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>비밀번호 확인</th>
					<td>
						<input type="password" value= "${myInfo.memberPwd}" style="width:300px;">
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>이메일 주소</th>
					<td>
						<input id="memEmail" name="memberEmail1" value= "${fn:substringBefore(myInfo.memberEmail, '@')}" type="text" style="width:210px;" pattern="[a-zA-Z0-9]*" required>
						@
						<input id="domain" name="memberEmail2" type="text" style="width:194px; background:#DCDCDC" readonly pattern="[a-z]+[.]+[a-z]+[.]*[a-z]*" required>

						<c:choose>
							<c:when test = "${fn:substringAfter(myInfo.memberEmail,'@') == 'gmail.com'}">
								<option value="gmail.com" selected>gmail.com</option>
							</c:when>
							<c:when test = "${fn:substringAfter(myInfo.memberEmail,'@') == 'naver.com'}">
								<option value="naver.com" selected>naver.com</option>
							</c:when>
							<c:when test = "${fn:substringAfter(myInfo.memberEmail,'@') == 'daum.net'}">
								<option value="daum.net" selected>daum.net</option>
							</c:when>
							<c:when test = "${fn:substringAfter(myInfo.memberEmail,'@') == 'yahoo.com'}">
								<option value="yahoo.com" selected>yahoo.com</option>
							</c:when>
							<c:otherwise>
								<option value="${fn:substringAfter(myInfo.memberEmail,'@')}">{fn:substringAfter(myInfo.memberEmail,'@')}</option>
         					</c:otherwise>
						</c:choose>

						<select id="select_domain" name="select_domain" onchange="InsertTitle(this.value)">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="">==직접입력==</option>
						</select>
					</td>
				</tr>

				<tr>
					<th><span>필수입력</span>휴대폰번호</th>
					<td>
						<select id="memberPhone1" name="memberPhone1">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
						</select>
						<input id="memberPhone2" name="memberPhone2" type="text" style="width:150px;" maxlength="4" pattern="[0-9]" title="숫자를 입력하세요" required>
					 	<input id="memberPhone3" name="memberPhone3" type="text" style="width:150px;" maxlength="4" pattern="[0-9]" title="숫자를 입력하세요" required>
						<input id="memberPhone" name="memberPhone" type="hidden" value="">
					</td>
				</tr>
				<tr>
					<th>선호하는 분야</th>
					<td>
						<input type="checkbox" id="chk1_1" name="favorites" class="type2" value="IT"><label for="chk1_1">IT</label>
						<input type="checkbox" id="chk1_2" name="favorites" class="type2" value="HO"><label for="chk1_2">취미</label>
						<input type="checkbox" id="chk1_3" name="favorites" class="type2" value="MA"><label for="chk1_3">마케팅</label>
						<input type="checkbox" id="chk1_4" name="favorites" class="type2" value="DE"><label for="chk1_4">디자인</label>
						<input type="checkbox" id="chk1_5" name="favorites" class="type2" value="CA"><label for="chk1_5">취업</label>
						<input type="checkbox" id="chk1_6" name="favorites" class="type2" value="BU"><label for="chk1_6">영업</label>
						<input type="checkbox" id="chk1_7" name="favorites" class="type2" value="LE"><label for="chk1_7">학습</label>
						<input type="checkbox" id="chk1_8" name="favorites" class="type2" value="SP"><label for="chk1_8">스포츠</label>
						<span class="exclamation">최대 3개의 중복선택이 가능합니다.</span>

						<input type="hidden" id="favorite1" name="favorite1.lecture_category_id" value="">
						<input type="hidden" id="favorite2" name="favorite2.lecture_category_id" value="">
						<input type="hidden" id="favorite3" name="favorite3.lecture_category_id" value="">
					</td>
				</tr>

				</tbody>
          	</table>

            <div class="btn_center">
                <a class="btn_type1">수정하기</a>
                <a href="${contextPath}/" class="btn_type2">취소</a>
            </div>
        </div>
       </div>
	</main>
	<footer>
		<div class="clear">
			<div class="left">
			</div>
		</div>
	</footer>
</body>
</html>
<jsp:include page="/WEB-INF/views/foot.jsp"></jsp:include>
