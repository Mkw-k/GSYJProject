<%@page import="Dto.MemberDto"%>
<%@page import="Dto.UsefulDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
UsefulDto dto =(UsefulDto)request.getAttribute("dto");

MemberDto mem = null;
if(session.getAttribute("login") != null){
	mem = (MemberDto)session.getAttribute("login");
}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wirteuseform{
	margin-top: 100px;
	width: 100%;
	margin-left: 35%;
	text-align: center;
	
}
</style>


</head>
<body>


<div class="wirteuseform">
<form action="use">
<input type="hidden" name="param" value="useUpdateAf">
<input type="hidden" name="seq" value="<%=dto.getSeq()%>">

<table border="1">
	<tr>
		<td>작성자</td>
		<td>
		<input type="text" name="myid" size="40" readonly="readonly" value="<%=mem.getMyid() %>" style="text-align: center">
		</td>
	</tr>
	<tr>
		<td>동영상링크</td>
		<td>
			<input type="text" name="link" size="40">
		</td>
	</tr>
	<tr>
		<td>제목</td>
	<td>
			<input type="text" name="title" size="40">
	</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea rows="30" cols="60" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료">
			<input type="button" value="목록" onclick="location.href='use?param=UsefulTabPagingList'">
		</td>
	</tr>
	</table>

</form>
</div>

</body>
</html>