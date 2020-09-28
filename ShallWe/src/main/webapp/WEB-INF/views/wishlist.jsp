 <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WishList</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- CSS here -->
	<link rel="stylesheet" href="/shallwe/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/shallwe/assets/css/style.css">
<style type="text/css">

	body.wishbody{ 		/*장바구니body*/
		background-color: #f5f5f0;
		background-color: #f5f5f0;
		font-size: 13pt;
		min-width: 1480px;
		width:100%;
		padding: 50px 0;
	}
	#frame{		/*전체 div*/
		width: 80%;
		margin: 0 auto;
		padding: 40px 40px;
		background-color: #fff;
	}
	#frame2{	/*페이지 맨 위 header가 아니라 // 장바구니 홈 > 장바구니*/
		border-bottom: solid 1px #e0e0eb;
		padding-bottom: 10px;
	}
	.home{  /*홈 > 장바구니*/
		float: right;
	}
	
	table.calculation1{				/*계산테이블*/
		clear: both;
		border: solid 1px #e0e0eb;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width: 100%;
		font-size: 10pt;
	}
	table.calculation1 th{			/*계산테이블*- 제목*/
		border: solid 1px #e0e0eb;
		padding: 10px 0;
	}
	table.calculation1 td{			/*계산테이블*- 내용*/
		border: solid 1px #e0e0eb;
		text-align: center;
	}
	table.calculation2{			/*총 결제예정금액 테이블*/
		border: solid 1px #e0e0eb;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width: 100%;
		font-szie: 10pt;
	}
	table.calculation2 th{			/*총 결제예정금액 테이블- 제목*/
		border: solid 1px #e0e0eb;
	}
	table.calculation2 td{			/*총 결제예정금액 테이블- 내용*/
		border: solid 1px #e0e0eb;
		text-align:center;
	}
	.price{							/*calculation2테이블 - 가격 ~원*/
		font-size: 20pt;
		font-weight: bold;
	}
	/* bootstrap 버튼*/
	.bttn{
		border: none;
		color: white;
		padding: 5px 10px;
		font-size: 13px;
		cursor: pointer;
		border-radius: 5px;
	}	
	.default {background-color: #fff; border: solid 1px gray; color: black;}
	.default:hover {background:#ddd;}
	.backbtn {background: #fff; border: solid 1px gray;}
	
	/*선택상품 삭제 float*/
	.btnfloat{ float:left;}
	
	/*선택상품 장바구니, 견적서출력 float*/
	.btnfloat2{ float:right;}
	
	/*혹시몰라서 clear 하나 줌*/
	.clearboth{clear:both;}

	.footerbtn{float:right; font-weight: bolder; font-size:12pt; border-radius: 3px;}	/*쇼핑 계속하기 button*/
	
	#allProduct, #productClear, #footerbtn{padding:11px 25px;}  /*전체상품주문 선택상품주문 쇼핑계속하기 button 통합*/
	
	#allProduct{margin-left:140px; background-color:#264d73; color:#fff; font-weight:bold; font-size:12pt}  /*전체상품주문 button*/
	
	#productClear{background-color:gray; color:#fff; font-weight:bold; font-size:12pt;} /*선택상품주문 button*/
	
	.aa:hover{cursor:pointer;} /*구매상품*/
</style>
<!-- <script type="text/javascript" src="/JqueryStudy/js/jquery-3.3.1.min.js"></script> -->
<!-- <script type="text/javascript"> -->

<!-- </script> -->
</head>
<body class="wishbody">
	<div id="frame">
		<form>
			<div id="frame2">
				<span style="font-size: 16pt; font-weight: bold;">장바구니</span>
				<span class="home"> 홈 > 장바구니</span>
				<span> </span>
			</div>
			<br/>
			
			<!-- ìíì ë³´ íì´ë¸ -->
			<div>
				<table class="calculation1">
				<thead>
					<tr>
					<th colspan="10" style = "text-align: left; padding-left: 10px;">일반상품(1)</th>
					</tr>
					<tr>
						<th><input type="checkbox" name="checkbox" id="check"/></th>
						<th><span>이미지</span></th>
						<th style="width:500px;"><span>강의정보</span></th>
						<th style="width:50px">판매가</th>				
						<th style="width:50px">합계</th>				
						<th">선택</th>	
					</tr>
					</thead>
				<tbody>
					<tr style="height: 90px; background-color: #fff;">
						<td style="text-align: left; text-align:center; border-right:none;">
							<input type="checkbox" name="checkbox"/>
						</td>
						<td style="border-left: none; border-right: none;"><img style="width: 80%;" src="/shallwe/assets/img/logo/03.jpg"></td>
						
						<td style="text-align: left; padding-left:10px; border-left:none; font-weight: bold;">김상하에 대해 알아보겠습니다</td>
						
						<td><span style="padding-left: 10px;">0</span>원</td>
						
						<td><span>0</span>원</td>

						<td>
							<button class="bttn default" style="border-radius:3px; width:90px; margin-bottom: 3px; font-size:11px; background-color: #264d73;color:#fff; font-weight:bold;">주문하기</button>
							<button class="bttn default" style="border-radius:3px; width:90px; margin-bottom: 3px; font-size:11px; ">관심수업등록</button>
							<button class="bttn default" style="border-radius:3px; width:90px; margin-bottom: 3px; font-size:11px; ">x삭제</button>
						</td>
						</tr>
												
				</tbody>

				<tfoot>
					<tr style="height: 60px;">
						<td colspan="5"	style="border-right:none; text-align: left; padding-left:10px;">
							<span>[기본배송]</span>
						</td>
						<td colspan="5" style="border-left:none; text-align:right; padding-right:10px;">
							상품금액 <span>20000</span> + <span> = 합계</span>&nbsp;<span style="font-weight:bold; font-size:15pt;">20000</span>
						</td>
					</tr>
				</tfoot>
				</table>
				
				<div style="border:solid 1px #e0e0eb; padding: 15px 0;">
				<img src="/shallwe/assets/img/elements/icon.png" style= "exclamation:before content=''; display: inline-block; margin:0 5px 0 13px; width:15px; height:14px; no-repeat: -336px -5px;vertical-align:-2px;">
<!-- 					<img src="/shallwe/assets/img/elements/primary-check.png" style ="margin-left: 5px; position: relative;"> -->
					<span style="font-size: 10pt; color :gray;">할인 적용 금액은 주문서 작성의 결제예정금액에서 확인 가능합니다</span>
				</div>
			</div>
			<div style="margin:10px 0;">
				<span style="margin: 0 10px;" class="btnfloat">선택상품을</span>
				<button class="bttn default btnfloat" style="background-color:gray; color:#fff;">x 삭제하기</button>&nbsp;

				<button class="bttn default backbtn btnfloat2">장바구니 비우기</button>
				<button class="bttn default backbtn btnfloat2">견적서 출력</button>
				<span class="clearboth"></span>
			</div>				
			<br/><br/>
			
			<!--결제 예정금액 테이블 -->
			
			<table class="calculation2">
				<tr>
					<th style="text-align:center;">총 주문금액</th>
					<th style="width:750px; padding: 22px 0; text-align:center;"><span>결제예정금액</span></th>
				</tr>
				
				<tr style="background-color:#fff;">
					<td style="padding: 22px 0;"><span class="price">0</span>원</td>
					<td>=<span class="price">0</span>원</td>
				</tr>
			</table>				
			<br/><br/>
			
			<div align="center">
				<button class="bttn default" id="allProduct">전체상품주문</button>
				<button class="bttn default backbtn" id="productClear">선택상품주문</button>
				<button class="bttn default footerbtn" id="footerbtn">쇼핑계속하기</button>
				<span class="clearboth"></span>
			</div>			
			<br/><br/><br/><br/><br/>
			
		
		</form>
	</div>

</body>
</html>