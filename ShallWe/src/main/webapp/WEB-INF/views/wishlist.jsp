 <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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

   body.wishbody{       /*장바구니body*/
      background-color: #f5f5f0;
      background-color: #f5f5f0;
      font-size: 13pt;
      min-width: 1480px;
      width:100%;
      padding: 50px 0;
   }
   #frame{      /*전체 div*/
      width: 80%;
      margin: 0 auto;
      padding: 40px 40px;
      background-color: #fff;
   }
   #frame2{   /*페이지 맨 위 header가 아니라 // 장바구니 홈 > 장바구니*/
      border-bottom: solid 1px #e0e0eb;
      padding-bottom: 10px;
   }
   .home{  /*홈 > 장바구니*/
      float: right;
   }
   
   table.calculation1{            /*계산테이블*/
      clear: both;
      border: solid 1px #e0e0eb;
      border-collapse: collapse;
      background-color: #f5f5f0;
      width: 100%;
      font-size: 10pt;
   }
   table.calculation1 th{         /*계산테이블*- 제목*/
      border: solid 1px #e0e0eb;
      padding: 10px 0;
   }
   table.calculation1 td{         /*계산테이블*- 내용*/
      border: solid 1px #e0e0eb;
      text-align: center;
   }
   table.calculation2{         /*총 결제예정금액 테이블*/
      border: solid 1px #e0e0eb;
      border-collapse: collapse;
      background-color: #f5f5f0;
      width: 100%;
      font-szie: 10pt;
   }
   table.calculation2 th{         /*총 결제예정금액 테이블- 제목*/
      border: solid 1px #e0e0eb;
   }
   table.calculation2 td{         /*총 결제예정금액 테이블- 내용*/
      border: solid 1px #e0e0eb;
      text-align:center;
   }
   .price{                     /*calculation2테이블 - 가격 ~원*/
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

   .footerbtn{float:right; font-weight: bolder; font-size:12pt; border-radius: 3px;}   /*쇼핑 계속하기 button*/
   
   #allProduct, #productClear, #footerbtn{padding:11px 25px;}  /*전체상품주문 선택상품주문 쇼핑계속하기 button 통합*/
   
   #allProduct{margin-left:140px; background-color:#264d73; color:#fff; font-weight:bold; font-size:12pt}  /*전체상품주문 button*/
   
   #productClear{background-color:gray; color:#fff; font-weight:bold; font-size:12pt;} /*선택상품주문 button*/
   
   .aa:hover{cursor:pointer;} /*구매상품*/
.header-area {
	min-height: unset;
	background-color: white;
}
</style>
<!-- <script type="text/javascript" src="/JqueryStudy/js/jquery-3.3.1.min.js"></script> -->
<!-- <script type="text/javascript"> -->

<!-- </script> -->
</head>
<body class="wishbody">
	<div class="topMenu">
		<jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
	</div>
	<div class="listing-area pt-150">
	   <div id="frame">
	      
	         <div id="frame2">
	            <span style="font-size: 16pt; font-weight: bold;">찜목록  </span>
	            <span class="home"> 홈 > 찜목록</span>
	            <span> </span>
	         </div>
	         <br/>
	         
	         <!-- ì  í  ì  ë³´ í  ì ´ë¸  -->
	         <div>
	            <table class="calculation1">
	            <thead>
	               <tr>
	               <th colspan="10" style = "text-align: left; padding-left: 10px;"><h3>일반상품  (${requestScope.wishListVal.size()})</h3></th>
	               </tr>
	               <tr>
	                  <th><input type="checkbox" name="checkbox" id="check"/></th>
	                  <th><span>이미지 </span></th>
	                  <th style="width:400px; text-align:center"><span>강의정보</span></th>
	                  <th style="width:100px; text-align:center"><span>강사명</span></th>
	                  <th style="width:50px">판매가 </th>            
	                  <th>선택  </th>   
	               </tr>
	               </thead>
	               
	            <tbody id="calculation1tbody">
	          	<c:set var="priceSum" value="0"/>
	            <c:if test="${not empty requestScope.wishListVal}">
	               	<c:forEach var="item" items="${requestScope.wishListVal}" varStatus="status">
	                  <c:forEach var="lecture" items="${item.lecs}" varStatus="rows">
	               <tr class="calculation1_tbody_tr1" style="height: 90px; background-color: #fff;">
	                  <td style="text-align: left; text-align:center; border-right:none;">
	                     <input type="checkbox" id="cbtr1${status.index}" name="checkbox"/>
	                     <input type="hidden" class="buypd${status.index}" value="${lecture.lecture_id}"/>
	                  </td>
	                  <td style="border-left: none; border-right: none;"><img style="width: 80%;" src="/shallwe/lecture/${lecture.lecture_img}"></td>
	                  
	                  <td style="text-align: left; padding-left:10px; border-left:none; font-weight: bold;">${lecture.lecture_title}</td>
	                  
	                  <td style="text-align: center; padding-left:10px; font-weight: bold;">${lecture.tutor.member.member_name}</td>
	                  
	                  <td><span style="padding-left: 10px;" class="lecture_price">${lecture.lecture_price}</span>원  </td>
					
	                  <td class="orderBtn">
	                     <button class="bttn default orderGobtn" style="border-radius:3px; width:90px; margin-bottom: 3px; font-size:11px; background-color: #264d73;color:#fff; font-weight:bold;">강의결제하기</button>
	                     <button class="bttn default btndelete" style="border-radius:3px; width:90px; margin-bottom: 3px; font-size:11px; " value="${lecture.lecture_id}">x삭제</button>
	                     <input type="hidden" class="lecture_id" name="lecture_id" value="${lecture.lecture_id}"/>
	                  </td>
	               </tr>
	<%--                   <c:if test="${empty requestScope.wishListVal}"> --%>
	<!--                      <tr id="noproduct" style="background-color: #fff;"> -->
	<!--                      <td colspan="10" style="font-size: 20pt; color: gray;"><span>찜목록에 등록된 상품이 없습니다</span></td>  -->
	<!--                      </tr> -->
	<%--                   </c:if> --%>
						<c:set var="priceSum" value="${priceSum+lecture.lecture_price}"/>
	                </c:forEach>
	               </c:forEach>                           
	            </c:if>
	            </tbody>
	         
	            </table>
	            
	            <div style="border:solid 1px #e0e0eb; padding: 15px 0;">
	            <img src="/shallwe/assets/img/elements/icon.png" style= "exclamation:before content=''; display: inline-block; margin:0 5px 0 13px; width:15px; height:14px; no-repeat: -336px -5px;vertical-align:-2px;">
	<!--                <img src="/shallwe/assets/img/elements/primary-check.png" style ="margin-left: 5px; position: relative;"> -->
	               <span style="font-size: 10pt; color :gray;">할인 적용 금액은 주문서 작성의 결제예정금액에서 확인 가능합니다</span>
	            </div>
	         </div>
	         <div style="margin:10px 0;">
	         
	            <button class="bttn default deleteAll btnfloat2">찜목록 비우기</button>
	            <span class="clearboth"></span>
	         </div>            
	         <br/><br/>
	         
	         <!--결제 예정금액 테이블 -->
	         
	         <table class="calculation2">
	            <tr>
	               <th style="text-align:center; width:100px">총 주문금액</th>
	            </tr>
	            <tr style="background-color:#fff;">
	               <td style="padding: 22px 0;"><span class="price"><c:out value="${priceSum}"/></span>원 </td>
	            </tr>
	         </table>            
	         <br/><br/>
	         
	         <div align="center">
	            <button class="bttn default footerbtn backbtn" id="footerbtn">이전화면</button>
	            <span class="clearboth"></span>
	         </div>         
	         <br/><br/><br/><br/><br/>
	         
	      
	      
	   </div>
   </div>
   <script>
//    ------------------체크박스 선택 Start-----------------------------------
   $(function(){
	   let tr=$("#calculation1tbody tr").val();
	      if(tr==null){
	    	  $("#noproduct").show();
	      }
      $("#noproduct").hide();
      
       $(".calculation1 thead input:checkbox[id=check]").click(function(){
         var chck=$(this).prop("checked");
         $(".calculation1 tbody input:checkbox[name=checkbox]").prop("checked", chck);
      });
         
       $(".calculation1 tbody input:checkbox[name=checkbox]").click(function(){
         var flag = false;
         $(".calculation tbody input:checkbox[name=checkbox]").each(function(){
            var chck=$(this).prop("checked");
         
            if(!chck){
               $(".calculation1 thead input:checkbox[id=check]").prop("checked",false);
               flag = true
               return false;
            }
         });
         if(!flag){
            $(".calculation1 thead input:checkbox[id=check]").prop("checked",true);
         }
       });
   
//  ---------------------체크박스 선택 End-----------------------------------

//	---------------------이전화면 버튼 Start---------------------------------
	$(".backbtn").on("click",function(){
		history.go(-1);
	});
//	---------------------이전화면 버튼 End---------------------------------

//  ---------------------x삭제 버튼 Start-----------------------------------
   $(".btndelete").click(function(){
         let lecture_id = $(this).attr('value');
         let tr= $("#calculation1tbody tr").val();
         if(confirm("선택하신 강의를 삭제하시겠습니까?")){
//             $(this).parent().parent().remove();
//             location.href="wishlist/deleteOne.do?lecture_id="+wishLecture+"";
//          $.ajax({
//             url:"${contextPath}/member/wishlist/deleteOne"
//             ,method:'GET'
//             ,data:{"lecture_id" : lecture_id}
//             ,success: function(responseData){
//                location.reload();
//             }
//          });//end of ajax
			payNdelete(lecture_id);
         }
         if(tr==null){
            $("#noproduct").show();
         }
         return false;
      });
//  ---------------------x삭제 버튼 End-------------------------------------

//  ---------------------찜목록 비우기 button Start-------------------------
   $(".deleteAll").click(function(){
// 	  alert("비우기 all");
   var bool = confirm("찜목록을 비우시겠습니까?");
   	if(bool){
   
		$.ajax({
			url:"${contextPath}/member/wishlist/deleteAll"
			,method:'GET'
			,success: function(responseData){
				location.reload();
			}
		});
      }
   	  return false;
   });
   
//  ---------------------찜목록 비우기 button End---------------------------


//  ---------------------강의결제하기 버튼 클릭시 주문 Start--------------------------
   $(".orderGobtn").click(function(e){
	   let parenttd = $(this).parent();
	   let lecture_id = parenttd.find(".lecture_id").val();
	   if(confirm("강의를 결제하시겠습니까?")){
	   // 강의신청, 강의결제페이지 호출
	      $.ajax({
	         url: "${contextPath}/member/insertMemberLectureHistory"
	         , method: "POST"
	         , data : {"lecture_id" : lecture_id}
	         , success: function(responseData) {
	            let responseObj = JSON.parse(responseData);
	            if (responseObj.status == "success") {
	               alert("강의 신청이 정상적으로 되었습니다.");
	               payNdelete(lecture_id);
	            } else {
	               alert("강의 신청에 실패했습니다.");
	            }
	      		}
		  }); // end of 강의신청, 강의결제페이지 호출 
	   }
	   return false;
   });
//  ---------------------강의결제하기 버튼 클릭시 주문 End---------------------------

	function payNdelete(lecture_id){
		 $.ajax({
	            url:"${contextPath}/member/wishlist/deleteOne"
	            ,method:'GET'
	            ,data:{"lecture_id" : lecture_id}
	            ,success: function(responseData){
	               location.reload();
	            }
	            , error : function(xhr){
	            	alert("실패");
	            }
	         });//end of ajax
	};
	
});
   </script>
</body>
</html>