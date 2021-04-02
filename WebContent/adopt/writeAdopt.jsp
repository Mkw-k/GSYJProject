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
				<select name="ryear">
					<option> -- 연도 -- </option>
					<option>2021년</option>
				</select> &nbsp; &nbsp; &nbsp;
				
				<select name="rmonth">
					<option> -- 월 -- </option>
					<option>4월</option>
					<option>5월</option>
					<option>6월</option>
					<option>7월</option>
					<option>8월</option>
					<option>9월</option>
					<option>10월</option>
					<option>11월</option>
					<option>12월</option>
				</select> &nbsp; &nbsp; &nbsp;
				
				<select name="rdate">
					<option> -- 일 -- </option>
					<option>1일</option>
					<option>2일</option>
					<option>3일</option>
					<option>4일</option>
					<option>5일</option>
					<option>6일</option>
					<option>7일</option>
					<option>8일</option>
					<option>9일</option>
					<option>10일</option>
					<option>11일</option>
					<option>12일</option>
					<option>13일</option>
					<option>14일</option>
					<option>15일</option>
					<option>16일</option>
					<option>17일</option>
					<option>18일</option>
					<option>19일</option>
					<option>20일</option>
					<option>21일</option>
					<option>22일</option>
					<option>23일</option>
					<option>24일</option>
					<option>25일</option>
					<option>26일</option>
					<option>27일</option>
					<option>28일</option>
					<option>29일</option>
					<option>30일</option>
					<option>31일</option>
					
				</select>
				
			
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