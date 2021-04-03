<%@page import="Dto.MemberDto"%>
<%@page import="Dto.RescuedDogDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.RescuedDogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 값 받아오기
List <RescuedDogDto> list = (List<RescuedDogDto>)request.getAttribute("list"); //테이블에 뿌려줄 List 
int pages = Integer.parseInt((String)request.getAttribute("page"));            //현재 페이지 
int viewPage = Integer.parseInt((String)request.getAttribute("viewPage")); //보이는 페이지 수
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
%> 
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견생역전</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>


<body>
<br><br>
<div align="center">
<h2>입양 신청</h2>
<br><br>
<table class="table table-hover" style="width: 1000px">
	<thead>
	<tr>	
		<th>NO</th><th>TITLE</th><th>COUNT</th><th>DATE</th>
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
				<td><%=dto.getVcount() %></td>
				<td><%=dto.getWdate() %></td>
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



<script>

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
	location.href = "rescued?param=list";
};


//홈으로 돌아가기
function goHome(){
	location.href = "rescued?param=home";
};



</script>




</body>
</html>