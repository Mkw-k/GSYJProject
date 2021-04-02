<%@page import="Dto.afterStoryDto"%>
<%@page import="Dao.afterStoryDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());
%>

<%
afterStoryDao dao = afterStoryDao.getInstance();
afterStoryDto dto = dao.storyDetail(seq);
%>



<html>
<head>
<meta charset="UTF-8">
<title>afterStoryUpdate</title>
</head>
<body>

  
<div align="center">
<div class='container'>
<br>
<h2 style="color: #000">나의 입양후기 수정</h2>
<form action="./afterfile?param=afterUpdate" method = "post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<br>

<table class='table'>
	<tr>
		<th style="text-align: center">NAME </th>
		<td>
			<input type="text" name="id" size="90px" value="<%=mem.getMyid() %>" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th style="text-align: center"> TITLE </th>
		<td>
			<textarea name="title" rows="3" cols="90" ><%=dto.getTitle() %></textarea>
		</td>
	</tr>
	<tr>
		<th style="text-align: center"> CONTENT </th>
		<td>
			<img class="im" alt="" src="./upload/<%=dto.getFilename()%>">
			<textarea  name="content" rows="20" cols="90" ><%=dto.getMycontent() %></textarea>
		</td>
	</tr>
	<tr>
		<th style="text-align: center"> NEW PHOTO </th>
		<td>
			<input type="file" name="fileload" style="width: 400px" >
		</td>
	</tr>
</table>
<br>
<button type="submit" class='btn btn-secondary'>수정완료</button>	
<a class='btn btn-secondary' href="after?param=afterstoryList">수정취소</a>	
</form>
</div>
</div>









</body>
</html>