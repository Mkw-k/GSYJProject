<%@page import="Dto.AdoptDogDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>	
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>	
	<%
} mem = (MemberDto)ologin;
%>    

   
    
<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");
if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}
%>  

<%
List<AdoptDogDto> list = (List<AdoptDogDto>)request.getAttribute("list");

int addPage = Integer.parseInt((String)request.getAttribute("addPage"));
System.out.println("addPage : " + addPage);

int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
System.out.println("pageNumber : " + pageNumber);

%>
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adoptList</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/custom.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 검색어 있는 경우
	let search = "<%=search %>";
	if(search == "") return;
	
	// select
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});
</script>

</head>
<body>


<div align="center">
<br><br>

<h1>입양신청 리스트</h1>
<br><br>

<div align="center">

<table class="table table-hover" style="width: 1000px">
	<thead>
		<tr align="center">
			<th>번호</th><th>제목</th><th>작성자</th><th>삭제</th>
		</tr>	
	</thead>

	<tbody>
	<%
	if(list == null || list.size() == 0){ 
	%>
			<tr>
				<td colspan="3">작성된 글이 없습니다</td>	
			</tr>
	<%
	}else{
		for(int i = 0; i < list.size(); i++){
			AdoptDogDto dto = list.get(i);
			%>
			<tr align="center" height="5">
				<th><%=i +1 %></th>
				<td>
				<%
				if(dto.getDel() == 0){
				%>
					<a href="adopt?param=adoptDetail&seq=<%=dto.getSeq() %>">
					<%=dto.getTitle() %>
					</a>
					<%
				}else{
					%>
				
					<%
				}
					%>
					
				</td>
			
				<td><%=dto.getMyid() %></td>
				<td><input type='button' class='btn btn-secondary' data-toggle="modal" value = '삭제' onclick="seqfunc('<%=dto.getSeq() %>')" data-target="#myModal2"></td>
				</td>
			</tr>	
				<%
				
		}
	}
	%>
		
	</tbody>

</table>
	<br><br>



<!-- 페이징 -->	
<div align="center">

<%
for(int i = 0; i < addPage; i++){
	if(pageNumber == i){
		%>
		<span style="font-size: 15pt; color: aqua; font-weight: bold;">
			<%=i + 1%><i class="fas fa fa-cloud"></i>
		</span>&nbsp;
		<%
	}
	else{
	%>
	<a href="#none" title="<%=i+1 %>폐이지" onclick="goPage(<%=i %>)"
		style="font-size: 15pt; color: blue; font-weight: bold; text-decoration: none">
		[<%=i+1 %>]<i class="fas fa-bars"></i>
	</a>&nbsp;
	<%
	}
}
%>

</div><br>
	


<!-- 검색 -->	
		<select id="choice">
			<option value="title">제목</option>
			<option value="mycontent">내용</option>
			<option value="writer">작성자</option>
		</select>



	<input type="text" id="search" value="<%=search%>">

	<button type="button" onclick="searchAdopt()">검색</button>
	
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
          <button type="button" class="btn btn-secondary" onclick='deleteAbandoned()'>예</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >아니오</button>
        </div>
      </div>
</div>
</div>
  




</div>

<script type="text/javascript">
//삭제버튼 기능
function seqfunc(num) {
	seq = num;
}

function deleteAbandoned() {
	location.href = "adopt?param=adoptDelete&seq=" + seq
}



function searchAdopt() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "adopt?param=adoptList&choice=" + choice + "&search=" + search;
}

function goPage(pageNum) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "adopt?param=adoptList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}

</script>

	

</body>
</html>