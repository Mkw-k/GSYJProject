<%@page import="Dto.MemberDto"%>
<%@page import="Dto.RescuedDogDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견생역전</title>

<!-- bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<br><br>
<div align = 'center'>
<div class='container'>
<table class='table table-hover'>
	<tr>
		<th> TITLE </th>
		<th>${dto.title } </th>
	</tr>
	<tr>
		<th rowspan=2> CONTENT </th>		
		<td>
			<!-- 유저가 이미지를 새로 업로드 했는지 확인 후 이미지를 출력 -->
			<c:if test='${dto.newfilename != null}'>
				<img src="./upload/${dto.newfilename }" width='80%'>		
			</c:if>
			<c:if test='${dto.newfilename == null}'>
				<img src="./upload/${dto.filename }" width='80%'>		
			</c:if>
			
			<br>
			<p>${dto.myContent }</p>	
			
		</td>
	</tr>
</table>
</div>
</div>
<br>



<div align='center'>
	<input type='button' class="btn btn-secondary" onclick='goList()' value='리스트로 돌아가기'>

	<!-- 로그인 한 경우만 보이기 -->	
	<c:if test='${id != ""}'>
		<!-- 입양진행을 안하고 있는 경우만 보이기 -->
		<c:if test='${dto.condition == 0 }'>
		  <input type='button' class="btn btn-secondary" onclick='adopt()' value='입양 신청'>
		</c:if>
	
		<!-- 매니저만 보이게 하기 -->
		<c:if test='${manager == 1 }'>
		    <input type='button' class="btn btn-secondary" onclick='update()' value='글 수정'>
			<!-- 입양 진행중일 때만 보이게 하기-->
			<c:if test='${dto.condition == 1}'>		  
			  <input type='button' class="btn btn-secondary" data-toggle="modal" data-target="#myModal1" value='입양취소'> 		  
			  <input type='button' class="btn btn-danger" onclick='adoptOk()' value='입양완료'> 
			</c:if>
		<input type='button' class="btn btn-danger" data-toggle="modal" data-target="#myModal2" value='삭제'>
		<input type='button' class="btn btn-danger" data-toggle="modal" onclick='manager()' value='관리자 페이지로 이동'>
		</c:if>
	</c:if>
</div> 
<br>









<!-- 삭제 버튼 -->
<div class="modal fade" id="myModal2">
<div class="modal-dialog modal-md">
      <div class="modal-content">
       <div class="modal-header">  	
       	  <br>
          <h4 class="modal-title">정말로 삭제하시겠습니까</h4>
          <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" onclick='deleteRescued()'>예</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >아니오</button>
        </div>
      </div>
</div>
</div>
  
  
<!-- 입양취소 버튼 -->
<div class="modal fade" id="myModal1">
<div class="modal-dialog modal-md">
      <div class="modal-content">
       <div class="modal-header">  	
       	  <br>
          <h4 class="modal-title">정말로 취소하시겠습니까</h4>
          <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" onclick='cancle()'>예</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >아니오</button>
        </div>
      </div>
</div>
</div>  





<script>

// 리스트로 이동
function goList(){
	location.href = "rescued?param=list";
}

// 글 수정 (관리자만)
function update(){
	location.href = "rescued?param=update&seq=${dto.seq }";
}

//입양신청서 작성
function adopt(){
	location.href = "adopt?param=writeAdopt&seq=${dto.seq }";
} 

//입양 취소
function cancle(){
	location.href = "rescued?param=cancle&seq=${dto.seq }";
} 

//입양 완료
function adoptOk(){
	location.href = "rescued?param=adoptOk&seq=${dto.seq }";
} 

//삭제
function deleteRescued(){
	location.href = "rescued?param=deleteRescued&seq=${dto.seq }";
} 

//관리자 페이지로 이동
function manager(){
	location.href = "manager?param=managerRescuedList";
} 
</script>



</body>
</html>