
<%@page import="Dto.MemberDto"%>
<%@page import="Dto.RescuedDogDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<%
RescuedDogDto dto = (RescuedDogDto)request.getAttribute("dto");
System.out.println("RescuedUpdate.jsp:" + dto.toString());
%>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견생역전</title>
</head>
<body>



<div align="center">
<h1>입양 가능 리스트 수정</h1>
<form action='./rcdFile?param=update' method="post" enctype="multipart/form-data">
<input type='hidden' name='seq' value=${dto.seq }>

<table border="1">
<col width="200"><col width="500">


<tr>
	<th>제목</th>
	<td><input type="text" name="title" size=50 value='${dto.title }'></td>
</tr>


<tr>
	<th>업로드한 파일</th>
	<td>
	
	<!-- 유저가 이미지를 새로 업로드 했는지 확인 후 이미지를 출력 -->
	<c:if test='${dto.newfilename != null}'>
		<img src="./upload/${dto.newfilename }" style='width:100%'>
		<input type='hidden' name='oldfile' value='${dto.newfilename }'>
	</c:if>
	<c:if test='${dto.newfilename == null}'>
		<img src="./upload/${dto.filename }" style='width:100%'>
		<input type='hidden' name='oldfile' value='${dto.filename }'>
	</c:if>	
	</td>
</tr>


<tr>
	<th>변경할 파일 업로드</th>
	<td><input type="file" name="fileload" style="width: 400px"></td>
</tr>


<tr>
	<th>내용</th>
	<td><textarea rows="20" cols="50" name="myContent">${dto.myContent }</textarea>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="수정 완료">
		<input type="button" value="수정 취소" onclick='goList()'>
	</td>
</tr>

</table>

</form> 

</div>

<script>
	function goList(){
		location.href = "rescued?param=list"
	}
</script>



</body>
</html>