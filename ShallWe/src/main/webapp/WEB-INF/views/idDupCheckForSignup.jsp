<%@page import="com.shallwe.model.MemberInfoBean"%>
<%@page import="com.shallwe.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	//memberId 가져오기
	String id = request.getParameter("memberId");

	MemberInfoBean member = MemberDAO.getMemberDAO().getMemberId(String usertype);
%>
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
	<form name="idCheckForm">
		<table width="100%" height="90%">
			<tr><td>&nbsp;</td></tr>
			<% if (member!=null){//아이디가 중복될 경우 %>
				<tr>
					<td align="center" class="t1">
						입력한<font color="red"[<%=memberId%>]</font>는 이미 사용중인 ID입니다.<br><br>
					</td>
				</tr>
				<tr>
					<td align="center" class="bottom"
						<input type="text" name="memberId" maxlength="15" autocomplete="off" pattern="[a-z0-9]" />
						<button type ="bottom" onclick="idCheck(idCheckForm);">확인</button> </td></tr>
			<% } else{//아이디가 중복되지 않은경우 %>
				<tr>
					<td align="center" class="t1">
						입력한 <font color="blue">[<%=memberId%>]</font>는 사용 가능한 아이디입니다.<br><br>
					</td>
				</tr>
				<tr>
					<td align="center" valign"bottom">
						<button type="button" onclick="onClose();">사용</button>
					</td>
				</tr>
			<%} %>
		</table>
	
	</form>
	<script>
		function idCheck(signupform){
			if(form.memberId.value=""){
				alert("아이디 입력 후 중복확인 버튼을 눌러주세요.");
				form.memberId.focus();
				return;
			}
					
			if(!isID(form.memberId)){
				alert("아이디가 적절하지 않습니다.\n영문자와 숫자만 사용해 주세요.");
				return;
			}
		
			//입력 데이터 전달
			form.action="idCheck.jsp";
			form.method="POST";
			form.submit();
		}
		
		function onClose(){
			opener.join.memberId.value="<%memberId%>";
			opener.join.idCheckResult.value="1";
			
			window.close();
		}
	</script>
</body>
</html>


















