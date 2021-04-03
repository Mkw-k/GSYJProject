<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Dto.AdoptDogDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
request.setCharacterEncoding("utf-8");
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>	
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>	
	<%
}
mem = (MemberDto)ologin;

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
String today = format1.format(cal.getTime());
%>

<meta charset="UTF-8">
<title>writeAdopt</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<br><br><br>
<h1 align="center">반려동물 입양신청서</h1>
<div align="center">

<form action="adopt?param=writeAdoptAf" method="post">
<input type='hidden' value=${seq } name='seq'>
	<br><br>	

	<table class="table table-bordered" style="width:900px">
	<col width="150px">
		<tr>	
			<th >아이디</th>
			<td>
				<input type="text" name="myid" size="15px" value="<%=mem.getMyid() %>" readonly="readonly">
			</td>
		</tr>
		
		<tr>
			<th>입양희망일</th>
			<td>
			<input type="date" name="rdate" value=<%=today%> >

			</td>
		</tr>
		
		<tr>
			<th>연락처</th>
			<td>
			<textarea rows="1" cols="5" name="phoneNum1"></textarea>&nbsp; -
			<textarea rows="1" cols="5" name="phoneNum2"></textarea>&nbsp; -
			<textarea rows="1" cols="5" name="phoneNum3"></textarea>
			
			</td>
		</tr>

		<tr>
			<th>제목</th>
			<td>
			<textarea rows="1" cols="60" name="title"></textarea>
			</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td> 
				입양동기 및 과거 키웠던 경험 등 자유롭게 적어주세요.
				<textarea rows="10" cols="80" name="mycontent"></textarea>
			</td>
		
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록"> &nbsp; &nbsp; &nbsp;
				<button type="button" onclick="goDetail()">취소</button>
			</td>
		</tr>
		
	</table>

</form>

</div>

<br><br><br><br>

<script type="text/javascript">
function goDetail() {
	 location.href = "rescued?param=list" 
}

</script>


</body>
</html>