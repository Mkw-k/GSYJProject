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
.tableAll{
	margin-top: 120px;	
	width: 100%;
	text-align: center;
	/* margin-left: 35%; */
	margin-bottom: 100px;
}
</style>
</head>
<body>

	<div class="tableAll">
	<table >
		<tr>
			<td>
			<iframe width="900" height="500" src="https://www.youtube.com/embed/<%=dto.getLink() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</td>	
		</tr>
		<tr>	
			<td style="margin-top: 20px;">제목:<%=dto.getTitle() %></td>
		</tr>
		
		<tr>
			<td>내용:<%=dto.getMycontent() %></td>
		</tr>
		<tr>
			<td>
				<%
				if(mem != null){
					if(mem.getMymanager() == 0){
						%>
						<input type="button" value="삭제" onclick="location.href='use?param=deleteUse&seq=<%=dto.getSeq()%>'">
						<input type="button" value="수정" onclick="location.href='use?param=useUpdate&seq=<%=dto.getSeq()%>'">
						<%
						}
				}	
				%>
				
				<input type="button" value="목록으로" onclick="location.href='use?param=UsefulTabPagingList'">
			</td>
		</tr>
	</table>
	</div>



</body>
</html>