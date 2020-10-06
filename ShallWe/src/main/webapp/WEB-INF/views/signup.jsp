<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Shall We?</title>
<link rel="stylesheet" type="text/css" href="/shallwe/assets/css/signupdefault.css">
<link rel="stylesheet" type="text/css" href="/shallwe/assets/css/signupstyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<a href="#contents" class="skip">본문바로가기</a>
	<main>
        <div class="contents">
            <h2 class="h2">회원가입</h2>
            <p>배움에는 나이가 없다. 혼자보단 둘, 둘보다는 셋, 함께 배우시겠습니까? Shall We?</p>
            <ol class="step">
            </ol>
            
		<form id="signupform" method="post" onsubmit="return submitCheck(signupform);">
		
            <h3 class="h3">회원정보</h3>
          	<table class="type1">
          	<caption></caption>
				<colgroup>
				<col style="width:170px;">
				<col>
				</colgroup>
				<tbody>
					<tr>
					<th><span>필수입력</span>아이디</th>
						<td>
							<input name="memberId" type="text" style="width:300px;" maxlength="15" autocomplete="off" pattern="[a-z0-9]" title="아이디 중복체크 해 주세요" required onkeyup="idCheckInit(signupform);">
							<input class="memberId" name="idCheckResult" type="hidden"> 
							<a onclick="idCheck(signupform)" class="btn_type3">아이디 중복확인</a>
							<span class="exclamation">영어 소문자 + 숫자 조합으로 해주세요</span>
							<p id="usableid" style="color:red; font-weight:bold">사용 가능한 아이디 입니다</p>
							<p id="unusableid"style="color:red; font-weight:bold">이미 등록된 아이디 입니다</p>
						</td>
					</tr>
				
					<tr>
					<th><span>필수입력</span>비밀번호</th>
						<td>
						<input id="mPassword" name="memberPwd" type="password" style="width:300px;" maxlength="15" autocomplete="off" pattern="[a-z0-9]" title="영어 소문자 +숫자 조합으로 해주세요" required>
						<span class="exclamation">비밀번호는 4~10자리로, 영어소문자+숫자 조합으로 입력해주시기 바랍니다.</span>
						</td>
					</tr>
			
					<tr>
						<th><span>필수입력</span>비밀번호 확인</th>
						<td>
						<input id="mPasswordCheck" name="memberPwdCheck" type="password" style="width:300px;" maxlength="15" autocomplete="off" pattern="[a-z0-9]" title="영어 소문자 +숫자 조합으로 해주세요" required>
						</td>
					</tr>
					
					<tr>
						<th><span>필수입력</span>성별</th>
						<td>
							<input type="radio" id="ra1_1" name="memberSex" required value="M"><label for="ra1_1">남성</label>
							<input type="radio" id="ra1_2" name="memberSex" required value="F"><label for="ra1_2">여성</label>
						</td>
					</tr>
					
					<tr>
						<th><span>필수입력</span>이름</th>
						<td>
							<input name="memberName" type="text" style="width:150px;" maxlength="5" autocomplete="off" pattern="[가-힣a-zA-Z]" required>
						</td>
					</tr>
					
					<tr>
						<th><span>필수입력</span>이메일 주소</th>
						<td>
							<input id="memEmail" name="memberEmail1" type="text" style="width:210px;" pattern="[a-zA-Z0-9]*" required>
							@
							<input id="domain" name="memberEmail2" type="text" style="width:194px; background:#DCDCDC" readonly pattern="[a-z]+[.]+[a-z]+[.]*[a-z]*" required>
							<select id="select_domain" name="select_domain" onchange="InsertTitle(this.value)">
								<option>:::선택하세요:::</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="">:::직접입력:::</option>
							</select>
							<input id="memberEmail" name="memberEmail" type="hidden">
						</td>
					</tr>
					
					<tr>
						<th><span>필수입력</span>휴대폰번호</th>
						<td>
							<select id="memberPhone1" name="memberPhone1">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
							<option value = "018">018</option>
							<option value = "019">019</option>
							</select>
							<input id="mPhone1" name="memberPhone2" type="text" style="width:150px;" maxlength="4" pattern="[0-9]" title="숫자를 입력하세요" required>
						 	<input id="mPhone2" name="memberPhone3" type="text" style="width:150px;" maxlength="4" pattern="[0-9]" title="숫자를 입력하세요" required>
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
							<input type="hidden" id="favorite1" name="favorite1.lecture_category_id" value=""> 
							<input type="hidden" id="favorite2" name="favorite2.lecture_category_id" value=""> 
							<input type="hidden" id="favorite3" name="favorite3.lecture_category_id" value=""> 
							<span class="exclamation">최대 3개의 중복선택이 가능합니다.</span>
						</td>
					</tr>	
					
				</tbody>
          	</table>
            <div class="btn_center">
                <a class="btn_type1" type="submit" onclick="signUp()">회원가입</a>
                <a href="/shallwe" class="btn_type2">취소</a>
            </div>
        </form>
        </div>
	</main>
	<footer>
		<div class="clear">
			<div class="left">
			</div>
		</div>
	</footer>
	<script>
					//-------------------------아이디 중복 유무 검사 Start-------------------------
						function idCheck(signupform){
							//-----------------아이디 입력 확인-----------------
							if(form.memberId.value==""){
								alert("아이디 중복확인 해 주세요");
								form.memberId.focus();
								return;
							}
							
							//-----------------입력 아이디 유효성 검사-----------------
							if(!isID(form.memberId)){
								alert("아이디가 적절하지 않습니다.\n 영문자와 숫자만 사용해 주세요.");
								return;
							}
							
							//--------------아이디 중복 유무 검사 및 결과를 출력하는 팝업창 생성------------
							var url="idCheck.jsp?memberId="+form.memberId.value;
							window.open(url, "아이디중복확인", "width=300, height=200, left=450, top200");
						}
					//-------------------------아이디 중복 유무 검사End-------------------------				

					
					//--------------아이디 입력태그에서 키보드를 누른경우 호출되는 함수--------------
					//-->아이디 입력값이 변경되었으므로  idCheckResult 폼변수의 값을 0으로 초기화
							function idCheckInit(signupform){
								if(form.idCheckResult.value=="1"){
									form.idCheckResult.value="0";
								}
							}
							
							function submitCheck(signupform){
								if(is_null_field(signupform)){
									return false;
								}
								
								if(form.idCheckResult.value=="0"){
									alert("아이디 중복확인을 반드시 확인해 주세요");
									return false;
								}
								
								if(!isID(form.memberId)){
									alert("아이디가 적절하지 않습니다.\n영문자와 숫자만 사용해 주세요.");
									return false;
								}
								
								if(!isSame(form.memberPwd, form.memberPwdCheck)){
									alert("비밀번호와 재입력이 일치하지 않습니다..");
									return false;
								}
								return true;
							}
							
							function is_null_field(signupform){
								if(is_null_field(form.memberId.value) || is_space(form.memberId_value)){
									alert("아이디를 입력하여 주세요.");
									form.memberId.focus();
									return true;
								}
								
								if(is_null(form.memberPwd.value) || is_space(form.memberPwd.value)){
									alert("비밀번호를 입력하여 주세요.");
									form.memberPwd.focus();
									return true;
								}
								
								if(is_null(form.memberName.value) || is_space(form.memberName.value)){
									alert("이름을 입력하여 주세요");
									focus.memberName.focus();
									return true;
								}
								
								if(is_null(form.memberEmail1.value) || is_space(form.memberEmail1.value)){
									alert("이메일을 입력하여 주세요");
									focus.memberEmail1.focus();
									return true;
								}

								if(is_null(form.memberEmail2.value) || is_space(form.memberEmail2.value)){
									alert("도메인을 입력하여 주세요");
									focus.memberEmail2.focus();
									return true;
								}
								
								if(is_null(form.memberPhone1.value) || is_space(form.memberPhone1.value)){
									alert("통신사 번호를 설정하여 주세요");
									focus.memberPhone1.focus();
									return true;
								}

								if(is_null(form.memberPhone2.value) || is_space(form.memberPhone2.value)){
									alert("핸드폰 번호를 설정하여 주세요");
									focus.memberPhone2.focus();
									return true;
								}
								
								if(is_null(form.memberPhone3.value) || is_space(form.memberPhone3.value)){
									alert("핸드폰 번호를 설정하여 주세요");
									focus.memberPhone3.focus();
									return true;
								}
								
								
							}
							
						
							
								
	
					
					//-------------------------이메일 선택 옵션 Start-------------------------
					function InsertTitle(str) {
						if(str !=""){
							document.getElementById("domain").value = str;
							document.getElementById("domain").readOnly = true;
							document.getElementById("domain").style.background = "#DCDCDC";
						}else{
							document.getElementById("domain").value = "";
							document.getElementById("domain").readOnly = false;
							document.getElementById("domain").style.background = "#FFFFFF";
							document.getElementById("domain").focus();
							
						}
					}				
					//-------------------------이메일 선택 옵션 End-------------------------
					

					
					//------------------------- 회원가입 Start-------------------------					
					function signUp(){
						var checkArray = new Array();
						$("input[name=favorites]:checked").each(function(){
							checkArray.push($(this).val());

							for(check in checkArray){
							$('#favorite1').val(checkArray[0]);
							$('#favorite2').val(checkArray[1]);
							$('#favorite3').val(checkArray[2]);
							};
						});
						var memPhone = null;
						var memPhone1 = $("#memberPhone1").val(); 
						var memPhone2 = $("input[name=memberPhone2]").val(); 
						var memPhone3 =  $("input[name=memberPhone3]").val();
						memPhone =  memPhone1+memPhone2+memPhone3;
						$("#memberPhone").val(memPhone);
						
						var memEmail = $("#memEmail").val();
						var memDomain = $("#domain").val();
						var memberEmail = null; 
						memberEmail = memEmail+"@"+memDomain;
						$("#memberEmail").val(memberEmail);
						
						console.log("회원가입중.....");
						$.ajax({
							url:"/shallwe/member/signup",
							type:"POST",
							data:$("#signupform").serialize(),
							success:function(response){
								if(response=="success"){
									alert("반갑습니다. 회원가입이 완료되었습니다.^^");
									location.href= "/shallwe";
								}else if(response!="success"){
									alert("뭔가잘못되었습니다");
								}
							}
						})
									return false;
					}
					//------------------------- 회원가입 End-------------------------	
					

	</script>
</body>
</html>


















