<%@page import="Dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BbsDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  
  
 
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
</head>
<body>
<%
BbsDao dao = BbsDao.getInstance();
List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");



int adPage = Integer.parseInt((String)request.getAttribute("adPage"));
System.out.println("adPage:" +adPage);

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
<img alt="" src="./gif/tumblr_ce1f7c7f6aa9aad94bfe5713a3672b06_39eed144_1280.gif" style="max-height: 500px; max-width: 500px; margin-left: 150px; width: 100%; overflow: auto;">
</div>
<div id="rightScr">
<div id="text1" align="center">
<p class="welc" align="center">환영합니다 <%=mem.getMyid() %>님</p>
	<table>
	
	<col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
    <thead>
      <tr align="center">
        <th>번호</th>
        <th>아이디</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
        
      </tr>
    </thead>
	<tbody>
      <%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="3">게시글이 없습니다</td>
	</tr>
<%

} else{
for(int i = 0;i < list.size(); i++){
	BbsDto dto = list.get(i);
	%>
			<tr align="center" height="5">
			<th><%=i+1+pageNumber*10 %></th>
			<td>
				<%if(dto.getDel() == 0){
					%>	
			
				
					<%=dto.getMyid() %>
				
				<%
				}else{
				%>
				<font color="#ff0000">이글은 삭제되었습니다.</font>
				<%
				}
				%>
			</td>
			<td><a class="location" href="freeb?param=openDetail&seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a></td>
			<td><%=dto.getWdate() %></td>
			<td><%=dto.getVcount() %></td>
		</tr>
		<%
	}
}
%>

	</tbody>
</table>

	<div align="center">
<!-- 페이징 	[1] 2 [3] -->
<%

for(int i = 0;i < adPage; i++){
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
					<option value="title">제목</option>
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
		<div align="center">
		<button type="button" class="btn btn-warning" onclick="writeBtn()">글쓰기</button>
		<br>
		
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function writeBtn(){
	location.href = "freeb?param=writeFree";
}


function goPage( pageNum ) {
	   
	   
	   let choice = document.getElementById("choice").value;
	   let search = document.getElementById("search").value;
	   
	   location.href = "freeb?param=toFreeboardlist&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;   
	}

</script>
</html>