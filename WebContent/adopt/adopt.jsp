<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String title = (String)request.getAttribute("title");
%>

<form action='rescued'>
<input type='button' value='작성완료' onclick='btn()'>
<input type=hidden name='param' value='adoptfinish'>
<input type=hidden name='seq' value='${seq }'>
<input type=hidden name='title' value='${title }'>
</form>

<form action='rescued'>
<input type='submit' value=입양취소>
<input type=hidden name='param' value='cancle'>
<input type=hidden name='seq' value='${seq }'>
<input type=hidden name='title' value='${title }'>
</form>





</body>
</html>