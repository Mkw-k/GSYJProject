<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<%
MemberDto mem = null;
String nowLog = "";
if(session.getAttribute("login") == null){
   nowLog = "로그인 해주세요";
}else{
   Object ologin = session.getAttribute("login");
   mem = (MemberDto)ologin;
   nowLog = mem.getMyid()+" 님 환영합니다";
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 부스스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- emailjs -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
<!-- AJax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 쿠키 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!-- 카카오 서비스 js -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>




<style type="text/css">


/* 로그인 상태창  스타일 */
#logstatus{
    margin-right: 15px;
    color: white;
    height: 42;
    line-height: 42px;;
}

/* 회원가입 스타일 (서로 띄우기위함) */
#signup {
   margin-right: 10px;
}

/* 로그인/회원가입 싸인관련 버튼 스타일 */
.sign {
   height: 42px;
}

/* 전체 네비게이션바 스타일 */
.topnav{
   height: 50px;
}



</style>

</head>
<body>




<nav class="navbar navbar-expand-md bg-dark  sticky-top topnav">
  <div class="container-fluid">

    <!-- 전환 버튼 -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-content" aria-controls="navbar-content" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>


    <!-- 네비게이션메뉴ー -->
    <div class="collapse navbar-collapse" id="navbar-content">   
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="mem?param=Info">INFO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="abandog?param=reportADPage">유기견제보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="rescued?param=list">입양신청</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="after?param=afterstoryList">입양후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="mem?param=useful">유용한정보</a>
        </li>
       
       
        <!-- 드롭 다운 -->
        <li class="nav-item dropdown navbar-right">
        <div class="btn-group"> 
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="bbs?param=toBbslist">우리 멍냥이는요</a>
            <a class="dropdown-item" href="freeb?param=toFreeboardlist">자유게시판</a>
          </div>
          </div>
        </li>
      </ul><br>


      <!-- 로그인버튼 등등 -->
      <p id="logstatus" class="sign"></p>
     	<c:choose>
    	<c:when test='${login == null}'> 
         	<a href="#regiLayerModal"  class="btn btn-link " data-toggle="modal">회원가입</a>   	
      	</c:when>
		      <c:when test="${login.mymanager == 1}" >
		      <div class="btn-group"> 
		   			    <button class="btn btn-link dropdown-toggle" type="button" id="mypageDropdownMenuButton" 
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자 페이지
						</button>
							<div class=dropdown-menu aria-labelledby="dropdownMenuButton">
								<a class=dropdown-item href="abandog?param=getAllAbandonedDogPagingList">유기견 제보 관리</a>
								<a class=dropdown-item href="adopt?param=getAdoptPagingList">입양신청서 관리</a>							
								<a class=dropdown-item href="manager?param=managerRescuedList">입양 리스트 관리</a>
								<a class=dropdown-item href="mem?param=allMemberList">회원 정보 관리</a>
							</div>
				</div>
		   		</c:when>	
   		
   				 <c:when test="${login.mymanager == 0}" > 
   			       <div class="btn-group">
						<button class="btn btn-link dropdown-toggle" type="button" id="mypageDropdownMenuButton" 
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						      	마이페이지
						</button>
						<div class=dropdown-menu aria-labelledby="dropdownMenuButton">
							<a class=dropdown-item href="abandog?param=getMyAbandonedDogPagingList">나의 유기견 제보 확인</a>
	      					<a class=dropdown-item href="adopt?param=myAdoptPagingList">나의 입양신청 확인</a>
							<a class=dropdown-item href="mem?param=myMemberInfo&Myid=<%=mem.getMyid()%>">회원 정보 관리</a>
						</div>
					</div>
                 </c:when>
			</c:choose>
			
     		 <c:choose>
				<c:when test='${login == null}'> 
                <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#loglayerModal" >로그인</button>
 		   		</c:when>	
 		   		
 		   		<c:when test='${login != null}'> 
				<button type="button" class="btn btn-primary" id = "logname" onclick="log()">로그아웃</button> 		   		
				</c:when>	
			 </c:choose>
 </div> 
 </div>
</nav>

<!--////////////////////////////// 로그인 모달팝업 START /////////////////////////-->
<div class="modal fade" id="loglayerModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
               <div class="col-md-12 text-center">
                  <h1>Login</h1>
               </div>
         </div>
         <div class="modal-body">
            <!-- 폼태그의 액션 -->
            <form action="mem" method="post" name="login">
            <input type="hidden" name="param" value="loginAf">
               <div class="form-group username">
                  <label for="exampleInputEmail1">ID</label> <input
                     type="text" name="id" class="form-control" id="_id"
                     aria-describedby="emailHelp" placeholder="Enter ID">
               </div>
               <div class="form-group password">
                  <label for="exampleInputEmail1">Password</label> <input
                     type="password" name="password" id="_password"
                     class="form-control" aria-describedby="emailHelp"
                     placeholder="Enter Password">
               </div>
                <div class="form-group">
                  <p class="text-center">
					<input type="checkbox" id="chk_save_id" >아이디저장
                  </p>
               </div>

               <br>
               <div class="col-md-12 text-center ">
                  <button type="submit"
                     class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
               </div>
               <div class="col-md-12 ">
                  <div class="login-or">
                     <hr class="hr-or">
                     <span class="span-or"></span>
                  </div>
               </div>
               
               <div class="col-md-12 mb-3">
                  <p class="text-center">
                  	 <!-- 카카오로 로그인(가입)-->
                  	 <a href='javascript:kakaoLogin()'>
                     <img src="./images/22.png" width=100%>
                     </a>
                     <!-- 일반 회원가입 -->
                     <a href="#regiLayerModal" data-toggle="modal">
                     <button type="button" class="btn btn-light" style="width: 100%">Sign Up</button>
                     </a>
                  </p> 
                  
               </div>
               <div class="form-group">
                  <p class="text-center">아이디를 잊어버리셨습니까? 
                  <br>
   				  <a data-toggle="modal" href="#stack2">비밀번호 찾기</a>
                   </p>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>












<script type="text/javascript">
let user_id = $.cookie("user_id");

if(user_id != null){	// 저장된 id가 있음
	$("#_id").val( user_id );
	$("#chk_save_id").attr("checked", "checked");
}


//쿠키 저장 
$("#chk_save_id").change(function() {
	
	if( $("#chk_save_id").is(":checked") ){
		if( $("#_id").val().trim() == "" ){
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);			
		}else{
			// 쿠키를 저장
			document.cookie = "user_id" + "=" + $("#_id").val().trim() + ";" + "7" + ";path=/";
		}
	}
	else{
		$.removeCookie("user_id", { path:'./' });
	}
	
}); 
</script>











<!--///////////////////// 회원가입 모달창 START ///////////////////////////////////-->
   <div class="modal fade" id="regiLayerModal">
  <div class="modal-dialog" style="margin-left: 20%; margin-top: 5%;">
  <!-- fit-content변경 -->
    <div class="modal-content" style="width: fit-content;">
     <div class="modal-body" style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px;">
    <!--///////////////////// 회원가입 폼 START ///////////////////////////////////-->
   <section class="ftco-section">
      <div class="container regicontainer">
         <div class="row justify-content-center">
            <div >
               <div class="wrap d-md-flex">
                <!-- 변경 w-500 -->
                  <div class="text-wrap p-4 p-lg-5 d-flex img d-flex align-items-end" style="background-image: url(images/regi.png); background-size: cover; width: 500px;">
                     <div class="text w-100">
                       <!--  <h2 class="mb-4">Welcome to signup form</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>-->
                     </div> 
               </div>
               <!-- 변경 w-500 -->
                  <div class="login-wrap p-4 p-md-5" style="width: 550px;">
                  <h3 class="mb-3">회원가입</h3>
                     <form action="mem" class="signup-form" onSubmit="formChk();return false">
                        <input type="hidden" value="addMemberAf" name="param">
                        <div class="row">
                           <div class="col-md-12" style="height: 40px;">
                              <div class="form-group d-flex align-items-center" style="margin-bottom: ">
                                 <label class="label " for="name" style="width: 150px; ">아이디</label>
                                 <!-- 아이디 -->
                                 <input name="myid" id="_myid" type="text" class="form-control" placeholder="ID" style="margin-left: 30px;" >
                                 &nbsp;&nbsp;
                                 <input type="button" class="btn btn-info" id="idChk" value="중복확인" style="margin-left: 10   px;">
                                 </div>
                              </div>
                              <div class="col-md-12" >
                                 <small id="IdHelp" class="form-text" style="margin-left: 110px;">아이디 중복 체크를 해주세요</small>
                              </div>
                           <div class="col-md-12" style="margin: 0px; margin-top: 5px;">
                              <div class="form-group d-flex align-items-center">
                           <label class="label" for="password" style="width: 150px;">비밀번호</label>
                           <!-- 패스워드 -->
                             <input name="pwd" type="password" class="form-control" id="_Password1" placeholder="Password" >
                           </div>
                           </div>
                           <div class="col-md-12" >
                              <div class="form-group d-flex align-items-center">
                           <!-- 패스워드체크 -->
                           <label class="label" for="password" style="width: 150px;">비밀번호확인</label>
                             <input name="pwd2" type="password" id="_Password2" class="form-control" placeholder="Password Check" >
                           </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group d-flex align-items-center">
                              <label class="label" for="name" style="width: 150px;">이름</label>
                              <!-- 이름 -->
                              <input name="myname" type="text" class="form-control" id="_myname" placeholder="Name"  >
                           </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group d-flex align-items-center">
                              <label class="label" for="email" style="width: 150px;">Email Address</label>
                              <!-- 이메일 -->
                              <input name="email" type="email" class="form-control" id="_myemail" aria-describedby="emailHelp"   
                              placeholder="johndoe@email.com">
                           </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group d-flex align-items-center" style="margin-bottom: 0px;">
                              <label class="label" for="phone" style="width: 114px;">Phone no.</label>
                               <!-- 전화번호 -->
                               <input name="phonenum" type="text" class="form-control" id="_phoneNum1" placeholder="000-0000-0000" style="width: 350px; ">  
                             
                        </div>
                           </div>
                           <div class="col-md-12 my-4">
                              <div class="form-group">
                           <div class="w-100">
                              <label class="checkbox-wrap checkbox-primary">개인 정보는 사이트 회원운영 목적 이외에 다른 목적으로는 사용하지 않으며 외부로 유출하지 않습니다.
                                      <!-- <input type="checkbox" checked> -->
                                      <span class="checkmark"></span>
                                    </label>
                                 </div>
                        </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group" style="text-align: center;">
                           <button type="submit" class="btn btn-secondary submit p-3">작성완료</button>
                        </div>
                           </div>
                        </div>

                </form>
               <!--  <div class="social-wrap" style="text-align: center;">
                   <p class="or">
                      <span>or</span>
                   </p>
                     <p class="mb-3 text-center">Signup with this services</p>
                     <p class="social-media d-flex justify-content-center">
                        <a href="#" class="social-icon google d-flex align-items-center justify-content-center"><span class="fa fa-google"></span></a>
                           <a href="#" class="social-icon facebook d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                           <a href="#" class="social-icon twitter d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                        </p>
                </div> -->
                <div class="w-100 text-center">
                        <p class="mt-4">아이디가 있습니다 <a href="#loglayerModal" data-toggle="modal" style="color: blue;">Sign In</a></p>
                </div>
              </div>
            </div>
            </div>
         </div>
      </div>
   </section>
   <!--///////////////////// 회원가입 폼 END ///////////////////////////////////-->
      </div>
      
     
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
      <!--///////////////////// 회원가입 모달창 END ///////////////////////////////////-->





<!-- 아이디찾기 Modal -->
<div class="modal fade" id="stack2">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
       <div class="modal-header">  	
       	  <br>
          <h4 class="modal-title">아이디 찾기</h4>
          
          <br>
        </div>
       <div class="modal-footer">
          <input type='email' class='form-control' placeholder='가입한 메일주소를 입력하세요' id='email'>
          <button type="button" class="btn btn-secondary" id='mails'>인증번호 받기</button>
      </div>
        <div class="modal-footer">
          <input type='email' class='form-control' placeholder='인증번호를 입력하세요' id='num'>
          <button type="button" class="btn btn-secondary" id='findId'>확인</button>
        </div>
      </div>
</div>
</div>

<!-- //////////////// 아이디 찾기 ///////////////////-->

<script type="text/javascript">
$(document).ready(function() { 
	$("#topbutton1").click(function() {
		location.href = "mem?param=toAddMember";
	});
	
	let result = 0;
	let service_id = 'service_pxdtnjg';
	let template_id = 'template_ly07hxk';
	let user_id =  'user_2jsA4CYFSAFj7plaOFdxo';
	let email = "";
	
	
	$("#mails").click(function(){
		
		email =  $('#email').val();
		
		if(email ==""){
			alert('메일 주소를 입력하세요')
		} 
		else {		
			alert("인증번호를 보냈습니다. 인증번호를 확인하세요!")
		}
		
		
		//인증번호 생성
    	result = Math.floor(Math.random()*1000000)+100000;
    		if(result>1000000){
    			result = result-100000;
    		}	
        	
    	  //접속	
    	  emailjs.init(user_id);
    		
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
          let templateParams = {	
            email : $('#email').val(),
            in_code : result 
          };
          
             
         //메일 보내기
         emailjs.send(service_id, template_id, templateParams)
         .then(function(response) {
         	 console.log('SUCCESS!');
         }, 
         	  
          function(error) {  
         	 console.log('FAILED...', error);
         });
	});
	
    // 인증번호 확인
    $('#findId').click(function(){
    	if($('#num').val() == result){
    		
    		$.ajax({
    			url:"mem",
    			type:"get",
    			datatype:"json",
    			data: {"param":"findId", "email":email}, 
    			success:function(data){
				
    			let findId = (data.findId); 
    			if(findId == ""){
    				alert("본 이메일로 가입된 아이디가 없습니다");
    			}else{ 
    				alert("당신의 아이디는 "+ findId + " 입니다.");
    			}
    			},
    			error:function(){
    				alert("fail");
    			}	
    		})


    	} else {
    		alert("인증번호가 올바르지 않습니다")
    		location.href="mem?param=toIndex"
    	}
    	
    	
    });
	
});







function log() {
	$("#logname").click(function() {
		if($("#logname").html() == "로그아웃"){
			location.href = "mem?param=logout";
		}
		});
}


function findPw() {
	let mail = Document.getElementById("myMail");
	
}

</script>









<script type="text/javascript">
$(function () {
	//아이디 체크
	$("#idChk").click(function () {
		
		$.ajax({
			type: "post",
			url: "mem?param=idCheck",
			data: { "id":$("#_myid").val() },
			success:function( data ){
				alert('success');
				alert(data.msg);
				
				if(data.msg == "YES"){
					$("#IdHelp").css("color", "#0000ff");
					$("#IdHelp").html('사용할 수 있는 id입니다');
				}else{
					$("#IdHelp").css("color", "#ff0000");
					$("#IdHelp").html('사용할 수 없는 id입니다');
					$("#_myid").val("");
				}
			},
			error:function(){
				alert('error');
			}			
		});
		
	});

	
	
});














/* 유효성검사 */
function formChk() {
	alert("폼체크실행");
	
	var check = document.frm;
	
	if($("#_Password1").val()== ""){
		alert("패스워드 입력창이 비어있습니다");
		$("#_Password1").focus();
		return false;
	}else if($("#_Password2").val()== ""){
		alert("패스워드 확인창이 비어있습니다");
		$("#_Password2").focus();
		return false;
	}else if($("#myid").val()== ""){
		alert("아이디를 입력해주세요");
		$("#myid").focus();
		return false;
	}else if($("#_myname").val()== ""){
		alert("이름을 입력해주세요");
		$("#_myname").focus();
		return false;
	}else if($("#_myemail").val()== ""){
		alert("이메일을 입력해주세요");
		$("#_myemail").focus();
		return false;
	}else if($("#_phoneNum1").val() == "" || $("#_phoneNum2").val() == "" || $("#_phoneNum3").val() == "" ){
		alert("연락처를 입력해주세요");
		
		if($("#_phoneNum1").val() == ""){
			$("#_phoneNum1").focus();
		}else if($("#_phoneNum2").val() == ""){
			$("#_phoneNum2").focus();
		}else if($("#_phoneNum3").val() == ""){
			$("#_phoneNum3").focus();
		}
		
		return false;
	}

/* 패스워드 재확인 기능구현 */
	if( $("#_Password1").val() != $("#_Password2").val() ){
		alert("패스워드가 서로 다릅니다");
		$("#_Password1").val(""); 
		$("#_Password2").val("");
		$("#_Password1").focus();
		return false;
	}
/* 유효성검사 모두 확인후 서브및 실행 */
 	alert("가입성공");
	check.submit();
}


////////////////// 카카오로 회원가입 ////////////////////////

function kakaoLogin() {
	
Kakao.init('92928f9e601c2b81c37ec8882d4901ac'); //Key값으로 접속
console.log(Kakao.isInitialized());             //Key값 유효성 판단 

let email = "";
let name = "";
	
    Kakao.Auth.login({
		scope: 'profile, account_email, gender, birthday', //추가 동의 받을 항목 키
		success: function(data) {
			
			// 유저 정보 받아오기
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(res) {
					console.log(res.kakao_account);
					email = res.kakao_account['email'];
					name = res.kakao_account.profile['nickname'];
					location.href = "mem?param=kakaoLog&email="+email+"&name="+name;
				}
			}); 
		}       
    
	})
	
}

</script>

<!-- <script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script> -->
<script src="js/main.js"></script>

</body>
</html>