<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String)request.getAttribute("name");
String email = (String)request.getAttribute("email");

System.out.println("name :"+name);
System.out.println("email :"+email);

if(name == null){
	name="";
	System.out.println("변경"+name);
}

if(email == null){
	email="";
	System.out.println("변경"+email);
}

//이메일 아이디를 @이전까지 잘라서 추천 아이디를 만들어서 자동으로 입력되있을수 있도록 변수에 기존 이메일에 아이디만 추출 
String recommendId = "";
if(email != null && email != ""){
	int recommendIdNum = email.indexOf("@");
	/* System.out.println("잘라야할숫자 : "+recommendIdNum); */

	recommendId = email.substring(0, recommendIdNum);
	/* System.out.println("추천아이디 : "+recommendId); */
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 추가CSS -->
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>

<style type="text/css">
.container{
		width: 500px;
}

body{
	height: 100vh;

	background-image: url("./image/dog1.png");
	
	background-repeat: no-repeat;
	
	background-position: center;
	
	background-size: cover;
	
	background: url("./image/dog1.png") no-repeat center/cover;
	

	
	/* padding-bottom: 20px; */
}

#regiBody{
	/*  color: white; */
	 background-color: #2D3030;
	/*  opacity: 0.5; */
	 background-color: rgba( 0, 0, 0, 0.5 );
}

.form-text{
	 color: white; 
	 
	 font-weight: bold;
}

.form-text{
	 color: graytext;
	 
	 font-weight: bold;
}
#regiAll{
	height: 1300px;
}
</style>

</head>
<body>





<div class="row" id="regiAll">
<div class="container" id="regiBody" style="margin: 0 auto; margin-top: 200px; height: 750px;">
<form name="frm" action="mem" onSubmit="formChk();return false" >
<input type="hidden" value="addMemberAf" name="param">
  <fieldset>
    <legend style="text-align: center; font-weight: bold; font-style: italic; font-size: 35px; color: white">회원가입</legend>
   <div class="form-group">
      <label class="form-text" for="exampleInputPassword1" style="color: white; font-weight: bold">아이디</label>
      <input name="myid" type="text" class="form-control" id="myid" placeholder="Id" value="<%=recommendId %>">
      <input type="button" id="idChk" value="id확인">
      <small id="IdHelp" class="form-text">아이디 중복 체크를 해주세요</small>
    </div>
    <div class="form-group">
      <label class="form-text" for="exampleInputPassword1" style="color: white; font-weight: bold">비밀번호</label>
      <input name="pwd" type="password" class="form-control" id="_Password1" placeholder="Password">
    </div>
    <div class="form-group">
      <label class="form-text" for="exampleInputPassword1" style="color: white; font-weight: bold">비밀번호재확인</label>
      <input name="pwd" type="password" class="form-control" id="_Password2" placeholder="Password check">

    </div>
     <div class="form-group">
      <label class="form-text" for="exampleInputPassword1" style="color: white; font-weight: bold" >이름</label>
      <input name="myname" type="text" class="form-control" id="_myname" placeholder="name" value="<%=name%>">
    </div>
    <div class="form-group">
      <label class="form-text" for="exampleInputEmail1" style="color: white; font-weight: bold">이메일주소</label>
      <input name="email" type="email" class="form-control" id="_myemail" aria-describedby="emailHelp" placeholder="abc@abc.com" value="<%=email%>">
      <small id="emailHelp" class="form-text">이메일 주소를 입력하세요</small>
    </div>
    
    <div class="form-group">
      <label class="form-text" for="exampleInputPassword1" style="color: white; font-weight: bold">전화번호</label>
      <div class="row" >
      <input name="phonenum1" type="text" class="form-control" id="_phoneNum1" placeholder="지역번호" style="width: 90px; margin-left: 15px;"> - 
      <input name="phonenum2" type="text" class="form-control" id="_phoneNum2" placeholder="앞번호"  style="width: 110px;  "> - 
      <input name="phonenum3" type="text" class="form-control" id="_phoneNum3" placeholder="뒷번호"  style="width: 110px;">
   	</div>
    
   
    
    </div>
  	<br>
    <button id="_subBtn" type="submit" class="btn btn-primary" onsubmit="formChk()">Submit</button>&nbsp;&nbsp;
    <button type="button" onclick="history.back()">뒤로가기</button>&nbsp;&nbsp;
    <!--  KaKao Login Btn -->
	<a href="javascript:kakaoLogin()">
	<img src="http://210.116.91.144/assets/w/imgs/btn-ka-start@3x.png" width="150px" height="auto" style="max-width:400px;max-height:60px"/>
	</a>
    <p></p>
    
  </fieldset>
</form>
</div>
</div>
<script type="text/javascript">
$(function () {
	
	$("#idChk").click(function () {
		
		$.ajax({
			type: "post",
			url: "mem?param=idCheck",
			data: { "id":$("#myid").val() },
			success:function( data ){
				alert('success');
				alert(data.msg);
				
				if(data.msg == "YES"){
					$("#IdHelp").css("color", "#0000ff");
					$("#IdHelp").html('사용할 수 있는 id입니다');
				}else{
					$("#IdHelp").css("color", "#ff0000");
					$("#IdHelp").html('사용할 수 없는 id입니다');
					$("#myid").val("");
				}
			},
			error:function(){
				alert('error');
			}			
		});
		
	});	
});


/* $("#_Password2").on('blur', function () {
	if($("#_Password1").val() != $("#_Password2").val()){
		alert("패스워드가 서로 다릅니다");
		$("#_Password1").val(""); 
		$("#_Password2").val("");
		location.href = "mem?param=toAddMember";
	}
}); */


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


/* 
$(function () {

	$("#_Password1").focus(function () {
		$(this).css("background-color", "green");
	});
	
	$("#_Password1").blur(function () {
		$(this).css("background-color", "#ffffff");
	});
	
	$("#btn").click(function () {
		
		// 빈칸 첵크
		if( $("#_name").val() == "" ){
			alert('이름을 기입해 주십시오');			
		} 
}); */
</script>

</body>
</html>