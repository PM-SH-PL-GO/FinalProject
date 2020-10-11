$(function(){
	//----------강의 검색 CLICK START---------	
	$('#searchBtn').click(function(){
		var $searchText = $('#searchText').val()
		var $searchKey = $('#select').val()
        var url = '/shallwe/lectures/search?searchKey='+$searchKey+'&searchText='+$searchText ;
        location.href = url;
	});
	//----------강의 검색 CLICK END---------
	
	//----------카테고리검색 CLICK START---------	
	$('#category a').click(function(){
		var $searchText = $(this).attr("id");
		var $searchKey = 3
        var url = '/shallwe/lectures/search?searchKey='+$searchKey+'&searchText='+$searchText ;
        location.href = url;
	});
	//----------카테고리검색 CLICK END---------	
});