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

<!-- 부스스트랩(제이쿼리가 밑에) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<style type="text/css">
.tableAll{
	margin-top: 120px;	
	width: 100%;
	text-align: center;
	margin-bottom: 100px;
}
</style>
</head>
<body>
<div class='container'>
	<br>
	<div class="row text-center">
		<div style="width: 30%; float:none; margin:0 auto" >
			<h2><%=dto.getTitle() %></h2>
		</div>
	</div>
	<br><br>
	<div class="row text-center">
		<iframe width="1060" height="600" src="https://www.youtube.com/embed/<%=dto.getLink() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<br>
	<div class="row text-center">
		<div style="width: 30%; float:none; margin:0 auto" >
		<%=dto.getMycontent() %>
		</div>
	</div>
	<br>
	<div class="row text-center">
		<div style="width: 30%; float:none; margin:0 auto" >
		<%
		if(mem != null){
			if(mem.getMymanager() == 1){
				%>
				<input type="button" value="삭제" class='btn btn-secondary' onclick="location.href='use?param=deleteUse&seq=<%=dto.getSeq()%>'">
				<input type="button" value="수정" class='btn btn-secondary' onclick="location.href='use?param=useUpdate&seq=<%=dto.getSeq()%>'">
				<%
				}
		}	
		%>
				<input type="button" value="목록" class='btn btn-secondary'  onclick="location.href='use?param=UsefulTabPagingList'">
		</div>
	</div>
</div>


</body>
</html>