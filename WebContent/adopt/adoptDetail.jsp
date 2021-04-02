<%@page import="Dto.AdoptDogDto"%>
<%@page import="Dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adoptDetail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>

<%
AdoptDogDto dto = (AdoptDogDto)request.getAttribute("adopt");
int seq = dto.getSeq();
%>



<div align="center">
<br><br>
<h1>상세 글 보기</h1>
<br>
	<input type="hidden" name="seq" id="_seq" value="<%=dto.getSeq() %>">
	<table class="table table-bordered" style="width: 1000px">
	<col width="150px">
		<tr>
			<th>작성자</th>
			<td><%=dto.getMyid() %></td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td><%=dto.getWdate() %></td>
		</tr>
	
		<tr>
			<th>입양희망일</th>
			<td><%=dto.getRdate() %></td>
		</tr>
		
		<tr>
			<th>연락처</th>
			<td><%=dto.getPhoneNum() %></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>
				입양동기 및 과거 키웠던 경험 등 자유롭게 적어주세요.
				<textarea rows="15" cols="100" readonly="readonly"><%=dto.getMycontent() %></textarea>
			</td>
		</tr>
	
	</table>
	
	<button type="button" onclick="location.href='adopt?param=adoptList'">글목록</button>

<%
if(dto.getMyid().equals(mem.getMyid())){
	%>
	<button type="button" onclick="updateAdopt(<%=dto.getSeq() %>)">수정</button>
	<button type="button" onclick="deleteAdopt(<%=dto.getSeq() %>)" id="del">삭제</button>
	<%
}
%>
	 
</div>

<script type="text/javascript">
function updateAdopt(seq) {
	location.href = "adopt?param=adoptUpdate&seq=" + seq;
}

 function deleteAdopt(seq){
	location.href = "adopt?param=adoptDelete&seq=" + seq;
}

</script>



</body>
</html>


