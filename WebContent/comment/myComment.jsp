<%@page import="Dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--bootstarp-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

<!-- 각각의 게시판에 추가한다!! -->

<%
int seq = 10;
String myId = "id";

List<CommentDto> list = (List<CommentDto>)request.getAttribute("list");
int pages = Integer.parseInt((String)request.getAttribute("page"));
int viewPage = Integer.parseInt((String)request.getAttribute("viewPage"));
String goWhere = "./bbs/bbsdetail";
%>


<!-- 로그인 시에만 보이기 -->
<form action="./comment" method='post'>
<input type='hidden' name='param' value='write'>
<input type='hidden' name='seq' value=<%=seq %>>
<input type='hidden' name='goWhere' value='./bbs/bbsdetail'>
<input type='hidden' name='myId' value=<%=myId %>>
<table border=1>
	<tr>
		<td><%=myId %><td>
		<td><textarea rows='2' cols='30' name='content'></textarea><td>
		<td><input type='submit' value='댓글쓰기'></td>
	</tr>
</table>
</form>


<%
if(list != null){
%>
<table border=1>
<tr>
<th colspan='4'>댓글</th>
</tr>
<%
for(int i=0; i<list.size(); i++){
	CommentDto dto = list.get(i);
%>
	<tr>
		<td><%=dto.getId() %></td>
		<td><textarea rows='2' cols='30' name='contentUpdate' id='contentUpdate' readonly='readonly'><%=dto.getContent() %></textarea></td>
		<!-- 로그인 아이디와 같거나 매니저라면 수정버튼 보이기 -->
		<td>
		<input type='button'  data-toggle="modal" data-target="#myModal" value='수정' onclick="commentUpdate('<%=dto.getSeq()%>', '<%=goWhere %>')">
		<input type='button' value='삭제' onclick="commentDelete('<%=dto.getSeq()%>', '<%=goWhere %>')">
		</td>
	</tr>
<%
} // for
%>
</table>



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
		<a href="#none" onclick="goPage('<%=i %>', '<%=goWhere %>')"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
		</a>&nbsp;	
		<%
	}	
}
%>
</div>

<%
} // if
%>




<!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">수정할 내용을 입력하세요</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <input type='text' id='newContent'>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" onclick='updateFinish()'>수정 완료</button>        
          <button type="button" class="btn btn-danger" data-dismiss="modal">수정 취소</button>
        </div>
        
      </div>
    </div>
  </div>



<script>
let seq = 0;
let goWhere = "";
function commentDelete(seq, go) {
	location.href = "comment?param=delete&seq="+seq+"&goWhere="+go
}


function goPage(pageNumber, go){
	location.href = "comment?param=list&pageNumber="+pageNumber+"&goWhere="+go
}


function commentUpdate(num, go){
	seq = num;
	goWhere = go;
}

function updateFinish(){
	let content = $('#newContent').val();
	location.href = "comment?param=update&seq="+seq+"&goWhere="+goWhere+"&content="+content
}

</script>




</body>
</html>