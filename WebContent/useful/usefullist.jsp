<%@page import="Dto.UsefulDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");

String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
int pageNumber =Integer.parseInt((String)request.getAttribute("pageNumber"));
int len = Integer.parseInt((String)request.getAttribute("len"));
int bbspage = Integer.parseInt((String)request.getAttribute("bbspage"));
List<UsefulDto> list = (List<UsefulDto>)request.getAttribute("list");

int manager = 0;
if(mem != null){
	manager = mem.getMymanager();
}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />

<!-- 부스스트랩) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<style type="text/css">
.selectTool{
		text-align: center;
		/* margin-top: 200px; */
}
	
.searchTxt{
		margin: 0px 10px;
}
	
.innerTable{
		padding: 10px 10px;
		margin: 15px 10px;
		
		
}
	
a:focus {
		color: red;
}

a{
		color: blue;
		text-decoration: none;
}

.titleTxt{
		padding-left: 20px;	
		color: gray;
}
	
</style>
</head>
<body>
<!-- 헤더부분 -->

<div class="allTable" align="center">
<table>
<tbody>
<%
if(list.size() == 0){
	%>
	<tr>
		<td colspan="4">작성 내용이 없습니다</td>
	</tr>
	<% 
}
%>
	

<tr>
<%
for(int i=1; i <= list.size(); i++){
	UsefulDto dto = list.get(i-1);
		%>
		<td>
		<table>
			<tr>
				<td><iframe width="600" height="400" src="https://www.youtube.com/embed/<%=dto.getLink() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
			</tr>
			<tr>	
				<td class="titleTxt" style="text-align: center;">
				<a href="use?param=useDetail&seq=<%=dto.getSeq()%>">
				<%=dto.getTitle() %>
				</a>
				</td>
			</tr>
			<tr>
				<td class="titleTxt"><%=dto.getMyid() %></td>
			</tr>
			<tr>
				<td class="titleTxt">조회수&nbsp;<%=dto.getReadcount() %>회 · <%=dto.getWdate().substring(0, 11) %>  </td>
			</tr>
		</table>
	</td>
	<%
	if(i%2==0){
	%>
	 </tr><tr>
<%
	}//end if

}//end for 
%>
</tr>

</tbody>
</table>
</div>

<div align="center">

<% 
//페이지넘버 출력 
	for(int i =0; i< bbspage; i++ ){
		if(pageNumber == i){
			%>
			<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
			</span>&nbsp;
			<%
		}
		else{
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%= i + 1 %>]
			</a>&nbsp;
			<%
	}
}
%>

</div>
<br>
<div align='center'>
<%
if(manager==1){
%>
<input id="_bbsBtn" type="button" value="글쓰기" class='btn btn-secondary'>
<%
}
%>
</div>
<br>

<script type="text/javascript">


function goPage( pageNum ) {
	let choice = "";
	let search = "";

	if($("#search").val()!=null ){
		 choice = document.getElementById("choice").value;
		 search = document.getElementById("search").value;
	}
	
	location.href = "use?param=UsefulTabPagingList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

function searchBbs(pageNum) {
let choice = "";
let search = "";

if($("#search").val()!=null ){
	 choice = document.getElementById("choice").value;
	 search = document.getElementById("search").value;
}

alert(choice);
alert(search);
	
location.href = "use?param=UsefulTabPagingList&choice=" + choice + "&search=" + search;
}


$("#_bbsBtn").click(function() {
	location.href = "use?param=writeUse";
});


</script>

</body>
</html>