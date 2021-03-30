<%@page import="Dto.UsefulDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");

String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
int pageNumber =Integer.parseInt((String)request.getAttribute("pageNumber"));
int len = Integer.parseInt((String)request.getAttribute("len"));
int bbspage = Integer.parseInt((String)request.getAttribute("bbspage"));
List<UsefulDto> list = (List<UsefulDto>)request.getAttribute("list");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.selectTool{
		text-align: center;
	}
	
	.searchTxt{
		margin: 0px 10px;
	}
	
	.innerTable{
		padding: 10px 10px;
		margin: 0px 10px;
	}
</style>
</head>
<body>
<!-- 헤더부분 -->
<div class="selectTool">
<select id = "choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="author">작성자</option>
</select>


<input type="text" size="50px" id="search" value="" placeholder="검색어입력" class="searchTxt">

<input type="button" id="searchBtn" value="검색">
</div>
<br><br>

<div align="center">
<table>
	<thead>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr> 
				
		</thead>
<tbody>
<%
if(list.size() == 0){
	%>
	<tr>
		<td colspan="4">작성 내용이 없습니다</td>
	</tr>
	<% 
}
%>
	

<tr>
<%
for(int i=1; i < list.size()+1; i++){
	UsefulDto dto = list.get(i);
		%>
		<td>
		<table border="1" class="innerTable">
			<tr>
				<td>썸네일</td>
			</tr>
			<tr>	
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<td><%=dto.getMyid() %></td>
			</tr>
			<tr>
				<td><%=dto.getWdate() %>/<%=dto.getReadcount() %>  날짜/조회수#</td>
			</tr>
		</table>
	</td>
	<%
	if(i%4==0){
	%>
	 </tr><tr>
<%
	}//end if

}//end for 
%>
</tr>

</tbody>
</table>
</div>



</body>
</html>