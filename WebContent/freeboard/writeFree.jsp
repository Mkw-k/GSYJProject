<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유글 작성</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


 <style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}
#leftScr{width:20%; height:100%; float: left; margin-top: 300px;}
#rightScr{width: 80%; height: 100%; float: left;}
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
<body>
<div id="leftScr">
<img alt="" src="./gif/tumblr_ce1f7c7f6aa9aad94bfe5713a3672b06_39eed144_1280.gif" style="max-height: 500px; max-width: 500px; margin-left: 150px;">
</div>

<form action="freeFile" method="post" enctype="multipart/form-data">
<input type="hidden" name="param" value="writeFreeAf">
<div id="rightScr">
<div class = "container" id="text1">
	<table>
<colgroup>
<col width="200"><col width="400">
</colgroup>

<tr>
	<th>아이디</th>
	<td>
		<%-- <input type="text" name="id" size="50px" value="<%=mem.getId() %>"> --%>
		<input type="text" name="id" size="50px" value="<%=mem.getMyid() %>" readonly="readonly">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<textarea rows="3" cols="50px" name="title"></textarea>
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50px" name="content"></textarea>
	</td>
</tr>
<tr>
	<th>첨부파일</th>
	<td>
		 <input id="imageFile" type="file" name="fileload" accept="image/bmp,image/rle,image/dib,image/jpg,image/jpeg,
		 											image/gif,image/png,image/tif,image/tiff">	
	</td>
</tr>	
<tr>
	<td colspan="2">
		&nbsp;<button type="submit" id="btnSubmit" class="btn btn-warning">완료</button>&nbsp;
		<button type="button" class="btn btn-warning" OnClick="javascript:history.back(-1)">취소</button>
	</td>
</tr>
</table>

</div>
<!-- </form> -->
</div>
</form>
	<div id="alert" class="alert alert-warning" role="alert" style="display:none;">
 	 이미지 파일을 업로드 해주세요!
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
	    	$(".title").prop('required',true);
	    	
	    	
	    	
	    });
	    
	});
	

});

</script>


</html>