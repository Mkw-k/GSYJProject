<%@page import="Dto.MemberDto"%>
<%@page import="Dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
String choice = request.getParameter("choice");
String search = request.getParameter("search");
if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}
--%> 


<%
/* 
BbsDao dao = BbsDao.getInstance();


String spageNumber =(String)request.getAttribute("pageNumber");
int pageNumber = 0;
if(spageNumber != null && !spageNumber.equals("")){
	pageNumber = Integer.parseInt(spageNumber);
}

System.out.println("넘어온 pageNumber : "+ pageNumber);

List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");

String nlen = (String)request.getAttribute("len");


int len = 0;
if(nlen != null){
	 len = Integer.parseInt(nlen);
}

System.out.println("넘어온 len : "+ len);

int bbspage = len/10;
if((len%10) > 0){
	bbspage = bbspage +1;
}

System.out.println("넘어온 bbspage : "+ bbspage); 

*/

MemberDto mem = (MemberDto)session.getAttribute("login");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
int pageNumber =Integer.parseInt((String)request.getAttribute("pageNumber"));
String len = (String)request.getAttribute("len");
int bbspage = Integer.parseInt((String)request.getAttribute("bbspage"));
List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");

System.out.println("choice : "+choice);
System.out.println("search : "+search);
System.out.println("pageNumber : "+ pageNumber);
System.out.println("len : "+ len);
System.out.println("bbspage : "+ bbspage);
System.out.println("list : "+ list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />

<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">
.community{
	height: 900px;
	padding-top: 180px;
}
</style>

</head>
<body>

<div class="community">
<h1 style="text-align: center;">우리집 멍냥이</h1>
<div align="center">
<table border="1" style="text-align: center; align-items: center;">


<col width="100"><col width="200"><col width="400"><col width="120"><col width="150"><col width="100">
<thead>
<tr>	
			<th>글번호</th><th>제목</th><td>이미지</td><td>내용</td><td>작성자</td><td>작성시간</td><td>조회수</td>
</tr>
</thead>
<tbody>
<%
if(list.size() == 0){
	%>
	<tr>
		<td colspan="7">작성 내용이 없습니다</td>
	</tr>
	<%
}
	
		for(int i = 0; i< list.size(); i++){
			BbsDto bbs = list.get(i);
		
		%>
		<tr>
			<td><%=i+1 %></td>	
			<td>
			<a href="bbs?param=bbsDetail&seq=<%=bbs.getSeq() %>">
			<%=bbs.getTitle() %>
			</a>
			</td>
			<th>
			<%--  <input type="button" name="btndown" value="파일"
					onclick="location.href='bbsdown?filename=<%=bbs.getFilename() %>&seq=<%=bbs.getSeq() %>'">    --%>
					<a href="bbs?param=bbsDetail&seq=<%=bbs.getSeq() %>">
				 <img src="./upload/<%=bbs.getFilename() %>" style="width: 250px; height: 200px">
				 </a>	
			</th>
			
			<td>
			<a href="bbs?param=bbsDetail&seq=<%=bbs.getSeq() %>">
			<%=bbs.getMycontent() %>
			</a>
			</td>
			<td><%=bbs.getMyid() %></td>
			<td><%=bbs.getWdate() %></td>
			<td><%=bbs.getVcount() %></td>
		</tr>
		<%
	}

 %>
 </tbody>

</table>

<div align="center">

<% 
	for(int i =0; i< bbspage; i++ ){
		if(pageNumber == i){
			%>
			<span stylse="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
			</span>&nbsp;
			<%
		}
		else{
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
			</a>&nbsp;
			<%
	}
}
%>


</div>

<br><br>



<div align="center">

<select id="choice"> 
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBbs()">검색</button>

</div>
<br>	
<input id="_bbsSbnBtn" type="button" value="글쓰기" >
<br><br>

</div>
</div>

<script type="text/javascript">
$("#_bbsSbnBtn").click(function() {
	location.href="bbs?param=bbsWrite";
});

function searchBbs() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
//	alert(choice);
//	alert(search);
	
/* 	location.href = "bbslist.jsp?choice=" + choice + "&search=" + search; */
	location.href = "bbs?param=getPagingBbsList&choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	/* location.href = "bbslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum; */	
	location.href = "bbs?param=getPagingBbsList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}

</script>
</body>
</html>