<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
request.setCharacterEncoding("utf-8");
Object ologin = request.getSession().getAttribute("login");
MemberDto mem = null;

if(ologin == null){
	
	response.sendRedirect("login.jsp");
}
mem = (MemberDto)ologin;	
%>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());
MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getMemberDetail(seq);

%>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">

#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}

</style>
</head>
<body>
<div class ="container"id="text1">
<form id="frm1"method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
	<table >
	
<colgroup>
	<col style="width: 150">
	<col style="width: 600">
</colgroup>

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="60" 
			value="<%=dto.getMyid() %>"> 		
	</td>	
</tr>

<tr>
	<th>패스워드</th>
	<td>
		<input type="password" name="currentpwd" size="60" value="<%=dto.getPwd() %>">		
	</td>
</tr>
<tr>
	<th>변경할 패스워드</th>
	<td>
		<input type="password" id="pwd" name="pwd" size="60" value="">		
	</td>
</tr>
<tr>
	<th>변경할 패스워드 확인</th>
	<td>
		<input type="password" id="pwd2" name="pwd2" size="60" value="">		
	</td>
</tr>
<tr>
	<th>새로운 패스워드 확인</th>
	<td>
		<input type="button" name="pwdcheck" size="60" onclick="pwdCheck()" value="패스워드 체크">	
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" name="name" size="60" 
			value="<%=dto.getMyname() %>"> 		
	</td>	
</tr>
<tr>
	<th>연락처</th>
	<td>
		<input type="text" name="phonenum" size="60" value="<%=dto.getPhonenum() %>">		
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text" name="email" size="60" value="<%=dto.getEmail() %>">		
	</td>
</tr>

</table>
<div class="utill4">

<button type="button" class="btn btn-warning"  data-toggle="modal" data-target="#updateMemModal" >완료</button>
<div class="modal fade" id="updateMemModal">
			<div class="modal-dialog">
      			<div class="modal-content">
      				<div class="modal-header">
				          <h4 class="modal-title">정보수정</h4>
				          <button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        
				      		  <!-- Modal body 내용 -->
				        <div class="modal-body">
				          	회원정보 수정을 완료 하시겠습니까?
				        </div>
				        
				       		 <!-- Modal footer 닫기버튼 붙여주기-->
				        <div class="modal-footer">
				       	<button type="submit" id="btnSubmit" class="btn btn-warning" data-dismiss="modal">완료</button>
				          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
      			</div>
      		</div>
</div>


<button type="button" class="btn btn-warning" OnClick="javascript:history.back(-1)">취소</button>
</div>
</form>
</div>

<script type="text/javascript">

function pwdCheck() {
	let newpwd = document.getElementById("pwd").value;
	let newpwd2 = document.getElementById("pwd2").value;
	
	if( (newpwd != newpwd2) || (newpwd==null) || (newpwd=="") ) {
		alert("비밀번호가 올바르지 않습니다");
	} else {
		alert("사용할 수 있는 비밀번호 입니다")
	}
	
	
	
}
$(document).ready(function () { 
	$(function() {
	    $("*").focus(function () {
	        $(this).css("background-color", "yellow");
	    });
	    $("*").blur(function () { 
	        $(this).css("background-color", "white");
	    });
	    
	    $("#btnSubmit").click(function() {
	    	//빈칸체크
	    	$("*").prop('required',true);
	    	$("#frm1").attr("action", "mem?param=updateAf").submit();
	    	
	    });
	});

});
</script>
</body>
</html>