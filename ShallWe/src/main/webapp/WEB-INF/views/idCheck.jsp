<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>ID CHECK</title>
   <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
   <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   <script
  src=https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js></script>
  
<style>
 *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
  margin-top: 120px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #3BABE4;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {

  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #00DBD5;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #00DBD5;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #00DBD5;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}
</style>
<script>
$(function(){
	
	$('.resume').on('click', function() {
	    var $this = $(this);
	  $this.button('loading');
	    setTimeout(function() {
	       $this.button('reset');
	   }, 2000);
	});


	let mailR= /^[A-Z0-9+_.-]+@[A-Z0-9.-]+$/i;
	let $msgMail = $("span.mailR");

	$("button#load2").click(function(){
			let $nameVal = $("input#name").val();
			let $emailVal = $("input#email").val();
			
			if(mailR.test($emailVal) == false){
				 
				 $("input#email").select();
				 $msgMail.show();
				 
			 } else {
					$.ajax({
						
						url:"/shallwe/email/idEmailCheck"
					   ,method:'POST'
					   ,data:{member_name:$nameVal,member_email:$emailVal}
					   ,success:function(data){
							let responseObj = JSON.parse(data)
							console.log(data);
							if(responseObj.status == 'success'){
								 
										alert("이메일이 전송되었습니다.");
										location.href = "/shallwe/userLogin";
									
							}else{
		
								alert("정보를 다시 입력해주세요");

						}
				   }	   

				});
			 }
		});

	
});

</script>  
    </head>
    <body>
      <form action="idEmailCheck" method="post">
      <jsp:include page="/WEB-INF/views/topBar.jsp"></jsp:include>
        <h1>ID CHECK</h1>
        
        <fieldset>	
          <legend><span class="number">1</span> Your basic info</legend>
          <label for="name">Name:</label>
          <input type="text" id="name" name="user_name">
          
          <label for="email">Email:</label>
          <span hidden="hidden" class="mailR" style="color: red; font-size: 0.8em;"><i>이메일 형식이 맞지 않습니다</i></span>
          <input type="email" id="email" name="user_email">
        </fieldset>
          <div style="margin:3em;">
			  <br>
			<button type="button" class="btn btn-primary btn-lg resume" 
			id="load2" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Order">CHECK!</button>
		 </div>
      </form>
    </body>
</html>