<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="status" value="${requestScope['status']}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 화면 호출 테스트 </title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {

	var $reviewAreaObj = $('#reviewArea');
	console.log($reviewAreaObj);
	// 강사별, 카테고리별 리뷰 목록 조회
	$.ajax({
		url : "/shallwe/reviewList"
		, data : {"tutor_id": "member3",
				  "category_id":"MA"}
		, success : function (responseData) {
			console.log(responseData);
			$reviewAreaObj.append(responseData);
		}
	}); // end of ajax 
	
	$reviewAreaObj.on('click', function (e) {
      var tdObj = $(this).find('td');
      var reviewArrObj = new Array();
      tdObj.each(function(i){
         reviewArrObj.push(tdObj.eq(i).text());
         console.log(reviewArrObj[i]);
       });
      
      var lecture_category_id =reviewArrObj[6] ;
      var member_id =reviewArrObj[1] ;
      var lecture_id = reviewArrObj[4];
      var tutor_id = reviewArrObj[5];
      
      $.ajax({
         url: "/shallwe/removeReview"
         , method : 'POST'
         , data : {"lectureCategoryId" : lecture_category_id
                  , "member_id" : member_id
                  , "lecture_id" : lecture_id
                  , "tutor_id" : tutor_id}
         , success : function ( responseData ) {
        	 console.log("responseData ::: " + responseData);
       		 alert('삭제완료');
         }
      }); // end of ajax
   });
}); // end of script

</script>
</head>
<body>


<a href="/shallwe/lectures/detail?lecture_id=3"> 강의상세보기 </a>
<br/>
<a href="/shallwe/reviewAdd"> 후기등록테스트</a>

<div class="mb-30 mt-30" id="reviewArea">

</div>
</body>
</html>