<%@page import="Dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.BbsDto"%>
<%@page import="Dto.MemberDto"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ServletConfig mConfig = null;
	final int BUFFER_SIZE = 8192;
	
	
		mConfig = config;	
	
	String fupload = mConfig.getServletContext().getRealPath("/upload");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 디테일</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}


</style>
</head>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%>
<%
BbsDto dto = (BbsDto)request.getAttribute("detail");


%>
<%

int manager = 0;
String id = "";
int seq = 0;

if(mem!=null){
	manager = mem.getMymanager();
	id = mem.getMyid();
}

if(dto!=null){
	seq = dto.getSeq();
}

//댓글 관련 필요 요소
List<CommentDto> list = (List<CommentDto>)request.getAttribute("list");
int pages = Integer.parseInt((String)request.getAttribute("page"));
int viewPage = Integer.parseInt((String)request.getAttribute("viewPage"));
%>
<body>

<div class="container" id="text1">
	<table>
	
	
	


<tr>
	<th>작성자</th>
	<td><%=dto.getMyid() %></td>
</tr>

<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getVcount() %></td>
</tr>
<tr>
	<th>이미지</th>
	<td>
		<img class="uploadImage" alt="" src="./upload/<%=dto.getFilename()%>" style="max-width: 600px; max-height: 600px;">
		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td align="center">
	<textarea rows="10" cols="90" readonly="readonly"><%=dto.getMycontent()%></textarea>
	</td>
</tr>
</table>
<!-- 댓글 쓰기 -->
<form action="./comment" method='post'>
<input type='hidden' name='param' value='write'>
<input type='hidden' name='urlParam' value='openDetail'>
<input type='hidden' name='seq' value=<%=seq %>>
<input type='hidden' name='url' value='freeb'>
<input type='hidden' name='myId' value=<%=id %>>
<input type='hidden' name='free' value='1'>

<%
if(!(id.equals(""))){
%>
<table class='table' width='100%'>
    <tr>
		<td>
			<div class='row'>
				<div class='col-10'>
					<input type='text' class='form-control' name='content' placeholder='댓글을 입력하세요'>
				</div>
				<div class='col=2'>
					<input type='submit' class='btn btn-secondary' value='입력완료'>
				</div>
			</div>
		</td>
	</tr>
</table>
</form>
<%
}
%>




<!-- 댓글 불러오기 -->
<%
if(list != null){
%>
<table class='table' width='100%'>
	<tr>
	<td><br></td><td><br></td><td><br></td>
	</tr>
<%
for(int i=0; i<list.size(); i++){
	CommentDto cmt = list.get(i);
%>
	
	<tr>
		<td><%=cmt.getMyID() %></td>
		<td>
		<input type='text' class='form-control' name='content' value=<%=cmt.getContent() %>>
		</td>
		<!-- 로그인 아이디와 글쓴이가 같거나 매니저라면 수정/삭제 버튼 보이기 -->
		<%
		if(manager==1 || cmt.getMyID().equals(id)){
		%>
		<td>	
		<input type='button'  data-toggle="modal" data-target="#myModal1" value='수정' onclick="commentSeq('<%=dto.getSeq()%>')">
		<input type='button'  data-toggle="modal" data-target="#myModal2" value='삭제' onclick="commentSeq('<%=dto.getSeq()%>')">
		</td>
	</tr>
	<%
		}
	%>
<%
} // for
%>
</table>	
	

<!-- 댓글 페이징  -->
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
		<a href="#none" onclick="goPage('<%=i %>',)"
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
	


<!-- 댓글 수정 Modal창 -->
  <div class="modal" id="myModal1">
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
  
  
  
  <!-- 댓글 삭제 Modal -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">정말 삭제하시겠습니까</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
     
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="commentDelete()">예</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">아니오</button>
        </div>
        
      </div>
    </div>
  </div>
<% 
// 글쓴이와 로그인 한 사람이 같거나 매니저라면
if(dto.getMyid().equals(mem.getMyid()) || (mem.getMymanager()==1)){
%>
<div class="utill4">
<button type="button" class="btn btn-warning" onclick="updateBtn(<%=dto.getSeq() %>)">수정</button>
<button type="button" class="btn btn-warning" onclick="deleteBtn(<%=dto.getSeq() %>)">삭제</button>
</div>
<%
}
%>


<br>
<div class="utill4">
<button type="button" class="btn btn-warning" OnClick="listBtn()">목록</button>
</div>
</div>

<script type="text/javascript">
function updateBtn( seq ) {
	location.href = "freeb?param=updateFree&seq=" + seq;
}


function deleteBtn(seq){
	location.href = "freeb?param=deleteFree&seq=" + seq;
}
function listBtn() {
	location.href = "freeb?param=toFreeboardlist"
}
function commentSeq(num){
	commSeq = num;
}

function updateFinish(){
	let content = $('#newContent').val();      
	location.href = "comment?param=update&commSeq="+commSeq+"&content="+content+"&seq="+<%=seq %>+
			        "&url=freeb&urlParam=openDetail"
}

function commentDelete(){
	location.href = "comment?param=delete&commSeq="+commSeq+"&seq="+<%=seq %>+
	                "&url=freeb&urlParam=openDetail"
}
</script>


</body>



</html>