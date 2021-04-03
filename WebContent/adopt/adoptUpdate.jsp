<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Dto.AdoptDogDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>adoptUpdate</title>

</head>
<body>



<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>

<%
AdoptDogDto dto = (AdoptDogDto)request.getAttribute("adopt");

String sseq = (String)request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
String today = format1.format(cal.getTime());

%>


<div align="center">

<h1>글 수정</h1>

<form action="./adopt?param=adoptUpdateAf" method="post">
	<input type="hidden" name="seq" id="updateSeq" value="<%=seq %>">
	<input type="hidden" name="manager" value="<%=mem.getMymanager() %>">
	<table border="1" style="width: 900px">
	<col width="200"><col width="500">
	
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="myid" readonly="readonly" size="60" value="<%=mem.getMyid() %>">
		</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="title" size="60" value="<%=dto.getTitle() %>">
		</td>
	</tr>
	
	<tr><tr>
			<th>입양희망일</th>
			<td>
				<input type="date" id="datepicker" name="rdate" value=<%=today %>>
			</td>
		
		<tr>
			<th>연락처</th>
			<td>
			<textarea rows="1" cols="20" name="phoneNum"><%=dto.getPhoneNum() %></textarea>&nbsp;
			'-'를 제외한 수정할 번호를 입력해주세요.	 
			</td>
		</tr>
	
		<tr>
			<th>내용</th>
			<td>
				<br>
				입양동기 및 과거 키웠던 경험 등 자유롭게 적어주세요.
				<textarea rows="50" cols="60" name="mycontent"><%=dto.getMycontent() %></textarea>
				
			</td>
		</tr>
				
			
	</table>
	<br>
<input type="submit" value="글수정" >&nbsp;&nbsp;
</form>

</div>
<br><br>

<div align="center">

<button type="button" onclick="javascript:history.back(-1)">취소</button>
</div>





</body>
</html>



