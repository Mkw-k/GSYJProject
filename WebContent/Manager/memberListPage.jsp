
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 회원 목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}
.utill2{float: center;}

.location{color: aqua;}

#choice{width: 100px; height: 60px;}
#search{width: 400px; height: 60px; text-align: center;}
#leftScr{width:20%; height:100%; float: left; margin-top: 300px;}
#rightScr{width: 80%; height: 100%; float: left;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = null;
String nowLog = "";
if(session.getAttribute("login") == null){
   nowLog = "로그인 해주세요";
}else{
   Object ologin = session.getAttribute("login");
   mem = (MemberDto)ologin;
   nowLog = mem.getMyid()+" 님 환영합니다";
}
%>
<%
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");

if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}
%>

<%
MemberDao dao = MemberDao.getInstance();
List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");

%>

<%
int memPage = Integer.parseInt((String)request.getAttribute("memPage"));
System.out.println("memPage:" +memPage);

int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
System.out.println("pageNumber:" + pageNumber);

int len = Integer.parseInt((String)request.getAttribute("len"));

System.out.println("len:" + len); 
%>
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
<div id="leftScr">
<img alt="" src="./gif/puppy1.gif" style="max-height: 500px; max-width: 500px; margin-left: 150px; width: 100%; overflow: auto;">
</div>
<div id="rightScr">
<div id="text1" align="center">
<p class="welc" align="center">환영합니다 <%=mem.getMyid() %>님</p>
	<table>
	
	<col width="100"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
    <thead>
      <tr align="center">
        <th>번호</th>
        <th>맴버SEQ</th>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>연락처</th>
        <th>패스워드</th>
        <th>삭제</th>
      </tr>
    </thead>
	<tbody>
      <%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="3">회원정보가 없습니다</td>
	</tr>
<%

} else{
for(int i = 0;i < list.size(); i++){
	MemberDto dto = list.get(i);
	%>
			<tr align="center" height="5">
			<th><%=i+1 + pageNumber*10 %></th>
			<td>
				
			
				<a class="location" href="mem?param=openMemberDetail&seq=<%=dto.getSeq() %>">
					<%=dto.getSeq() %>
				</a>
				
			</td>
			<td><%=dto.getMyid() %></td>
			<td><%=dto.getMyname() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=dto.getPhonenum() %></td>
			<td><%=dto.getPwd() %></td>
			<th><input type='button' class='btn btn-secondary' data-toggle="modal" value = '삭제' onclick="seqfunc('<%=dto.getSeq() %>')" data-target="#myModal2"></th>
		</tr>
		<%
	}
}
%>

	</tbody>
</table>	

	<br><br>

<div align="center">
<!-- 페이징 	[1] 2 [3] -->
<%

for(int i = 0;i < memPage; i++){
	if(pageNumber == i){	// 현재 페이지		[1] 2 [3] 
		%>
		<span style="font-size: 15pt; color: aqua; font-weight: bold;">
			<%=i + 1 %><i class="fas fa-cloud"></i>
		</span>&nbsp;
		<%
	}
	else{
		%>		
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: blue; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]<i class="fas fa-bars"></i>
		</a>&nbsp;	
		<%
	}	
	
} 
%>
</div><br>
	
	<br>
	
	<table class="utill2">
		
		<tr>
			 
				<th>
				<select id="choice" class="form-control" name="sellist1"> 
					<option value="id">아이디</option>
					<option value="name">이름</option>
				</select>
				</th>
				<th>
				<input type="text" id="search" class="form-control" value="<%=search%>">
				</th>
				<th>
				<button type="button" class="btn btn-warning" onclick="searchBbs()"><p class="text-info">Search</p></button>
				</th>
		
		</tr>
				
	</table>


</div>
</div>



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
          <button type="button" class="btn btn-secondary" onclick='deleteMem()'>예</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >아니오</button>
        </div>
      </div>
</div>
</div>



<script type="text/javascript">

let seqnum = 0;
function seqfunc(seq) {
	seqnum = seq;
}

function deleteMem(){
	location.href="mem?param=deleteMember&seq="+seqnum;
};


function searchBbs() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	
	location.href = "mem?param=allMemberList&choice=" + choice + "&search=" + search;
}


function goPage( pageNum ) {
	
	
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "mem?param=allMemberList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}


</script>
			
</body>
</html>