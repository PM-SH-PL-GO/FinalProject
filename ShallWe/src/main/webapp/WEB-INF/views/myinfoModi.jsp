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
					<th>상태</th>
					<td>
						<span style="height:20px; text-align:center;font-size:17px; background-color:red; color:white; margin-right:20px;">회원</span><span>강사</span>
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>이름</th>
					<td>
					 	<input type="text" value="고준식" readonly>
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>성별</th>
					<td>
						<input type="radio" id="ra1_1" name="ras" checked><label for="ra1_1">남성</label>
						<input type="radio" id="ra1_2" name="ras"><label for="ra1_2">여성</label>
					</td>
				</tr>
				
				<tr>
					<th><span>필수입력</span>아이디</th>
					<td>
						<input type="text" value="Jun6" readonly>
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
					<input type="password" style="width:300px;">
					</td>
				</tr>
				<tr>
					<th><span>필수입력</span>이메일 주소</th>
					<td>
						<input type="text" style="width:210px;">
						@
						<input type="text" style="width:194px;">
						<select>
						<option>gmail.com</option>
						<option>naver.com</option>
						<option>hanmail.net</option>
						<option>직접입력</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th><span>필수입력</span>휴대폰번호</th>
					<td>
						<select>
						<option>010</option>
						<option>011</option>
						<option>016</option>
						</select>
						<input type="tel" style="width:150px;">
					 	<input type="tel" style="width:150px;">
					</td>
				</tr>	
				<tr>
					<th>선호하는 분야</th>
					<td>
						<input type="checkbox" id="chk1_1" class="type2"><label for="chk1_1">IT</label>
						<input type="checkbox" id="chk1_2" class="type2"><label for="chk1_2">취미</label>
						<input type="checkbox" id="chk1_3" class="type2"><label for="chk1_3">마케팅</label>
						<input type="checkbox" id="chk1_4" class="type2"><label for="chk1_4">디자인</label>
						<input type="checkbox" id="chk1_5" class="type2"><label for="chk1_5">취업</label>
						<span class="exclamation">최대 3개의 중복선택이 가능합니다.</span>
					</td>
				</tr>	
				
				</tbody>
          	</table>
          	
            <div class="btn_center">
                <a href="#a" class="btn_type1">수정하기</a>
                <a href="#a" class="btn_type2">취소</a>
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

















