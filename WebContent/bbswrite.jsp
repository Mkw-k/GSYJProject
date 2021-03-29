<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

.bbswriteBody{
	height: 1300px;
	padding-top: 250px;
}

</style>

</head>
<body>

<div class="bbswriteBody">
<h1 style="text-align: center;">멍냥이자랑 글쓰기</h1>
<br><br>

<div align="center">

<form action="fileCon"  method="post" enctype="multipart/form-data">

<table border="1">
<col width="200"><col width="400">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" value="<%=mem.getMyid()%>" name="id" readonly="readonly">
	</td>
</tr>
<tr>
	<th>파일</th>
	<td>
		<input type="file" width="200" name="fileload">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" value="" name="title">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="30" cols="100" name="content"></textarea>
	</td>
</tr>


</table>
<br>
<input type="submit" value="작성완료">
<br><br>
</form>
</div>
</div>

</body>
</html>