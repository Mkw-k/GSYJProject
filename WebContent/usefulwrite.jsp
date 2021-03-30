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
</head>
<body>


<form action="use">
<input type="hidden" name="param" value="writeUseAf">

<table>
	<tr>
		<td>작성자</td><td><%=mem.getMyid() %></td>
	</tr>
	<tr>
		<td>동영상링크</td>
		<td>
			<input type="text" name="link">
		</td>
	</tr>
	<tr>
		<td>제목</td>
	<td>
			<input type="text" name="title">
	</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<input type="text" name="content">
		</td>
	</tr>
	</table>

</form>

</body>
</html>