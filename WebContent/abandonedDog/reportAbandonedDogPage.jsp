<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 30px;}
</style>
<%
request.setCharacterEncoding("utf-8");
Object ologin = request.getSession().getAttribute("login");
MemberDto mem = null;

if(ologin == null){
	
	response.sendRedirect("login.jsp");
}
mem = (MemberDto)ologin;
%>
</head>
<body>
<div id="text1" align="center">
<h1>유기견을 제보 합니다</h1>
<p>소중한 아이들의 보호에 참여해 주세요</p>
<img alt="" src="./gif/dogwalk.gif" style="max-height: 500px; max-width: 500px;">
<div align="center">
<button type="button" class="btn btn-warning" onclick="reportBtn()">유기견 제보</button>
<br>

</div>
</div>
<br>

<script type="text/javascript">
function reportBtn(){
	location.href = "abandog?param=writeReport";
}

</script>
</body>
</html>