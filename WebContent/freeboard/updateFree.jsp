<%@page import="Dto.BbsDto"%>
<%@page import="Dto.MemberDto"%>
<%@page import="Dao.freeBoardDao"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ServletConfig mConfig = null;
	final int BUFFER_SIZE = 8192;
	
	
		mConfig = config;	
	
	String fupload = mConfig.getServletContext().getRealPath("/upload");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 수정</title>
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
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

freeBoardDao dao = freeBoardDao.getInstance();
BbsDto dto = dao.getFree(seq);
%>
<body>
<form action="freeFile" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<input type="hidden" name="param" value="updateFreeAf">
<div class="container" id="text1">
<table>

<tr>
	<th>작성자</th>
	<td>
	<input type="text" value="<%=mem.getMyid()%>" name="id" readonly="readonly">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" value="<%=dto.getTitle() %>" name="title">
	</td>
</tr>
<tr>
	<th>이미지</th>
	<td>
		<img class="uploadImage" alt="" src="./upload/<%=dto.getFilename()%>" style="max-width: 600px; max-height: 600px;">
		<input type="hidden" name="oldfile" size="50" value="<%=dto.getFilename() %>">
	</td>
</tr>
<tr>
	<th>변경할 파일 업로드</th>
	<td>
		<input type="file" name="fileload" size="50" accept="image/bmp,image/rle,image/dib,image/jpg,image/jpeg,
		 											image/gif,image/png,image/tif,image/tiff">
	</td>	
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="100" name="content"><%=dto.getMycontent() %></textarea>
	</td>
</tr>
</table>
<div class="utill4">
<input type="submit" class="btn btn-warning" value="완료">
</div>
<div class="utill4">
<button type="button" class="btn btn-warning" OnClick="javascript:history.back(-1)">취소</button>
</div>
</div>
</form>

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
	    	$(".title").prop('required',true);
	    	//%("formTest").attr("action, "NewFile.jsp").submit();
	    	
	    });
	});

});
</script>


</body>



</html>