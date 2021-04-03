<%@page import="Dto.MemberDto"%>
<%@page import="Dto.abandonedDogDto"%>
<%@page import="Dao.abandonedDogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">


#UrgencyLevel{width: 100px;}
#choice{width: 100px; height: 60px;}
#search{width: 800px; height: 60px;}
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}
</style>
</head>
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

abandonedDogDao dao = abandonedDogDao.getInstance();
abandonedDogDto dto = dao.getReport(seq);
%>

<body>
<div class ="container"id="text1">
<form action="filedd?param=updateAf" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=seq %>">
	<table >
	<caption><h1>상세 글 보기</h1></caption>
<colgroup>
	<col style="width: 150">
	<col style="width: 600">
</colgroup>

<tr>
	<th>작성자</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="60" 
			value="<%=mem.getMyid() %>"> 		
	</td>	
</tr>
<tr>
	<th>연락처</th>
	<td>
		<input type="text" name="phonenum" size="60" value="<%=dto.getPhonenum() %>">		
	</td>
</tr>
<tr>
	<th>장소</th>
	<td>
		<input type="text" name="address" size="60" value="<%=dto.getAddress() %>">		
	</td>
</tr>
<tr>
	<th>위급등급(매우위급5 ~ 건강함1)</th>
	<td>
		<div class="form-group">
      <select class="form-control" id="UrgencyLevel" name="danger">
      	<option value="<%=dto.getDanger() %>" selected="selected"><%=dto.getDanger() %></option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
    	</div>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="60" name="mycontent"><%=dto.getMycontent() %></textarea>		
	</td>
</tr>
<tr>
	<th>업로드파일</th>
	<td>
		<input type="text" name="oldfile" size="50" value="<%=dto.getFilename() %>">
		<input type="hidden" name="oldnewfile" size="50" value="<%=dto.getNewfilename() %>">
	</td>
</tr>

<tr>
	<th>변경할 파일 업로드</th>
	<td>
		<input type="file" name="fileload" size="50" accept="image/bmp,image/rle,image/dib,image/jpg,image/jpeg,
		 											image/gif,image/png,image/tif,image/tiff">
	</td>	
</tr>

</table>
<div class="utill4">
<input type="submit" class="btn btn-warning" value="완료">
</div>
<div class="utill4">
<button type="button" class="btn btn-warning" OnClick="javascript:history.back(-1)">취소</button>
</div>
</form>
</div>
</body>
<script type="text/javascript">
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
	    	//%("formTest").attr("action, "NewFile.jsp").submit();
	    	
	    });
	});

});
</script>
</html>