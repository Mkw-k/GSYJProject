<%@page import="Dto.abandonedDogDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<style type="text/css">


#UrgencyLevel{width: 100px;}
#choice{width: 100px; height: 60px;}
#search{width: 800px; height: 60px;}
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}
#leftScr{width:20%; height:100%; float: left; margin-top: 300px;}
#rightScr{width: 80%; height: 100%; float: left; padding-left: 300px;}
</style>
</head>

<%
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
String id = "";
if(mem == null){
%>
	<script>
	alert('로그인이 필요한 서비스 입니다');
	location.href = 'mem?param=toIndex'
	</script>
<%	
} else 
	id = mem.getMyid();
%>

<body>
<div id="leftScr">
<img alt="" src="./gif/dogwalk.gif" style="max-height: 500px; max-width: 500px; margin-left: 150px;">
</div>
<!-- <form action="bbs?param=writeAf" method="post"> -->
<form action="filedd?param=writeAf" method="post" enctype="multipart/form-data">
<div id="rightScr">
<div class = "container" id="text1">
	<table>
<colgroup>
<col width="200"><col width="400">
</colgroup>

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50px" value="<%=id %>" readonly="readonly">
	</td>
</tr>

<tr>
	<th>위급등급(매우위급5 ~ 건강함1)</th>
	<td>
		<div class="form-group">
      <select class="form-control" id="UrgencyLevel" name="danger">
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
	<th>발견장소</th>
	<td>
		<textarea rows="3" cols="50px" name="address"></textarea>
	</td>
</tr>
<tr>
	<th>연락처</th>
	<td>
		<input type="text" name="phonenum" size="50px">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50px" name="content"></textarea>
	</td>
</tr>
<tr>
	<th>이미지파일</th>
	<td>
		 <input id="imageFile" type="file" name="fileload" accept="image/bmp,image/rle,image/dib,image/jpg,image/jpeg,
		 											image/gif,image/png,image/tif,image/tiff">	
	</td>
</tr>	
<tr>
	<td colspan="2">
		&nbsp;<button type="submit" id="btnSubmit" class="btn btn-warning">제보</button>&nbsp;
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
	    	$("*").prop('required',true);
	    	
	    });
	    
	});
	

});

</script>
<script type="text/javascript">
$(function fileTypeCheck(obj) {
	pathpoint = obj.value.lastIndexOf('.');
	filepoint=obj.value.substring(pathpoint+1,obj.length);
	filetype=filepoint.toLowerCase();
	if(filetype=='bmp'||filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='tif'){
		$('#alert').hide();
	} else {
		$('#alert').show();
	parent Obj = obj.parentNode
	node=parentObj.replaceChild(obj.cloneNode(true),obj);
	return false;
	}
	
});
</script>
</html>