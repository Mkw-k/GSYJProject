<%@page import="Dto.MemberDto"%>
<%@page import="Dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
int pageNumber =Integer.parseInt((String)request.getAttribute("pageNumber"));
int len = Integer.parseInt((String)request.getAttribute("len"));
int bbspage = Integer.parseInt((String)request.getAttribute("bbspage"));
List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link rel="stylesheet" href="css/thumbnail-gallery.css">
</head>
<body>

<br>



 <div class="container gallery-container">

    <h1>우리 멍냥이는요</h1>
 <p class="page-description text-center"></p>
 
   <div class="tz-gallery">

        <div class="row">

<%
if(list.size() == 0){
	%>
	 <div class="thumbnail">          
         <div class="caption">       
             <p>작성된 글이 없습니다</p>
          </div>
     </div>
	<%
}
	
	for(int i = 0; i< list.size(); i++){
		BbsDto bbs = list.get(i);	
		%>
		  <div class="col-sm-6 col-md-4">
				 <div class="thumbnail">
                    <a class="lightbox" href="bbs?param=bbsDetail&seq=<%=bbs.getSeq() %>">   <!-- 디테일  -->
                        <img  src="./upload/<%=bbs.getFilename()%>" style='max-height:100px;'>  	<!-- 리스트 -->
                    </a>
                    <div class="caption">
                        <h3><%=bbs.getTitle() %></h3>
                        <h3><%=bbs.getMyid() %></h3>
                        <p><%=bbs.getWdate() %></p>
                    </div>
               </div>
      </div>

		
	<% 
	}
 %>


</div>
</div>
</div>


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




<br><br>
<div align="center">

<select id="choice"> 
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBbs()">검색</button>
<br><br>
</div>

<%if(mem != null ) {%>
<div class="sub_wr">
<br><br>	
<input id="_bbsSbnBtn" type="button" value="글쓰기" >
<br><br>
<%} %>

</div>
</div>

<script type="text/javascript">
$("#_bbsSbnBtn").click(function() {
	location.href="bbs?param=bbsWrite";
});

function searchBbs(pageNum) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "bbs?param=getPagingBbsList&choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "bbs?param=getPagingBbsList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}

</script>
</body>
</html>