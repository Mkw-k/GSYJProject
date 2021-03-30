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

#menu{
	margin-left: 30%;
}

#logo{
	padding-left: 100px;
}
</style>

</head>
<body>


<div id="header-wrapper" class="headBody">
	<div id="header" class="container-fluid">
		<div id="logo">
			<h1><a href="mem?param=toIndex">RedMarket</a></h1>
		</div>
		<div id="menu">
			<ul>
			
				<li>
				
				<%-- <%=mem.getMyid() %>님 환영합니다 --%>
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
	
	
<%

if (session.getAttribute("login") == null) {
	/* Boolean b = (Boolean)request.getAttribute("b"); */
%>
	<script type="text/javascript">
	/* alert("로그아웃 성공") */
	$("#logname").html("로그인");
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
	</script>
<%
	}
%>


<script type="text/javascript">
$(document).ready(function() { 
	$("#topbutton1").click(function() {
		location.href = "mem?param=toAddMember";
	});
});

function log() {

	$("#logname").click(function() {
		if($("#logname").html() == "로그인"){
			location.href = "mem?param=login";	
		}else if($("#logname").html() == "로그아웃"){
			location.href = "mem?param=logout";
		}
		
		});
}
	



</script>

</body>
</html>