<%@page import="util.UtilEx"%>
<%@page import="Dto.RescuedDogDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 값 받아오기
List <RescuedDogDto> list = (List<RescuedDogDto>)request.getAttribute("list"); //테이블에 뿌려줄 List 
int pages = Integer.parseInt((String)request.getAttribute("page"));            //현재 페이지 
int viewPage = Integer.parseInt((String)request.getAttribute("viewPage"));     //보이는 페이지 수
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견생역전</title>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>

<body>
<div align=center>
<br>
<h2>입양 리스트 관리</h2>
<br>
	<table class="table table-hover" style="width: 1000px">
	<col width ='10px'><col width='100px'><col width ='100px'>
	<thead>
	<tr>	
		<th>번호</th><th>제목</th><th>관리</th>
	</tr>
	</thead>
	
	<tbody>
	
<%
	if(list == null || list.size() == 0){
		%>
		<tr><td colspan="3">작성된 글이 없습니다</td>	</tr>
		<%
	}
	else{
		for(int i = 0;i < list.size(); i++){
			RescuedDogDto dto = list.get(i);
			%>
			<tr>
				<th><%=i + 1 %></th>
				<td><a style=color:black href='rescued?param=detail&seq=<%=dto.getSeq() %>'> 
					<%=dto.getTitle() %> 
				</a></td>
				<td>
				<input type='button' class='btn btn-secondary' data-toggle="modal" value='입양진행중' onclick="adoptGo('<%=dto.getSeq() %>')"> 
				<input type='button' class='btn btn-secondary' data-toggle="modal" data-target="#myModal1" value='입양취소' onclick="seqfunc('<%=dto.getSeq() %>')"> 
				<input type='button' class='btn btn-secondary' data-toggle="modal" value='입양완료' onclick='adoptOk(<%=dto.getSeq() %>)'> 
				<input type='button' class='btn btn-secondary' data-toggle="modal" value = '삭제' onclick="seqfunc('<%=dto.getSeq() %>')" data-target="#myModal2">
				</td>
			</tr>
			<%
			}
		}
%>
			
	</tbody>
</table>
</div>










<!-- 페이징  -->
<div align="center">
<%                //출력되는 페이지 수 
for(int i = 0;i < viewPage; i++){
	if(pages == i){	// 현재 페이지 [1] 2 [3] 
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%
	}
	else{
		%>		
		<a href="#none" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
		</a>&nbsp;	
		<%
	}	
}
%>
</div>

<!-- 검색기능  -->
<div align="center">
<select id="choice"> 
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>

<input type="text" id="search" value='<%=search %>'>
<input type='button' class='btn btn-secondary' value='검색' onclick="search()">
<br><br>
</div>


<!-- 그 외 버튼 기능  -->
<div align='center'>
<input type='button' class='btn btn-secondary' value='목록'  onclick="reList()">
<input type='button' class='btn btn-secondary' value='HOME' onclick="goHome()">
</div>
<br><br>







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
let seqnum;

function seqfunc(seq) {
	seqnum = seq;
}

// 검색 기능 
function search(){
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "rescued?param=list&choice=" + choice + "&search=" + search;
};

// 페이징 기능
function goPage(page){
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "rescued?param=list&choice=" + choice + "&search=" + search + "&pageNumber=" + page;
};

// 목록으로 돌아가기
function reList(){
	location.href = "manager?param=managerRescuedList";
};


//홈으로 돌아가기
function goHome(){
	location.href = "rescued?param=home";
};


//입양 진행중
function adoptGo(seq){
	location.href = "manager?param=managerRescuedAdoptGo&seq="+seq;
};


//입양 취소
function cancle(){
	location.href = "manager?param=managerRescuedAdoptCan&seq="+seqnum;
}; 


//입양 완료
function adoptOk(seq){
	location.href = "manager?param=managerRescuedAdoptOk&seq="+seq;
}; 

//삭제
function deleteRescued(){
	location.href="manager?param=managerRescuedDel&seq="+seqnum;
};


</script>


</body>
</html>