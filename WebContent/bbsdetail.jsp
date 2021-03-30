<%@page import="Dto.MemberDto"%>
<%@page import="Dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Object obj = request.getAttribute("bbs");
BbsDto bbs = (BbsDto)obj;

MemberDto mem = (MemberDto)session.getAttribute("login");




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.comuni{
		height: 900px;
		padding-top: 180px;
		margin: 0 auto;
		margin-left: 30%;
}

.tablecla{
		width: 500px;
		height: 200px;
}

body{
		background-color: white;
}
</style>
</head>
<body>
<div class="container-fluid">
<div class="comuni">


<table border="1" class="tablecla">
<col width="300"><col width="500">
	<tr>
		<td>작성자</td><td><%=bbs.getMyid() %></td>
	</tr>
	<tr>
		<td>제목</td><td><%=bbs.getTitle() %></td>
	</tr>
	<tr>
		<td>파일다운로드</td><td><input type="button" name="btndown" value="파일"
					onclick="location.href='bbsdown?filename=<%=bbs.getFilename() %>&seq=<%=bbs.getSeq() %>'"></td>
	</tr>
	<tr>
		<td>조회수</td><td><%=bbs.getVcount() %></td>
	</tr>
	<tr>
		<td>작성시간</td><td><%=bbs.getWdate() %></td>
	</tr>
	<tr>
		<td>내용</td><td> <div style="text-align: center"><img src="./upload/<%=bbs.getFilename() %>" style="width: 250px; height: 250px;"></div>	<br> <%=bbs.getMycontent() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="삭제" onclick="location.href='bbs?param=deleteBbs&seq=<%=bbs.getSeq() %>'">
			<input type="submit" value="수정" onclick="location.href='bbs?param=updateBbs&seq=<%=bbs.getSeq() %>'">
			<input type="button" value="목록으로" onclick="location.href='index.jsp?content=bbslist&seq=<%=bbs.getSeq() %>'">
		</td>
	</tr>
</table>

</div>
</div>

</body>
</html>