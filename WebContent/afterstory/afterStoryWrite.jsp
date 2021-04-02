<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>afterStoryWrite</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
Object ologin = session.getAttribute("login");
MemberDto mem = null;

if(ologin == null){
%>	
	<script>
	alert('로그인 해 주십시오');
	</script>	
<%
	response.sendRedirect("login.jsp");
	}
mem = (MemberDto)ologin;	
%>


<div align="center">
<br><br><br><br><br>
<form  action="afterfile?param=afterstoryAf" method = "post" enctype="multipart/form-data">
<h2 style="color: #000">AFTER STORY WRITE</h2>
<br><br><br>
<table border="1"  >
<col width="200"><col width="600">
<tr>
	<th style="text-align: center">아이디 </th>
	<td>
		<input type="text" name="id" size="90px" value="<%=mem.getMyid() %>" readonly="readonly">
	</td>
</tr>
	<th style="text-align: center"> 제목 </th>
	<td>
		<textarea name="title" rows="3" cols="90"></textarea>
	</td>
</tr>
<tr >
	<th style="text-align: center">내용 </th>
	<td>
		<textarea  name="content" rows="20" cols="90"></textarea>
	</td>
</tr>
<tr>
	<th style="text-align: center">이미지  </th>
	<td>
		<input type="file" name="fileload" style="width: 400px ">
	</td>
</tr>
</table>
<br><br><br>
<div>
<button type="submit">글쓰기</button>	
</div>

</form>
</div>



</body>
</html>