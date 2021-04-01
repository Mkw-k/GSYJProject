<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto mem = null;
String nowLog = "";
if(session.getAttribute("login") == null){
	%>	
	<script>
	/* alert('로그인 해 주십시오');
	location.href = "login.jsp"; */
	</script>	
	<%
	nowLog = "로그인 해주세요";
	%>
	<script type="text/javascript">
		/* alert("세션이 없습니다"); */
	</script>
	<%
}else{
	Object ologin = session.getAttribute("login");
	mem = (MemberDto)ologin;
	nowLog = mem.getMyid()+" 님 환영합니다";
	%>
	<script type="text/javascript">
		/* alert("세션이 존재합니다"); */
	</script>
	<%
}

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!-- <style type="text/css">
.btn btn-default navbar-btn{
				color: white;
				text-align: right;
}
</style> -->

<style type="text/css">
/* #headerBody{
	background-color: black;
    
} */

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
	height: 80px;
	
}

/* 타이틀 스타일 */
.comtitle{
	/* font-weight: bold; */
	font-size: 30px; 
}


</style>

</head>
<body>




<!-- 네비게이션바ー -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top topnav">
  <div class="container-fluid">
    <!-- 서브컴퍼넌트 -->
    <!-- 브렌드 -->
    <a class="navbar-brand comtitle" href="index.jsp?content=main">GSYJ.Project</a>
    <!-- 전환 버튼 -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-content" aria-controls="navbar-content" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <!-- 네비게이션 -->
    <div class="collapse navbar-collapse" id="navbar-content">
   
      <!-- 네비게이션메뉴ー -->
      <!-- 왼쪽 메뉴 : 톱 페이지의 각 콘텐츠에 대한 링크 -->
      <ul class="navbar-nav mr-auto">
      
        <li class="nav-item active">
          <a class="nav-link" href="#">Top <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bbs?param=getPagingBbsList">커뮤니티</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#menu">Menu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="use?param=getPagingBbsList">융용한정보</a>
        </li>
       
       
        <!-- 드롭 다운 -->
        <li class="nav-item dropdown navbar-right">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Information</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#shop">Shop</a>
            <a class="dropdown-item" href="#access">Access</a>
          </div>
        </li>
      </ul><br>
      
      <!-- 오른쪽 메뉴:Contact 페이지에 링크 -->
      <ul class="navbar-nav">
   <!--    <li>
      	<p id="logstatus"></p>
      </li> -->
      
      <li class="nav-item sign">
          
          <p id="logstatus" class="sign"></p>
        </li>
        
      <li class="nav-item sign">
          
          <a id= "signup" class="nav-link btn btn-info">회원가입</a><br>
        </li>
        <li class="nav-item sign">
          
          <a id= "logname" class="nav-link btn btn-info">로그인</a>
        </li>
      </ul>
      <!-- /네비게이션메뉴ー -->
    </div>
    
   <!-- /서브컴퍼넌트 -->
  </div>
</nav>
<!-- /네비게이션바ー -->




<%-- <div id="header-wrapper" class="headBody">
	<div id="header" class="container-fluid">
		<div id="logo">
			<h1><a href="mem?param=toIndex">RedMarket</a></h1>
		</div>
		<div id="menu">
			<ul>
			
				<li>
				
				<%=mem.getMyid() %>님 환영합니다
				</li>
				<li><a href="mem?param=toIndex" accesskey="2" title="">INFO</a></li>
				<li><a href="#" accesskey="4" title="">유기견제보</a></li>
				<li><a href="#" accesskey="4" title="">입양신청</a></li>
				<li><a href="bbs?param=getPagingBbsList" accesskey="5" title="">커뮤니티</a></li>
				<li><a href="#" accesskey="5" title="">입양후기</a></li>
				<li><a href="#" accesskey="5" title="">유용한정보</a></li>
				<li><a href="mem?param=toAddMember" accesskey="5" title="">회원가입</a></li>
				<li><a id = "logname" href="javascript:log()" accesskey="5" title="">로그인</a></li>
				
			</ul>
		</div>
	</div>
</div>
	 --%>
	

<%

if (session.getAttribute("login") == null) {
	/* Boolean b = (Boolean)request.getAttribute("b"); */
%>
	<script type="text/javascript">
	/* alert("로그아웃 성공")  */
	$("#logname").html("로그인");
	$("#logstatus").html("");
	</script>
<%
	}
%>

<%

if (session.getAttribute("login") != null) {
	/* Boolean b = (Boolean)request.getAttribute("b"); */
%>
	<script type="text/javascript">
	/* alert("로그인 성공") */
	$("#logname").html("로그아웃");
	$("#logstatus").html("<%=mem.getMyid() %>님 환영합니다");
	</script>
<%
	}
%>


<script type="text/javascript">
$(document).ready(function() { 
	$("#signup").click(function() {
		location.href = "mem?param=toAddMember";
	});
});




	
$("#logname").click(function() {
		if ($("#logname").html() == "로그인") {
			location.href = "mem?param=login";
		} else if ($("#logname").html() == "로그아웃") {
			location.href = "mem?param=logout";
		}

});

</script>

</body>
</html>