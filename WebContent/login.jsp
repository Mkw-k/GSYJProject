<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="kakaoAPI.js"></script> <!-- external 형식-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 쿠키사용시 필요한 스크립트태그 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<style type="text/css">
body{
	height: 750px;
	width:100%;
	height:100%;
	background-image: url(./img/pic.jpg);
	margin: 0 auto;
	background-repeat: repeat-x;
}

.total{
	margin: 0 auto;
	margin-top: 120px;
	margin-bottom: 120px;
	height: 340px;
	width: 300px;
	background: linear-gradient(to bottom, #ddeeff, #aabbdd); 
/* 	background-color: rgba(255, 255, 255, 0.5); */
	box-shadow: 3px 3px 6px 1px rgba(0, 0, 0, 0.7);
/* 	border-radius: 10% / 50%; */
	border-radius: 30px;
	
	
 
	
}

.head{
	border-bottom: 2px solid black;
	height: 50px;
	padding-left: 10px;
	
	
}

.main{
	border-bottom: 2px solid black;
	height: 180px;
	
}

.footer{
	
	height: 100px;
}

.username{
/* 	border: 1px solid blue;  */
	width: 80%;
	height: 20%;
	margin: 0 auto;
	margin-top: 20px;
}

.password{
	/* border: 1px solid blue; */ 
	width: 80%;
	height: 20%;
	margin: 0 auto;
	margin-top: 20px;
} 

.alter{
/* 	border: 1px solid red; */
	width: 80%;
	height: 50%;
	margin : 0 auto;
	margin-top: 20px;
}

.logbutton{
	float: center;
}
.footer{
	text-align: center;
	line-height: 20px;
}

</style>
</head>
<body>
<% // 로그인 실패시 loginAf에서 본페이지로 돌아와 경고창 실행 

if(request.getAttribute("logChk") != null){
String logChk = (String)request.getAttribute("logChk");
if(logChk.equals("fail")){
	%>
<script type="text/javascript">
alert("아이디나 비밀번호를 확인해주세요");		
</script>
	<%
}
}
%>

<div class="row" style="height: 700px;">
<div class="total" style="margin-top: 200px; margin-bottom: 200px;">
<div class="head">
<h2>Sign in</h2>
</div>

<div class="main">
<form action="mem" method="post">
<input type="hidden" name="param" value="loginAf">
	
	<div class="username">
	<input type="text" id="_id" name="id" placeholder="id기입" size = "30" value="">
	</div>
	
	
	<div class="password">
	<input type="password" name="password" placeholder="pw기입" size = "30">
	</div>
	



	<div class="alter">
	
	
	
	<input type="checkbox" id="chk_save_id" name="reid" value=".id" style="margin-bottom: 10px">&nbsp;remember me<br>
	
<div align="center">
		
	<input type="submit" class="logbutton" value="로그인"><br>
</div>
	

	</div>
</form>
</div>
<br>
<div class="footer">Don't have an account? 
<a href="mem?param=toAddMember">Sign Up<br></a>
<a href="#">Forgot your password?<br></a>

</div>
</div>
</div>

<script type="text/javascript">



/*
	session	: Java -> Server Object
	cookie : Java Script -> Client String 
 */

let user_id = $.cookie("user_id");
	
if(user_id != null){	// 저장된 id가 있음
//	alert("쿠키 있음");
	$("#_id").val( user_id );
	$("#chk_save_id").attr("checked", "checked");
//	$("#chk_save_id").prop("checked", true);
}


//쿠키 저장 
$("#chk_save_id").click(function() {
	
	if( $("#chk_save_id").is(":checked") ){
	//	alert('첵크됨');
		if( $("#_id").val().trim() == "" ){
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);			
		}else{
			// 쿠키를 저장
			$.cookie("user_id", $("#_id").val().trim(), { expires:7, path:'./'});
		}
	}
	else{
		$.removeCookie("user_id", { path:'./' });
	}
	
}); 


</script>
</body>
</html>