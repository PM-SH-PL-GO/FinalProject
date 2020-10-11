      //아이디와 패스워드가 적합한지 검사할 정규식
      var chkidpw=/^[a-z](?=.*[0-9]).{4,15}$/;
      var memid = $("#memberId");
      var mempwd= $("#memberPwd");
      var email1= $("#memberEmail1");
      var domain= $("#domain");
      
      function check(aaa,what,message){
         if(aaa.test(what.value)){
            return true;
         }
         alert(message);
         what.value="";
         what.focus();
      }
      
   //-------------------------아이디 중복 유무 검사 Start-------------------------
      function idCheck(signupform){
            var chkidpw= /^[a-z](?=.*[0-9]).{4,15}$/;
            var memberId=$("#memberId").val();
            
         if(memberId!=null || memberId!=""){
            if(!chkidpw.test(memberId)){
               alert("아이디는 4~13자리의 영문소문자와 숫자를 혼합해 입력해 주세요");
               return false;
            }else{
               $.ajax({
                  url:"/shallwe/member/checkId",
                  type:"post",
                  dataType:"json",
                  data:{"memberId" : $("#memberId").val()},
                  success : function(responseData){
                     if(responseData==1){
                        alert("중복된 아이디 입니다.");
                     }else if(responseData==0){
                        $("#idCheckBtn").attr("value", "Y");
                        alert("사용 가능한 아이디 입니다");
                     }
                  }
               })
            }
         }else{
               alert("아이디를 입력해 주세요");
               signupform.memberId.focus();
               return;
         }
      
      }
   //-------------------------아이디 중복 유무 검사End-------------------------            
   
   //--------------아이디 입력태그에서 키보드를 누른경우 호출되는 함수--------------
   //-->아이디 입력값이 변경되었으므로  idCheckResult 폼변수의 값을 0으로 초기화
         function idCheckInit(signupform){
            if(signupform.idCheckResult.value=="1"){
               signupform.idCheckResult.value="0";
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

   //-------------------------체크박스 갯수 제한 Start---------------------- 
   $("input[type='checkbox']").on('click',function(e){
   var $chkCnt = $("input:checkbox[name='favorites']:checked").length;
      if($chkCnt > 3){
      $(this).attr("checked",false)
   $("input:checkbox[name='favorites']:checked").prop('checked', false);
      alert("관심분야는 최대 3개 까지 선택가능합니다");
   }
   });
   //-------------------------체크박스 갯수제한 End------------------------
   
   //------------------------- 회원가입 Start-------------------------               
   function signUp(){
      var chkidpw= /^[a-z](?=.*[0-9]).{4,15}$/;
      var mempwd= $("#memberPwd");
      var memchkpwd =$("#memberPwdCheck");
      var email1= $("#memberEmail1");
      var domain= $("#domain");
      var checkArray = new Array();
      
      if(signupform.memberPwd.value=="" || signupform.memberPwd.value==null){
         alert("비밀번호를 입력하세요");
         signupform.memberPwd.focus();
      }
      if(!chkidpw.test(signupform.memberPwd.value)){
         alert("비밀번호는 4~12자리 영문 소문자와 숫자로만 입력해 주세요");
         signupform.memberPwd.focus();
         return false;
      }
      if(!chkidpw.test(signupform.memberPwdCheck.value)){
         alert("비밀번호는 4~12자리 영문 소문자와 숫자로만 입력해 주세요");
         signupform.memberPwdCheck.focus();
         return false;
      }
   
      if(signupform.memberPwd.value != memberPwdCheck.value){
         alert("비밀번호가 일치하지 않습니다");
         signupform.memberPwdCheck.focus();
         return false;
      }

      if(signupform.memberName.value==""){
         alert("이름을 입력해 주세요");
         signupform.memberName.focus();
         return false;
      }

      if(signupform.memberEmail1.value==""){
         alert("이메일을 입력해 주세요.");
         email1.focus();
         return false;
      }
      
      if(signupform.domain.value==""){
         alert("도메인을 입력해 주세요.");
         signupform.domain.focus();
         return false;
      }
      if(signupform.memberPhone2.value==""){
         alert("핸드폰 번호를 입력해 주세요");
         signupform.memberPhone2.focus();
         return false;
      }

      if(signupform.memberPhone3.value==""){
         alert("핸드폰 번호를 입력해 주세요");
         signupform.memberPhone3.focus();
         return false;
      }
          
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
      if(("#idCheckBtn").value==0){
         alert("아이디 중복체크 해주세요")
      }else{
   
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
   }
   //------------------------- 회원가입 End-------------------------   