<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견생역전</title>
</head>
<body>



<div align="center">
<br>
<h1>반려동물 등록</h1>
<br>
<!-- 파라미터 명을 액션 옆에 써주어야한다 (multipart로 들어가므로)-->
<form action='./rcdFile?param=upload' method="post" enctype="multipart/form-data">
<input type="hidden" name='oldfile' size=50 value=${fileName }>
<table border="1">
<col width="200"><col width="500">


<tr>
	<th>제목</th>
	<td><input type="text" name="title" size=50 ></td>
</tr>


<tr>
	<th>업로드한 파일</th>
	<td><img src="./upload/${fileName }" style='width:100%'></td>
</tr>


<tr>
	<th>변경할 파일 업로드</th>
	<td><input type="file" name="fileload" style="width: 400px"></td>
</tr>


<tr>
	<th>내용</th>
	<td><textarea rows="20" cols="50" name="content">***** 견종을 반드시 작성해주세요! *****</textarea>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="업로드">
	</td>
</tr>

</table>

</form> 
</div>






</body>
</html>