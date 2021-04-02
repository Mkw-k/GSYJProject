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

<!-- <a href="bbs?param=logout">로그아웃</a> -->



<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>

<%
AdoptDogDto dto = (AdoptDogDto)request.getAttribute("adopt");
int seq = dto.getSeq();

%>

<div align="center">

<h1>글 수정</h1>

<form action="adopt?param=adoptUpdateAf" method="post">
	<input type="hidden" name="seq" id="updateSeq" value="<%=seq %>">
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
				
				<select name="rday">
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

<a href="adopt?param=adoptList">글목록</a>
</div>




<script type="text/javascript">
/* $(function () {
	
	$("#updateCheck").click(function () {
		
		$.ajax({
			type: "post",
			url: "adopt?param=updateCheck",
			data:{"seq":$("#updateSeq").val()},
			success:function(data){
				
				if(data.msg == "complete"){
					alert('')
				}
			}
		})
	});
});

 */
 

</script> -


</body>
</html>



