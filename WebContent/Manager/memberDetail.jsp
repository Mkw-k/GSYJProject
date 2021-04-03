<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 디테일</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}


</style>
</head>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%>
<%
MemberDto dto = (MemberDto)request.getAttribute("detail");
int seq = dto.getSeq();
%>
<body>
<div class="container" id="text1">
	<table>
	<col width="100"><col width="100">
	

<tr>
	<th>아이디</th>
	<td><%=dto.getMyid() %></td>
</tr>

<tr>
	<th>패스워드</th>
	<td><%=dto.getPwd() %></td>
</tr>

<tr>
	<th>이름</th>
	<td><%=dto.getMyname() %></td>
</tr>

<tr>
	<th>이메일</th>
	<td><%=dto.getEmail() %></td>
</tr>
<tr>
	<th>연락처</th>
	<td><%=dto.getPhonenum() %></td>
</tr>


<%
if(mem.getMymanager() == 1){
%>
<tr>
	<th>맴버SEQ</th>
	<td><%=dto.getSeq() %></td>
</tr>
<tr>
	<th>관리자번호</th>
	<td><%=dto.getMymanager() %></td>
</tr>
<%
}
%>
</table>

<% 
if(mem.getMymanager() == 1 || mem.getMyid().equals(dto.getMyid())){
%>
<div class="utill4">

<button type="button" class="btn btn-warning"  data-toggle="modal" data-target="#updateMemModal" >수정</button>
<div class="modal fade" id="updateMemModal">
			<div class="modal-dialog">
      			<div class="modal-content">
      				<div class="modal-header">
				          <h4 class="modal-title">수정</h4>
				          <button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        
				      		  <!-- Modal body 내용 -->
				        <div class="modal-body">
				          	회원정보를 수정하시겠습니까?
				        </div>
				        
				       		 <!-- Modal footer 닫기버튼 붙여주기-->
				        <div class="modal-footer">
				       	<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="updateBtn(<%=dto.getSeq() %>)">수정</button>
				          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
      			</div>
      		</div>
</div>
</div>
<%
}
%>
<br>
<br>
<% 
if(mem.getMymanager() == 1){
%>
<div class="utill4">
<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#deleteMemModal">삭제</button>
<div class="modal fade" id="deleteMemModal">
			<div class="modal-dialog">
      			<div class="modal-content">
      				<div class="modal-header">
				          <h4 class="modal-title">삭제</h4>
				          <button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        
				      		  <!-- Modal body 내용 -->
				        <div class="modal-body">
				          	회원정보를 삭제 하시겠습니까?
				        </div>
				        
				       		 <!-- Modal footer 닫기버튼 붙여주기-->
				        <div class="modal-footer">
				       	<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="deleteBtn(<%=dto.getSeq() %>)">삭제</button>
				          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
      			</div>
      		</div>
</div>
<button type="button" class="btn btn-warning" OnClick="location.href='mem?param=allMemberList'">목록</button>
</div>
<%
}
%>
<% 
if(mem.getMyid().equals(dto.getMyid())){
%>
<div class="utill4">
<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#deleteMemModal">회원탈퇴</button>
<div class="modal fade" id="deleteMemModal">
			<div class="modal-dialog">
      			<div class="modal-content">
      				<div class="modal-header">
				          <h4 class="modal-title">탈퇴</h4>
				          <button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        
				      		  <!-- Modal body 내용 -->
				        <div class="modal-body">
				          	회원탈퇴를 진행합니다.
				        </div>
				        
				       		 <!-- Modal footer 닫기버튼 붙여주기-->
				        <div class="modal-footer">
				       	<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="deleteBtn(<%=dto.getSeq() %>)">탈퇴</button>
				          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				        </div>
      			</div>
      		</div>
</div>
<br><br>
<button type="button" class="btn btn-warning" OnClick="location.href='index.jsp'">메인으로 이동</button>
</div>
<%
}
%>
</div>

</body>
<script type="text/javascript">
function updateBtn( seq ) {
	
	location.href = "mem?param=updateMember&seq=" + seq;
}
function deleteBtn(seq){
	location.href = "mem?param=deleteMember&seq=" + seq;
}
</script>
</html>