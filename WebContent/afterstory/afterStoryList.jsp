<%@page import="java.lang.annotation.AnnotationFormatError"%>
<%@page import="java.util.List"%>
<%@page import="Dao.afterStoryDao"%>
<%@page import="Dto.afterStoryDto"%>
<%@page import="Dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto) session.getAttribute("login");
%>


<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link rel="stylesheet" href="css/thumbnail-gallery.css">

<meta charset="utf-8">
<title>afterStoryList</title>
</head>
<body>

<%
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}

afterStoryDao dao = afterStoryDao.getInstance();

List<afterStoryDto> list = (List<afterStoryDto>)request.getAttribute("list");

int afPage = Integer.parseInt((String)request.getAttribute("afPage"));
System.out.println("afPage:" +afPage);

int pageNum = Integer.parseInt((String)request.getAttribute("pageNum"));
System.out.println("pageNum:" + pageNum);

int len = Integer.parseInt((String)request.getAttribute("len"));
System.out.println("len:"+ len);

 %>
 
 
<script type="text/javascript" >
$(document).ready(function() {
	// 검색어 있는 경우
	let search = "<%=search %>";
	if(search == "") return;
	alert(search);
	// select
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});
</script>

 

 <div class="container gallery-container">

    <h1> AFTER STORY LIST</h1>
 <p class="page-description text-center">우리집 강아지를 자랑하세요</p>
 
   <div class="tz-gallery">

        <div class="row">
 	   	
<% 	
	if(list ==null || list.size() ==0){
%>
				 <div class="thumbnail">
                  
                    <div class="caption">
                       
                        <p>작성된 글이 없습니다</p>
                    </div>
                </div>
																														   																																		   
<% 		
} else{
	for(int i = 0; i<list.size(); i++){
	afterStoryDto dto = list.get(i);
%>		
	 <%
	 	if(dto.getDel() == 0){
	 %>
	  <div class="col-sm-6 col-md-4">
				 <div class="thumbnail">
                    <a class="lightbox" href="after?param=afterStoryDetail&seq=<%=dto.getSeq() %>">   <!-- 디테일  -->
                        <img  src="./upload/<%=dto.getFilename()%>" style='max-height:100px;'>  	<!-- 리스트 -->
                    </a>
                    <div class="caption">
                        <h3><%=dto.getTitle() %></h3>
                        <p><%=dto.getWdate() %></p>
                    </div>
               </div>
      </div>
 <%
} else{
%> 			
<%			 
	}
		}
}
%>    
	<!-- </ul> -->	
			</div>
	</div>
</div>


<!-- 페이지  -->
<div class=" sub_page ">
<%
for(int i=0; i<afPage; i++){
	if(pageNum == i){	// 현재 페이지
		%>
		<span class="page_2" ><%=i+1 %></span>
<%} else{ %>
		 <a href="#none" title="<%=i+1 %>페이지" onclick="afterPage(<%=i %>)"
		 	class="page_1">
		 	[<%=i + 1 %>]
		 </a>
		 
		 <%
	}
}
%> 

<!-- 글쓰기  -->
<%if(mem != null ) {%>
<div class=" sub_wr " align='center'>
<a class='btn' href="index.jsp?content=./afterstory/afterStoryWrite" > 자랑하기 </a>
</div>
<%} %>
</div>

<br><br>





<!-- 검색  -->
<br><br>
<div class=" sub_sea ">
<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>
<input type="text" id="search" value="<%=search%>">
<button type="button" onclick="afterSearch()">검색</button>
</div>





<script type="text/javascript">
function afterSearch() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "after?param=afterstoryList&choice=" + choice + "&search=" + search;

}

function afterPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "after?param=afterstoryList&choice=" + choice + "&search=" + search + "&pageNum=" + pageNum;	
}

</script>



</body>
</html>